// © 2015 George King. Permission to use this file is granted in license-quilt.txt.
// This file is generated by gen/vec.py.

import Darwin
import simd
import QuiltArithmetic
import SceneKit
import QuiltVec
import QuiltUI


public typealias V4 = SCNVector4
extension V4: Vec, Vec4 { // Float/Int agnostic.
  public typealias Scalar = CGFloat
  public typealias VFType = V4F
  public typealias VDType = V4D
  public typealias VU8Type = V4U8
  public typealias V2Type = V2

  public init(_ v: V4F) {
    self.init(Scalar(v.x), Scalar(v.y), Scalar(v.z), Scalar(v.w))
  }
  public init(_ v: V4D) {
    self.init(Scalar(v.x), Scalar(v.y), Scalar(v.z), Scalar(v.w))
  }
  public init(_ v: V4I) {
    self.init(Scalar(v.x), Scalar(v.y), Scalar(v.z), Scalar(v.w))
  }
  public init(_ v: V4I8) {
    self.init(Scalar(v.x), Scalar(v.y), Scalar(v.z), Scalar(v.w))
  }
  public init(_ v: V4I16) {
    self.init(Scalar(v.x), Scalar(v.y), Scalar(v.z), Scalar(v.w))
  }
  public init(_ v: V4I32) {
    self.init(Scalar(v.x), Scalar(v.y), Scalar(v.z), Scalar(v.w))
  }
  public init(_ v: V4U8) {
    self.init(Scalar(v.x), Scalar(v.y), Scalar(v.z), Scalar(v.w))
  }
  public init(_ v: V4U16) {
    self.init(Scalar(v.x), Scalar(v.y), Scalar(v.z), Scalar(v.w))
  }
  public init(_ v: V4U32) {
    self.init(Scalar(v.x), Scalar(v.y), Scalar(v.z), Scalar(v.w))
  }
  public init(_ v: V3, w: Scalar) {
    self.init(v.x, v.y, v.z, w)
  }

  public subscript(index: Int) -> Scalar {
    get {
      switch index {
      case 0: return x
      case 1: return y
      case 2: return z
      case 3: return w
      default: fatalError("subscript out of range: \(index)")
      }
    }
    set {
      switch index {
      case 0: x = newValue
      case 1: y = newValue
      case 2: z = newValue
      case 3: w = newValue
      default: fatalError("subscript out of range: \(index)")
      }
    }
  }

  public static var scalarCount: Int { 4 }
  public static var zero: Self { Self.init() }
  public static var one: Self { Self.init(1, 1, 1, 1) }

  public func dot(_ b: V4) -> F64 {
    var s = x.asF64 * b.x.asF64
    s += y.asF64 * b.y.asF64
    s += z.asF64 * b.z.asF64
    s += w.asF64 * b.w.asF64
    return s
  }

public static func +(a: V4, b: V4) -> V4 { V4(a.x + b.x, a.y + b.y, a.z + b.z, a.w + b.w) }
public static func -(a: V4, b: V4) -> V4 { V4(a.x - b.x, a.y - b.y, a.z - b.z, a.w - b.w) }
public static func *(a: V4, b: V4) -> V4 { V4(a.x * b.x, a.y * b.y, a.z * b.z, a.w * b.w) }
public static func /(a: V4, b: V4) -> V4 { V4(a.x / b.x, a.y / b.y, a.z / b.z, a.w / b.w) }
public static func +(a: V4, s: CGFloat) -> V4 { V4(a.x + s, a.y + s, a.z + s, a.w + s) }
public static func -(a: V4, s: CGFloat) -> V4 { V4(a.x - s, a.y - s, a.z - s, a.w - s) }
public static func *(a: V4, s: CGFloat) -> V4 { V4(a.x * s, a.y * s, a.z * s, a.w * s) }
public static func /(a: V4, s: CGFloat) -> V4 { V4(a.x / s, a.y / s, a.z / s, a.w / s) }
public static prefix func -(a: V4) -> V4 { a * -1 }
}


extension V4: FloatVec, FloatVec4 { // Float-specific.

  public var allFinite: Bool { x.isFinite && (y.isFinite && (z.isFinite && (w.isFinite))) }
  public var allZero: Bool { x.isZero && (y.isZero && (z.isZero && (w.isZero))) }
  public var allZeroOrSubnormal: Bool { x.isZeroOrSubnormal && (y.isZeroOrSubnormal && (z.isZeroOrSubnormal && (w.isZeroOrSubnormal))) }
  public var anySubnormal: Bool { x.isSubnormal || (y.isSubnormal || (z.isSubnormal || (w.isSubnormal)))}
  public var anyInfite: Bool { x.isInfinite || (y.isInfinite || (z.isInfinite || (w.isInfinite)))}
  public var anyNaN: Bool { x.isNaN || (y.isNaN || (z.isNaN || (w.isNaN)))}
  public var anyZero: Bool { x.isZero && (y.isZero && (z.isZero && (w.isZero))) }
  public var anyZeroOrSubnormal: Bool { x.isZeroOrSubnormal || (y.isZeroOrSubnormal || (z.isZeroOrSubnormal || (w.isZeroOrSubnormal))) }
  public var clampToUnit: V4 { V4(x.clamp(min: 0, max: 1), y.clamp(min: 0, max: 1), z.clamp(min: 0, max: 1), w.clamp(min: 0, max: 1)) }
  public var clampToSignedUnit: V4 { V4(x.clamp(min: -1, max: 1), y.clamp(min: -1, max: 1), z.clamp(min: -1, max: 1), w.clamp(min: -1, max: 1)) }
  public var toU8Pixel: VU8Type { VU8Type(U8((x*255).clamp(min: 0, max: 255)), U8((y*255).clamp(min: 0, max: 255)), U8((z*255).clamp(min: 0, max: 255)), U8((w*255).clamp(min: 0, max: 255))) }
}


extension V4: Equatable {
  public static func ==(a: V4, b: V4) -> Bool {
    if a.x != b.x { return false }
    if a.y != b.y { return false }
    if a.z != b.z { return false }
    return a.w == b.w
  }
  public static func !=(a: V4, b: V4) -> Bool {
    if a.x == b.x { return false }
    if a.y == b.y { return false }
    if a.z == b.z { return false }
    return a.w != b.w
  }
}

extension V4: Comparable {
  public static func <(a: V4, b: V4) -> Bool {
    if a.x != b.x { return a.x < b.x }
    if a.y != b.y { return a.y < b.y }
    if a.z != b.z { return a.z < b.z }
    return a.w < b.w
  }
}

extension V4: CustomStringConvertible {
  public var description: String { "V4(\(x), \(y), \(z), \(w))" }
}

