// © 2017 George King. Permission to use this file is granted in license-quilt.txt.


public typealias MutPtr = UnsafeMutablePointer

extension MutPtr {

  public init(copy: Pointee, count: Int = 1) {
    self = MutPtr.allocate(capacity: count)
    initialize(repeating: copy, count: count)
  }

  public init<C: Collection>(copy collection: C) where C.Element == Pointee {
    let count = Int(collection.count)
    self = MutPtr.allocate(capacity: count)
    _ = MutBuffer(start: self, count: count).initialize(from: collection)
  }
}
