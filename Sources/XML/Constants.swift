/******************************************************************************
 *                                                                            *
 * Tris Foundation disclaims copyright to this source code.                   *
 * In place of a legal notice, here is a blessing:                            *
 *                                                                            *
 *     May you do good and not evil.                                          *
 *     May you find forgiveness for yourself and forgive others.              *
 *     May you share freely, never taking more than you give.                 *
 *                                                                            *
 ******************************************************************************/

import Stream

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
