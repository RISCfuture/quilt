// © 2020 George King. Permission to use this file is granted in license-quilt.txt.


import Foundation


public protocol Quaternion: CustomDebugStringConvertible, Equatable {

  associatedtype Scalar: SIMDScalar
  associatedtype Vector: FloatVec4 where Vector.Scalar == Scalar

  var vector: Vector { get set }

  var angle: Vector.Scalar { get }
  var axis: SIMD3<Scalar> { get }

  init()

  init(vector: Vector)
}


public extension Quaternion {

  static var dflt: Self { Self(vector: Vector(1, 0, 0, 0)) }

  var angleAxisDesc: String {
    return "QF(angle: \(angle), axis: \(axis))"
  }
}
