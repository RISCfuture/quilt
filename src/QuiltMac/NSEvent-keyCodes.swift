// © 2016 George King. Permission to use this file is granted in license.txt.

import Foundation
import Quilt
//import Carbon.HIToolbox

extension UInt16 {
  public static var vKeyAnsiA: UInt16              { return  0x00 }
  public static var vKeyAnsiS: UInt16              { return  0x01 }
  public static var vKeyAnsiD: UInt16              { return  0x02 }
  public static var vKeyAnsiF: UInt16              { return  0x03 }
  public static var vKeyAnsiH: UInt16              { return  0x04 }
  public static var vKeyAnsiG: UInt16              { return  0x05 }
  public static var vKeyAnsiZ: UInt16              { return  0x06 }
  public static var vKeyAnsiX: UInt16              { return  0x07 }
  public static var vKeyAnsiC: UInt16              { return  0x08 }
  public static var vKeyAnsiV: UInt16              { return  0x09 }
  public static var vKeyAnsiB: UInt16              { return  0x0B }
  public static var vKeyAnsiQ: UInt16              { return  0x0C }
  public static var vKeyAnsiW: UInt16              { return  0x0D }
  public static var vKeyAnsiE: UInt16              { return  0x0E }
  public static var vKeyAnsiR: UInt16              { return  0x0F }
  public static var vKeyAnsiY: UInt16              { return  0x10 }
  public static var vKeyAnsiT: UInt16              { return  0x11 }
  public static var vKeyAnsi1: UInt16              { return  0x12 }
  public static var vKeyAnsi2: UInt16              { return  0x13 }
  public static var vKeyAnsi3: UInt16              { return  0x14 }
  public static var vKeyAnsi4: UInt16              { return  0x15 }
  public static var vKeyAnsi6: UInt16              { return  0x16 }
  public static var vKeyAnsi5: UInt16              { return  0x17 }
  public static var vKeyAnsiEqual: UInt16          { return  0x18 }
  public static var vKeyAnsi9: UInt16              { return  0x19 }
  public static var vKeyAnsi7: UInt16              { return  0x1A }
  public static var vKeyAnsiMinus: UInt16          { return  0x1B }
  public static var vKeyAnsi8: UInt16              { return  0x1C }
  public static var vKeyAnsi0: UInt16              { return  0x1D }
  public static var vKeyAnsiRightBracket: UInt16   { return  0x1E }
  public static var vKeyAnsiO: UInt16              { return  0x1F }
  public static var vKeyAnsiU: UInt16              { return  0x20 }
  public static var vKeyAnsiLeftBracket: UInt16    { return  0x21 }
  public static var vKeyAnsiI: UInt16              { return  0x22 }
  public static var vKeyAnsiP: UInt16              { return  0x23 }
  public static var vKeyAnsiL: UInt16              { return  0x25 }
  public static var vKeyAnsiJ: UInt16              { return  0x26 }
  public static var vKeyAnsiQuote: UInt16          { return  0x27 }
  public static var vKeyAnsiK: UInt16              { return  0x28 }
  public static var vKeyAnsiSemicolon: UInt16      { return  0x29 }
  public static var vKeyAnsiBackslash: UInt16      { return  0x2A }
  public static var vKeyAnsiComma: UInt16          { return  0x2B }
  public static var vKeyAnsiSlash: UInt16          { return  0x2C }
  public static var vKeyAnsiN: UInt16              { return  0x2D }
  public static var vKeyAnsiM: UInt16              { return  0x2E }
  public static var vKeyAnsiPeriod: UInt16         { return  0x2F }
  public static var vKeyAnsiGrave: UInt16          { return  0x32 }
  public static var vKeyAnsiKeypadDecimal: UInt16  { return  0x41 }
  public static var vKeyAnsiKeypadMultiply: UInt16 { return  0x43 }
  public static var vKeyAnsiKeypadPlus: UInt16     { return  0x45 }
  public static var vKeyAnsiKeypadClear: UInt16    { return  0x47 }
  public static var vKeyAnsiKeypadDivide: UInt16   { return  0x4B }
  public static var vKeyAnsiKeypadEnter: UInt16    { return  0x4C }
  public static var vKeyAnsiKeypadMinus: UInt16    { return  0x4E }
  public static var vKeyAnsiKeypadEquals: UInt16   { return  0x51 }
  public static var vKeyAnsiKeypad0: UInt16        { return  0x52 }
  public static var vKeyAnsiKeypad1: UInt16        { return  0x53 }
  public static var vKeyAnsiKeypad2: UInt16        { return  0x54 }
  public static var vKeyAnsiKeypad3: UInt16        { return  0x55 }
  public static var vKeyAnsiKeypad4: UInt16        { return  0x56 }
  public static var vKeyAnsiKeypad5: UInt16        { return  0x57 }
  public static var vKeyAnsiKeypad6: UInt16        { return  0x58 }
  public static var vKeyAnsiKeypad7: UInt16        { return  0x59 }
  public static var vKeyAnsiKeypad8: UInt16        { return  0x5B }
  public static var vKeyAnsiKeypad9: UInt16        { return  0x5 }

