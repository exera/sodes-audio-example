//
//  NSData+Extensions.swift
//  CommonCryptoSwift
//
//  Created by Khoa Pham on 08/05/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import Foundation

public extension Data {
  
  var hexString: String {
    var result = ""

    var bytes = [UInt8](repeating: 0, count: count)
    copyBytes(to: &bytes, count: count) // here???

    for byte in bytes {
      result += String(format: "%02x", UInt(byte))
    }

    return result
  }
}
