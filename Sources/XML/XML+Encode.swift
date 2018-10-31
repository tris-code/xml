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

// TODO: Implement and benchmark raw encoder

extension XML.Document {
    public func encode<T: StreamWriter>(
        to stream: T,
        format: Format = .compact
    ) throws {
        var xml = ""
        encodeHeader(to: &xml, format: format)
        if let root = root {
            root.encode(to: &xml, format: format)
        }
        try stream.write(xml: xml)
    }
}

extension XML.Element {
    public func encode<T: StreamWriter>(
        to stream: T,
        format: Format = .compact
    ) throws {
        var xml = ""
        encode(to: &xml, format: format)
        try stream.write(xml: xml)
    }
}

extension StreamWriter {
    func write(xml: String) throws {
        try write([UInt8](xml.utf8))
    }
}
