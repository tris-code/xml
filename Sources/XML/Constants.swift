/*
 * Copyright 2017 Tris Foundation and the project authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License
 *
 * See LICENSE.txt in the project root for license information
 * See CONTRIBUTORS.txt for the list of the project authors
 */

extension UInt8 {
    static let whitespace = UInt8(ascii: " ")
    static let doubleQuote = UInt8(ascii: "\"")
    static let angleBracketOpen = UInt8(ascii: "<")
    static let angleBracketClose = UInt8(ascii: ">")
    static let slash = UInt8(ascii: "/")
    static let equal = UInt8(ascii: "=")
    static let cr = UInt8(ascii: "\r")
    static let lf = UInt8(ascii: "\n")
}

struct Constants {
    static let lineEnd: [UInt8] = [.cr, .lf]

    static let xmlHeaderStart = [UInt8]("<?xml".utf8)
    static let xmlHeaderEnd = [UInt8]("?>".utf8)
}

extension Set where Element == UInt8 {
    init(_ string: String) {
        self = Set<UInt8>([UInt8](string.utf8))
    }

    static let letters = Set<UInt8>(
        "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ")

    static let digits = Set<UInt8>(
        "0123456789")

    static let xmlName = letters.union(digits).union(Set<UInt8>(
        ".-_:"))
}

extension AllowedBytes {
    static let xmlName = AllowedBytes(byteSet: .xmlName)
}
