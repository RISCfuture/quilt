// © 2017 George King. Permission to use this file is granted in license-quilt.txt.

import Darwin


let sysPageSize = Int(Darwin.getpagesize())
// TODO: decide if this optimizes out sufficiently or if OPT mode should hardcode per OS (usually 0x1000).

let sysPathSep: String = "/"
let sysPathSepChar: Character = "/"
let sysPathSepScalar: UnicodeScalar = "/"

let sysHomePrefix = "~"
let sysHomePrefixChar: Character = "~"

#if os(OSX) || os(iOS)
let sysHomeDirString = "/Users/"
let sysHomeDirStringNoSlash = "/Users"
#endif
