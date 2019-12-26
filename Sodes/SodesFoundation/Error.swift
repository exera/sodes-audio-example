//
//  Error.swift
//  Sodes
//
//  Created by Jared Sinclair on 8/30/16.
//
//

import Foundation

public func description(of optionalError: Error?) -> String {
    if let error = optionalError {

        let ttype = type(of: error)
        if ttype == NSError.self {
            let nsError = error as NSError
            return nsError.domain + "_\(nsError.code)"
        } else {
            return String(describing: ttype) + "." + String(describing: error)
        }
    } else {
        return "nil"
    }
}
