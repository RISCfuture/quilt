// © 2015 George King. Permission to use this file is granted in license-quilt.txt.
// This file is generated by gen/vec.py.

import Darwin
import simd


extension SIMD3: VecType, VecType3 where Scalar: ArithmeticFloat {
  public typealias VSType = V3S
  public typealias VDType = V3D
  public typealias VU8Type = V3U8

  public init(_ v: V3S) {
    self.init(Scalar(v.x), Scalar(v.y), Scalar(v.z))
  }
  public init(_ v: V3D) {
    self.init(Scalar(v.x), Scalar(v.y), Scalar(v.z))
  }
  public init(_ v: V3I) {
    self.init(Scalar(v.x), Scalar(v.y), Scalar(v.z))
  }
  public init(_ v: V3U8) {
    self.init(Scalar(v.x), Scalar(v.y), Scalar(v.z))
  }
  public init(_ v: V4S) {
    self.init(Scalar(v.x), Scalar(v.y), Scalar(v.z))
  }
  public init(_ v: V4D) {
    self.init(Scalar(v.x), Scalar(v.y), Scalar(v.z))
  }
  public init(_ v: V4I) {
    self.init(Scalar(v.x), Scalar(v.y), Scalar(v.z))
  }
  public init(_ v: V4U8) {
    self.init(Scalar(v.x), Scalar(v.y), Scalar(v.z))
  }
  public init(_ v: SIMD2<Scalar>, z: Scalar) {
    self.init(v.x, v.y, z)
  }

  public static var scalarCount: Int { return 3 }

  public static var unitX: SIMD3<Scalar> { return SIMD3(1, 0, 0) }
  public static var unitY: SIMD3<Scalar> { return SIMD3(0, 1, 0) }
  public static var unitZ: SIMD3<Scalar> { return SIMD3(0, 0, 1) }

  public var vs: V3S { return V3S(F32(x), F32(y), F32(z)) }
  public var vd: V3D { return V3D(F64(x), F64(y), F64(z)) }

  public var sqrLen: F64 {
    var s = F64(x.sqr)
    s += F64(y.sqr)
    s += F64(z.sqr)
    return s
}

  public var aspect: F64 { return F64(x) / F64(y) }

  public func dot(_ b: SIMD3<Scalar>) -> F64 {
    var s = F64(x) * F64(b.x)
    s += F64(y) * F64(b.y)
    s += F64(z) * F64(b.z)
    return s
  }


  public var allNormal: Bool { return x.isNormal && (y.isNormal && (z.isNormal)) }
  public var allFinite: Bool { return x.isFinite && (y.isFinite && (z.isFinite)) }
  public var allZero: Bool { return x.isZero && (y.isZero && (z.isZero)) }
  public var anySubnormal: Bool { return x.isSubnormal || (y.isSubnormal || (z.isSubnormal))}
  public var anyInfite: Bool { return x.isInfinite || (y.isInfinite || (z.isInfinite))}
  public var anyNaN: Bool { return x.isNaN || (y.isNaN || (z.isNaN))}
  public var clampToUnit: SIMD3 { return SIMD3(x.clamp(min: 0, max: 1), y.clamp(min: 0, max: 1), z.clamp(min: 0, max: 1)) }
  public var clampToSignedUnit: SIMD3 { return SIMD3(x.clamp(min: -1, max: 1), y.clamp(min: -1, max: 1), z.clamp(min: -1, max: 1)) }
  public var toU8Pixel: VU8Type { return VU8Type(U8((x*255).clamp(min: 0, max: 255)), U8((y*255).clamp(min: 0, max: 255)), U8((z*255).clamp(min: 0, max: 255))) }

  public func cross(_ b: SIMD3) -> SIMD3 { return SIMD3(
      y * b.z - z * b.y,
      z * b.x - x * b.z,
      x * b.y - y * b.x
    )
  }
}

