// © 2015 George King. Permission to use this file is granted in license-quilt.txt.

import Darwin


public func stringForCurrentError() -> String {
  return String(cString: Darwin.strerror(Darwin.errno))
}
