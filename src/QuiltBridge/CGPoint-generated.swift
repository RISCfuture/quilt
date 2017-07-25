// © 2015 George King. Permission to use this file is granted in license-quilt.txt.
// This file is generated by gen/vec.py.

import Darwin
import simd
import CoreGraphics
import Quilt
extension CGPoint : VecType2, FloatVecType, CustomStringConvertible {
  public typealias Scalar = Flt
  public typealias FloatType = Flt
  public typealias VSType = V2S
  public typealias VDType = V2D
  public typealias VU8Type = V2U8
  public init(_ v: V2S) {
    self.init(Scalar(v.x), Scalar(v.y))
  }
  public init(_ v: V2D) {
    self.init(Scalar(v.x), Scalar(v.y))
  }
  public init(_ v: V2I) {
    self.init(Scalar(v.x), Scalar(v.y))
  }
  public init(_ v: V2U8) {
    self.init(Scalar(v.x), Scalar(v.y))
  }
  public init(_ v: V3S) {
    self.init(Scalar(v.x), Scalar(v.y))
  }
  public init(_ v: V3D) {
    self.init(Scalar(v.x), Scalar(v.y))
  }
  public init(_ v: V3I) {
    self.init(Scalar(v.x), Scalar(v.y))
  }
  public init(_ v: V3U8) {
    self.init(Scalar(v.x), Scalar(v.y))
  }
  public init(_ v: V4S) {
    self.init(Scalar(v.x), Scalar(v.y))
  }
  public init(_ v: V4D) {
    self.init(Scalar(v.x), Scalar(v.y))
  }
  public init(_ v: V4I) {
    self.init(Scalar(v.x), Scalar(v.y))
  }
  public init(_ v: V4U8) {
    self.init(Scalar(v.x), Scalar(v.y))
  }
  public static let unitX = CGPoint(1, 0)
  public static let unitY = CGPoint(0, 1)
  public var description: String { return "CGPoint(\(x), \(y))" }
  public var vs: V2S { return V2S(F32(x), F32(y)) }
  public var vd: V2D { return V2D(F64(x), F64(y)) }
  public var sqrLen: FloatType { return (FloatType(x).sqr + FloatType(y).sqr) }
  public var aspect: FloatType { return FloatType(x) / FloatType(y) }
  public var l: Scalar {
    get { return x }
    set { x = newValue }
  }
  public var a: Scalar {
    get { return y }
    set { y = newValue }
  }

  public var allNormal: Bool { return x.isNormal && y.isNormal }
  public var allFinite: Bool { return x.isFinite && y.isFinite }
  public var allZero: Bool { return x.isNormal && y.isNormal }
  public var anySubnormal: Bool { return x.isSubnormal || y.isSubnormal}
  public var anyInfite: Bool { return x.isInfinite || y.isInfinite}
  public var anyNaN: Bool { return x.isNaN || y.isNaN}
  public var norm: CGPoint { return self / self.len }
  public var clampToUnit: CGPoint { return CGPoint(clamp(x, min: 0, max: 1), clamp(y, min: 0, max: 1)) }
  public var toU8Pixel: VU8Type { return VU8Type(U8(clamp(x * 255, min: 0, max: 255)), U8(clamp(y * 255, min: 0, max: 255))) }
  public var heading: Scalar { return atan2(y, x) }

  public func dot(_ b: CGPoint) -> Scalar { return (x * b.x) + (y * b.y) }
  public func angle(_ b: CGPoint) -> Scalar { return acos(self.dot(b) / (self.len * b.len)) }
  public func lerp(_ b: CGPoint, _ t: Scalar) -> CGPoint { return self * (1 - t) + b * t }

}

public func +(a: CGPoint, b: CGPoint) -> CGPoint { return CGPoint(a.x + b.x, a.y + b.y) }
public func -(a: CGPoint, b: CGPoint) -> CGPoint { return CGPoint(a.x - b.x, a.y - b.y) }
public func *(a: CGPoint, b: CGPoint) -> CGPoint { return CGPoint(a.x * b.x, a.y * b.y) }
public func /(a: CGPoint, b: CGPoint) -> CGPoint { return CGPoint(a.x / b.x, a.y / b.y) }
public func +(a: CGPoint, s: Flt) -> CGPoint { return CGPoint(a.x + s, a.y + s) }
public func -(a: CGPoint, s: Flt) -> CGPoint { return CGPoint(a.x - s, a.y - s) }
public func *(a: CGPoint, s: Flt) -> CGPoint { return CGPoint(a.x * s, a.y * s) }
public func /(a: CGPoint, s: Flt) -> CGPoint { return CGPoint(a.x / s, a.y / s) }
public prefix func -(a: CGPoint) -> CGPoint { return a * -1 }

