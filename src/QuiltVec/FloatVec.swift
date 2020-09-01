// © 2019 George King. Permission to use this file is granted in license-quilt.txt.

import QuiltArithmetic


public protocol FloatVec: Vec where Scalar: ArithmeticFloat {

  static func +(l: Self, r: Self) -> Self
  static func -(l: Self, r: Self) -> Self
  static func *(l: Self, r: Scalar) -> Self
  static func /(l: Self, r: Scalar) -> Self
  var clampToUnit: Self { get }
}


extension FloatVec {

  public var norm: Self { self / Scalar(self.len) }

  public func dist(_ b: Self) -> F64 { (b - self).len }

  public func lerp(_ b: Self, _ t: F64) -> Self {
    let ad: VDType = self.vd
    let bd: VDType = b.vd
    return Self.init(ad * (1-t) + bd*t)
  }

  public func mid(_ b: Self) -> Self { (self + b) / 2 }
}



public protocol FloatVec2: FloatVec, Vec2 {}



public protocol FloatVec3: FloatVec, Vec3 {}

extension FloatVec3 {
}



public protocol FloatVec4: FloatVec, Vec4 {}



extension Sequence where Element: FloatVec {

  public func mean() -> Element.VDType {
    var sum:Element.VDType = .zero
    var count = 0
    for el in self {
      sum = sum + el.vd
      count += 1
    }
    return sum / count.asF64
  }
}
