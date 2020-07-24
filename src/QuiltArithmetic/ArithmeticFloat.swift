// © 2016 George King. Permission to use this file is granted in license-quilt.txt.

import Darwin


public typealias F32 = Float
public typealias F64 = Double

public protocol ArithmeticFloat: ArithmeticProtocol, BinaryFloatingPoint {}

extension F32: ArithmeticFloat {}
extension F64: ArithmeticFloat {}
