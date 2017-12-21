/*
 * Copyright 2017 Tris Foundation and the project authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License
 *
 * See LICENSE.txt in the project root for license information
 * See CONTRIBUTORS.txt for the list of the project authors
 */

import Test
@testable import XML

class XMLTests: TestCase {
    func testDocument() {
        let document = XML.Document()
        assertEqual(document.version, "1.0")
        assertEqual(document.encoding, .utf8)
        assertEqual(document.standalone, .no)
        assertNil(document.root)
    }

    func testElement() {
        let element = XML.Element(name: "root")
        assertEqual(element.name, "root")
        assertEqual(element.attributes, [:])
        assertEqual(element.children, [])
    }

    func testElementNode() {
        let node = XML.Node.element(XML.Element(name: "root"))
        assertEqual(node, .element(XML.Element(name: "root")))
    }

    func testTextNode() {
        let node = XML.Node.text("text")
        assertEqual(node, .text("text"))
    }

    func testElementChildren() {
        let element = XML.Element(name: "root", children: [.text("text")])
        assertEqual(element.children, [.text("text")])
    }

    func testNodeValue() {
        let element = XML.Element(name: "root", children: [.text("text")])
        assertEqual(element.value, "text")
    }


    static var allTests = [
        ("testDocument", testDocument),
        ("testElement", testElement),
        ("testElementNode", testElementNode),
        ("testTextNode", testTextNode),
        ("testElementChildren", testElementChildren),
        ("testNodeValue", testNodeValue),
    ]
}
