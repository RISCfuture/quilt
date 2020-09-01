#!/usr/bin/env python3
# © 2015 George King. Permission to use this file is granted in license-quilt.txt.

from sys import argv
from argparse import ArgumentParser
from gen_util import *
from typing import *

'''
Generate Swift extension code for a single geometric vector type.
'''


def main():
  parser = ArgumentParser()
  parser.add_argument('type') # The name of the vector type.
  parser.add_argument('-alias', default='') # Specify if we are aliasing a type; otherwise using its original name.
  parser.add_argument('-dim', type=int) # The dimension of the vector (2, 3, or 4).
  parser.add_argument('-scalar') # The scalar type of the vector.
  parser.add_argument('-imports', nargs='+', default=[]) # A list of additional imports.
  args = parser.parse_args()

  outL('''\
// © 2015 George King. Permission to use this file is granted in license-quilt.txt.
// This file is generated by gen/vec.py.

import Darwin
import simd
import QuiltArithmetic\
''')

  v_type = args.type
  is_simd = v_type.startswith('SIMD')
  is_scn = args.alias.startswith('SCNVector')

  vi_type = v_type + '<Scalar>' if is_simd else v_type # The vector instance type (for when the Self type is generic). TODO: use Self?

  try: dim = int(v_type[-1])
  except ValueError: dim = 2

  scalar = args.scalar or 'Scalar'

  # `v_prev` is the lower dimension vector type, e.g. v_type=V3S, v_prev=V2S. TODO: rename v_lower?
  if dim == 2: v_prev = None
  elif is_simd: v_prev = f'SIMD{dim-1}<Scalar>'
  else: v_prev = f'{v_type[:-1]}{dim-1}'

  needs_zero = is_simd or is_scn
  needs_equatable = is_scn
  needs_comparable = not is_simd
  needs_convertible = not is_simd
  needs_codable = False # TODO

  for import_name in args.imports:
    outL('import $', import_name)
  outL()
  outL()

  if args.alias:
    outL('public typealias $ = $', v_type, args.alias)

  comps = all_v_comps[:dim]
  comps_a = ['a.' + c for c in comps]
  comps_b = ['b.' + c for c in comps]
  comps_ab = [p for p in zip(comps_a, comps_b)]
  public = '' if is_simd else 'public '
  is_float = scalar.startswith('F')
  is_signed = not scalar.startswith('U')

  ext_where_clause = 'where Scalar: ArithmeticProtocol ' if is_simd else ''

  outL('extension $: Vec, Vec$ ${ // Float/Int agnostic.', v_type, dim, ext_where_clause)

  if not is_simd:
    outL('  public typealias Scalar = $', scalar)

  outL('  public typealias VSType = V$S', dim)
  outL('  public typealias VDType = V$D', dim)
  outL('  public typealias VU8Type = V$U8', dim)

  outL()
  for d in range(dim, 5):
    for t in types:
      if d == dim and t.scalar == scalar:
        continue
      vt = fmt('V$$', d, t.suffix)
      outL('  public init(_ v: $) {', vt)
      outL('    self.init($)', jcf('Scalar(v.$)', comps))
      outL('  }')

  if v_prev:
    last_comp = comps[dim - 1]
    outL('  public init(_ v: $, $: Scalar) {', v_prev, last_comp)
    outL('    self.init($)', jc(fmt('v.$', c) if i < dim - 1 else last_comp for i, c in enumerate(comps)))
    outL('  }')

  if needs_codable:
    outL('  public init(from decoder: Decoder) throws {')
    outL('    var c = try decoder.unkeyedContainer()')
    outL('    self.init($)', jc(fmt('try c.decode($.self)', scalar) for _ in range(dim)))
    outL('  }')

  outL()
  outL('  public static var scalarCount: Int { $ }', dim)

  if needs_zero:
    outL('  public static var zero: Self { Self.init() }')

  outL()
  for c in comps:
    outL('  public static var unit$: $ { $($) }',
      c.upper(), vi_type, v_type, jc('1' if d == c else '0' for d in comps))

  outL()
  outL('  public var vs: V$S { V$S($) }', dim, dim, jcf('$.asF32', comps))
  outL('  public var vd: V$D { V$D($) }', dim, dim, jcf('$.asF64', comps))

  outL()
  outL('  public var sqrLen: F64 {')
  outL('    var s = x.asF64.sqr')
  for c in comps[1:]:
    outL('    s += $.asF64.sqr', c)
  outL('    return s')
  outL('}')

  outL()
  outL('  public var aspect: F64 { x.asF64 / y.asF64 }')

  # TODO: swizzles.

  outL()
  outL('  public func dot(_ b: $) -> F64 {', vi_type)
  outL('    var s = x.asF64 * b.x.asF64')
  for c in comps[1:]:
    outL('    s += $.asF64 * b.$.asF64', c, c)
  outL('    return s')
  outL('  }')
  outL()

  if scalar == 'U8':
    outL('  public var toSPixel: VSType { VSType($) }', jcf('$.asF32 / F32(0xFF)', comps))

  if not is_simd:
    for op in ops:
      cons_comps_v = jc(fmt('$ $ $', a, op, b) for a, b in comps_ab) # e.g. 'a.x + b.x'.
      outL('public static func $(a: $, b: $) -> $ { $($) }', op, v_type, v_type, v_type, v_type, cons_comps_v)
    for op in ops:
      cons_comps_s = jc(fmt('$ $ s', a, op) for a in comps_a) # e.g. 'a.x + s'.
      outL('public static func $(a: $, s: $) -> $ { $($) }', op, v_type, scalar, v_type, v_type, cons_comps_s)

    if is_signed:
      outL('public static prefix func -(a: $) -> $ { a * -1 }', v_type, v_type)

  outL('}\n\n')

  float_ext_where_clause = 'where Scalar: ArithmeticFloat ' if is_simd else ''
  outL('extension $: FloatVec, FloatVec$ ${ // Float-specific.', v_type, dim, float_ext_where_clause)

  outL('')
  outL('  public var allFinite: Bool { $ }', jfra(' && ', '$.isFinite', comps))
  outL('  public var allZero: Bool { $ }', jfra(' && ', '$.isZero', comps))
  outL('  public var allZeroOrSubnormal: Bool { $ }', jfra(' && ', '$.isZeroOrSubnormal', comps))
  outL('  public var anySubnormal: Bool { $}', jfra(' || ', '$.isSubnormal', comps))
  outL('  public var anyInfite: Bool { $}', jfra(' || ', '$.isInfinite', comps))
  outL('  public var anyNaN: Bool { $}', jfra(' || ', '$.isNaN', comps))
  outL('  public var anyZero: Bool { $ }', jfra(' && ', '$.isZero', comps))
  outL('  public var anyZeroOrSubnormal: Bool { $ }', jfra(' || ', '$.isZeroOrSubnormal', comps))
  outL('  public var clampToUnit: $ { $($) }', v_type, v_type, jcf('$.clamp(min: 0, max: 1)', comps))
  outL('  public var clampToSignedUnit: $ { $($) }', v_type, v_type, jcf('$.clamp(min: -1, max: 1)', comps))
  outL('  public var toU8Pixel: VU8Type { VU8Type($) }', jcf('U8(($*255).clamp(min: 0, max: 255))', comps))

  if dim >= 3:
    outL('')
    cross_pairs = ['yz', 'zx', 'xy', '__'][:dim]
    outL('  public func cross(_ b: $) -> $ { $(', v_type, v_type, v_type)
    for i, (a, b) in enumerate(cross_pairs):
      if a == '_':
        outL('    0')
      else:
        comma = '' if i == dim - 1 else ','
        outL('      $ * b.$ - $ * b.$$', a, b, b, a, comma)
    outL('    )')
    outL('  }')

  outL('}\n\n')


  if is_simd and False:
    outL('extension $: IntVec, IntVec$ where Scalar: SignedArithmeticInt { // Int-specific.', v_type, dim)
    outL('}\n\n')

  if needs_codable:
    errFL('TODO: Decodable')


  if needs_equatable:
    outL('extension $: Equatable {', v_type)
    outL('  public static func ==(a: $, b: $) -> Bool {', v_type, v_type)
    for i, c in enumerate(comps, 1):
      if i < len(comps):
        outL('    if a.$ != b.$ { return false }', c, c)
      else:
        outL('    return a.$ == b.$', c, c)
    outL('  }')

    outL('  public static func !=(a: $, b: $) -> Bool {', v_type, v_type)
    for i, c in enumerate(comps, 1):
      if i < len(comps):
        outL('    if a.$ == b.$ { return false }', c, c)
      else:
        outL('    return a.$ != b.$', c, c)
    outL('  }')
    outL('}\n')


  if needs_comparable:

    outL('extension $: Comparable {', v_type)

    outL('  public static func <(a: $, b: $) -> Bool {', v_type, v_type)
    for i, c in enumerate(comps, 1):
      if i < len(comps):
        outL('    if a.$ != b.$ { return a.$ < b.$ }', c, c, c, c)
      else:
        outL('    return a.$ < b.$', c, c)
    outL('  }')
    outL('}\n')


  if needs_convertible:
    outL('extension $: CustomStringConvertible {', v_type)
    outL('  public var description: String { "$($)" }', v_type, jcf('\\($)', comps))
    outL('}\n')



if __name__ == '__main__': main()
