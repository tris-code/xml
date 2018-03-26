import XCTest

extension XMLDecodeTests {
    static let __allTests = [
        ("testDocument", testDocument),
        ("testElement", testElement),
        ("testElementChildren", testElementChildren),
        ("testSelfElement", testSelfElement),
        ("testSelfElementAttributes", testSelfElementAttributes),
        ("testTextElement", testTextElement),
        ("testTextElementAttributes", testTextElementAttributes),
    ]
}

extension XMLEncodeTests {
    static let __allTests = [
        ("testDocument", testDocument),
        ("testElement", testElement),
        ("testElementChildren", testElementChildren),
        ("testSelfElement", testSelfElement),
        ("testSelfElementAttributes", testSelfElementAttributes),
        ("testTextElement", testTextElement),
        ("testTextElementAttributes", testTextElementAttributes),
    ]
}

extension XMLStringTests {
    static let __allTests = [
        ("testAttributes", testAttributes),
        ("testCrazyChildrens", testCrazyChildrens),
        ("testDocument", testDocument),
        ("testElement", testElement),
        ("testElementChildren", testElementChildren),
        ("testElementChildrens", testElementChildrens),
        ("testTextChildren", testTextChildren),
    ]
}

extension XMLTests {
    static let __allTests = [
        ("testDocument", testDocument),
        ("testElement", testElement),
        ("testElementChildren", testElementChildren),
        ("testElementNode", testElementNode),
        ("testNodeValue", testNodeValue),
        ("testTextNode", testTextNode),
    ]
}

#if !os(macOS)
public func __allTests() -> [XCTestCaseEntry] {
    return [
        testCase(XMLDecodeTests.__allTests),
        testCase(XMLEncodeTests.__allTests),
        testCase(XMLStringTests.__allTests),
        testCase(XMLTests.__allTests),
    ]
}
#endif