  public static var vKeyReturn: UInt16             { return  0x24 }
  public static var vKeyTab: UInt16                { return  0x30 }
  public static var vKeySpace: UInt16              { return  0x31 }
  public static var vKeyDelete: UInt16             { return  0x33 }
  public static var vKeyEscape: UInt16             { return  0x35 }
  public static var vKeyCommand: UInt16            { return  0x37 }
  public static var vKeyShift: UInt16              { return  0x38 }
  public static var vKeyCapsLock: UInt16           { return  0x39 }
  public static var vKeyOption: UInt16             { return  0x3A }
  public static var vKeyControl: UInt16            { return  0x3B }
  public static var vKeyRightCommand: UInt16       { return  0x36 }
  public static var vKeyRightShift: UInt16         { return  0x3C }
  public static var vKeyRightOption: UInt16        { return  0x3D }
  public static var vKeyRightControl: UInt16       { return  0x3E }
  public static var vKeyFunction: UInt16           { return  0x3F }
  public static var vKeyF17: UInt16                { return  0x40 }
  public static var vKeyVolumeUp: UInt16           { return  0x48 }
  public static var vKeyVolumeDown: UInt16         { return  0x49 }
  public static var vKeyMute: UInt16               { return  0x4A }
  public static var vKeyF18: UInt16                { return  0x4F }
  public static var vKeyF19: UInt16                { return  0x50 }
  public static var vKeyF20: UInt16                { return  0x5A }
  public static var vKeyF5: UInt16                 { return  0x60 }
  public static var vKeyF6: UInt16                 { return  0x61 }
  public static var vKeyF7: UInt16                 { return  0x62 }
  public static var vKeyF3: UInt16                 { return  0x63 }
  public static var vKeyF8: UInt16                 { return  0x64 }
  public static var vKeyF9: UInt16                 { return  0x65 }
  public static var vKeyF11: UInt16                { return  0x67 }
  public static var vKeyF13: UInt16                { return  0x69 }
  public static var vKeyF16: UInt16                { return  0x6A }
  public static var vKeyF14: UInt16                { return  0x6B }
  public static var vKeyF10: UInt16                { return  0x6D }
  public static var vKeyF12: UInt16                { return  0x6F }
  public static var vKeyF15: UInt16                { return  0x71 }
  public static var vKeyHelp: UInt16               { return  0x72 }
  public static var vKeyHome: UInt16               { return  0x73 }
  public static var vKeyPageUp: UInt16             { return  0x74 }
  public static var vKeyForwardDelete: UInt16      { return  0x75 }
  public static var vKeyF4: UInt16                 { return  0x76 }
  public static var vKeyEnd: UInt16                { return  0x77 }
  public static var vKeyF2: UInt16                 { return  0x78 }
  public static var vKeyPageDown: UInt16           { return  0x79 }
  public static var vKeyF1: UInt16                 { return  0x7A }
  public static var vKeyLeftArrow: UInt16          { return  0x7B }
  public static var vKeyRightArrow: UInt16         { return  0x7C }
  public static var vKeyDownArrow: UInt16          { return  0x7D }
  public static var vKeyUpArrow: UInt16            { return  0x7E }

  public static var vKeyIsoSection: UInt16         { return  0x0A }

  public static var vKeyJisYen: UInt16             { return  0x5D }
  public static var vKeyJisUnderscore: UInt16      { return  0x5E }
  public static var vKeyJisKeypadComma: UInt16     { return  0x5F }
  public static var vKeyJisEisu: UInt16            { return  0x66 }
  public static var vKeyJisKana: UInt16            { return  0x68 }
};
