// © 2016 George King. Permission to use this file is granted in license-quilt.txt.


public let textOctChars = Set("01234567")
public let textDecChars = Set("0123456789")
public let textHexChars = Set("0123456789ABCDEFabcdef")
public let textSymHeadChars = Set("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz")
public let textSymTailChars = textSymHeadChars.union(textDecChars).union(["_"])
public let textFloatChars = textDecChars.union(["."])

public struct TextInitableError: Error {
  let line: Int
  let col: Int
  let msg: String
  let text: String
}

public protocol TextInitableIntegerType {
  init?(_ text: String, radix: Int)
}

extension TextInitableIntegerType {
  public init(text: String, pos: String.Index, end: String.Index, line: Int, col: Int) throws {
    var p = pos
    while p != end {
      if !textDecChars.contains(text[p]) {
        break
      }
      p = text.index(after: p)
    }
    let t = String(text[pos..<p])
    if let result = Self(t, radix: 10) {
      self = result
    } else {
      throw TextInitableError(line: line, col: col, msg: "invalid text for Int", text: t)
    }
  }
}

public protocol TextInitable {
  init(text: String, pos: String.Index, end: String.Index, line: Int, col: Int) throws
}

extension Int: TextInitableIntegerType, TextInitable {}
extension Uns: TextInitableIntegerType, TextInitable {}
extension I8: TextInitableIntegerType, TextInitable {}
extension U8: TextInitableIntegerType, TextInitable {}
extension I16: TextInitableIntegerType, TextInitable {}
extension U16: TextInitableIntegerType, TextInitable {}
extension I32: TextInitableIntegerType, TextInitable {}
extension U32: TextInitableIntegerType, TextInitable {}
extension I64: TextInitableIntegerType, TextInitable {}
extension U64: TextInitableIntegerType, TextInitable {}

extension String: TextInitable {
  public init(text: String, pos: String.Index, end: String.Index, line: Int, col: Int) throws {
    self = String(text[pos..<end])
  }
}
