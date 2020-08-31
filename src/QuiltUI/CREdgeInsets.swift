// © 2015 George King. Permission to use this file is granted in license-quilt.txt.

#if os(OSX)
  import AppKit
  public typealias CREdgeInsets = NSEdgeInsets
  #else
  import UIKit
  public typealias CREdgeInsets = UIEdgeInsets
#endif


extension CREdgeInsets {

  public var l: Flt { left }
  public var t: Flt { top }
  public var r: Flt { right }
  public var b: Flt { bottom }

  public init(l: Flt = 0, t: Flt = 0, r: Flt = 0, b: Flt = 0) {
    self.init(top: t, left: l, bottom: b, right: r)
  }

  public init(x: Flt = 0, y: Flt = 0) {
    self.init(top: y, left: x, bottom: y, right: x)
  }

  public static let zero = CREdgeInsets(x: 0, y: 0)
}
