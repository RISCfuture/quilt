// © 2014 George King. Permission to use this file is granted in license-quilt.txt.


public typealias Action = () -> ()
public typealias Predicate = () -> Bool


public let always: Predicate = { return true }
public let never: Predicate = { return false }


public func apply<T>(_ obj: T, body: (T)->()) -> T {
  body(obj)
  return obj
}


public func with<T>(_ obj: T, body: (T)->()) {
  body(obj)
}
