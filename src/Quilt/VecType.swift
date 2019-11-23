// © 2015 George King. Permission to use this file is granted in license-quilt.txt.

import Darwin


public protocol VecType: Equatable, CustomStringConvertible {
  associatedtype Scalar: BinaryFloatingPoint
  associatedtype VSType: VecType
  associatedtype VDType: VecType

  static var scalarCount: Int { get }

  var x: Scalar { get }
  var y: Scalar { get }
  var vs: VSType { get }
  var vd: VDType { get }
  var sqrLen: F64 { get }

  var clampToUnit: Self { get }

  static func +(l: Self, r: Self) -> Self
  static func -(l: Self, r: Self) -> Self
  static func *(l: Self, r: Scalar) -> Self
  static func /(l: Self, r: Scalar) -> Self

  func dot(_ b: Self) -> F64
}


extension VecType {

  public var len: F64 { return sqrLen.sqrt }
  public var heading: F64 { return atan2(F64(y), F64(x)) }
  public var norm: Self { return self / Scalar(self.len) }

  public func angle(_ b: Self) -> F64 { return acos(self.dot(b) / (self.len * b.len)) }
  public func dist(_ b: Self) -> F64 { return (b - self).len }
  public func lerp(_ b: Self, _ t: Scalar) -> Self { return self * (1 - t) + b * t }
  public func mid(_ b: Self) -> Self { return (self + b) / 2 }
}

public protocol VecType2: VecType {
  init(_ x: Scalar, _ y: Scalar)
  var x: Scalar { get }
  var y: Scalar { get }
}

public protocol VecType3: VecType {
  init(_ x: Scalar, _ y: Scalar, _ z: Scalar)
  var x: Scalar { get }
  var y: Scalar { get }
  var z: Scalar { get }
}

public protocol VecType4: VecType {
  init(_ x: Scalar, _ y: Scalar, _ z: Scalar, _ w: Scalar)
  var x: Scalar { get }
  var y: Scalar { get }
  var z: Scalar { get }
  var w: Scalar { get }
}
