//
//  HMAC.swift
//  CommonCryptoSwift
//
//  Created by Khoa Pham on 08/05/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import Foundation
import CommonCrypto

public struct HMAC {

  // MARK: - NSData

  public static func MD5(_ data: Data, key: Data) -> Data? {
    return HMAC.generate(data, key: key, crypto: .MD5)
  }

  public static func SHA1(_ data: Data, key: Data) -> Data? {
    return HMAC.generate(data, key: key, crypto: .SHA1)
  }

  public static func SHA224(_ data: Data, key: Data) -> Data? {
    return HMAC.generate(data, key: key, crypto: .SHA224)
  }

  public static func SHA256(_ data: Data, key: Data) -> Data? {
    return HMAC.generate(data, key: key, crypto: .SHA256)
  }

  public static func SHA384(_ data: Data, key: Data) -> Data? {
    return HMAC.generate(data, key: key, crypto: .SHA384)
  }

  public static func SHA512(_ data: Data, key: Data) -> Data? {
    return HMAC.generate(data, key: key, crypto: .SHA512)
  }

  static func generate(_ data: Data, key: Data, crypto: Crypto) -> Data? {
    guard let HMACAlgorithm = crypto.HMACAlgorithm else { return nil }

    // Can also use UnsafeMutablePointer<CUnsignedChar>.alloc(Int(crypto.length))
    var buffer = Array<UInt8>(repeating: 0, count: Int(crypto.length))
    CCHmac(HMACAlgorithm, [UInt8](key), key.count, [UInt8](data), data.count, &buffer)

    return Data(bytes: buffer, count: Int(crypto.length))
  }

  // MARK: - String

  public static func MD5(_ string: String, key: String) -> String? {
    return HMAC.generate(string, key: key, crypto: .MD5)
  }

  public static func SHA1(_ string: String, key: String) -> String? {
    return HMAC.generate(string, key: key, crypto: .SHA1)
  }

  public static func SHA224(_ string: String, key: String) -> String? {
    return HMAC.generate(string, key: key, crypto: .SHA224)
  }

  public static func SHA256(_ string: String, key: String) -> String? {
    return HMAC.generate(string, key: key, crypto: .SHA256)
  }

  public static func SHA384(_ string: String, key: String) -> String? {
    return HMAC.generate(string, key: key, crypto: .SHA384)
  }

  public static func SHA512(_ string: String, key: String) -> String? {
    return HMAC.generate(string, key: key, crypto: .SHA512)
  }

  static func generate(_ string: String, key: String, crypto: Crypto) -> String? {
    guard let data = string.data(using: String.Encoding.utf8),
      let keyData = key.data(using: String.Encoding.utf8)
      else { return nil }

    return HMAC.generate(data, key: keyData, crypto: crypto)?.hexString
  }
}
