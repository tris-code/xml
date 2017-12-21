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
import Stream
@testable import XML

class XMLDecodeTests: TestCase {
    func streamWith(_ string: String) -> BufferedInputStream<InputByteStream> {
        let bytes = [UInt8](string.utf8)
        let stream = InputByteStream(bytes)
        return BufferedInputStream(baseStream: stream)
    }

    func testDocument() {
        do {
            let stream = streamWith("""
                <?xml version="1.0" encoding="utf-8" standalone="no"?>
                <root>
                    <element>text</element>
                </root>
                """)
            let document = try XML.Document(from: stream)

            assertEqual(document.version, "1.0")
            assertEqual(document.encoding, .utf8)
            assertEqual(document.standalone, .no)
            assertEqual(document.root, XML.Element(
                name: "root",
                children: [
                    .element(XML.Element(
                        name: "element",
                        children: [.text("text")]))
                ]))
        } catch {
            fail(String(describing: error))
        }
    }

    func testSelfElement() {
        do {
            let stream = streamWith("<element/>")
            let element = try XML.Element(from: stream)
            assertEqual(element, XML.Element(name: "element"))
        } catch {
            fail(String(describing: error))
        }
    }

    func testTextElement() {
        do {
            let stream = streamWith("<element>text</element>")
            let element = try XML.Element(from: stream)
            assertEqual(element, XML.Element(
                name: "element",
                children: [.text("text")]))
        } catch {
            fail(String(describing: error))
        }
    }

    func testElement() {
        do {
            let stream = streamWith("""
                <root>
                    <element>text</element>
                </root>
                """)
            let element = try XML.Element(from: stream)
            assertEqual(element, XML.Element(
                name: "root",
                children: [.element(XML.Element(
                    name: "element",
                    children: [.text("text")]))
                ]))
        } catch {
            fail(String(describing: error))
        }
    }

    func testElementChildren() {
        do {
            let stream = streamWith("""
                <root>
                    <element>text</element>
                    <element2>text2</element2>
                    <element3>text3</element3>
                </root>
                """)
            let element = try XML.Element(from: stream)
            assertEqual(element, XML.Element(
                name: "root",
                children: [
                    .element(XML.Element(
                        name: "element", children: [.text("text")])),
                    .element(XML.Element(
                        name: "element2", children: [.text("text2")])),
                    .element(XML.Element(
                        name: "element3", children: [.text("text3")]))
                ]))
        } catch {
            fail(String(describing: error))
        }
    }

    func testSelfElementAttributes() {
        do {
            let stream = streamWith("<element name=\"value\"/>")
            let element = try XML.Element(from: stream)
            assertEqual(element, XML.Element(
                name: "element",
                attributes: ["name" : "value"]
            ))
        } catch {
            fail(String(describing: error))
        }
    }

    func testTextElementAttributes() {
        do {
            let stream = streamWith("<element name=\"value\">text</element>")
            let element = try XML.Element(from: stream)
            assertEqual(element, XML.Element(
                name: "element",
                attributes: ["name" : "value"],
                children: [.text("text")]
            ))
        } catch {
            fail(String(describing: error))
        }
    }


    static var allTests = [
        ("testDocument", testDocument),
        ("testSelfElement", testSelfElement),
        ("testTextElement", testTextElement),
        ("testElement", testElement),
        ("testElementChildren", testElementChildren),
        ("testSelfElementAttributes", testSelfElementAttributes),
        ("testTextElementAttributes", testTextElementAttributes),
    ]
}
