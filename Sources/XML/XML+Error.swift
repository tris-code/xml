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

extension XML {
    enum Error: Swift.Error {
        case invalidXmlHeader
        case invalidXmlEncoding
        case invalidSelfClosingTag
        case invalidOpeningTag
        case invalidOpeningTagName
        case invalidClosingTag
        case invalidClosingTagName
        case invalidClosingTagNameMismatch
        case invalidAttribute
        case invalidAttributeName
        case invalidAttributeValue
        case duplicateAttribute
    }
}
