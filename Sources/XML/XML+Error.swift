/*
 * Copyright 2017 Tris Foundation and the project authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License
 *
 * See LICENSE.txt in the project root for license information
 * See CONTRIBUTORS.txt for the list of the project authors
 */

extension XML {
    enum Error: Swift.Error {
        case invalidXmlHeader
        case invalidXmlEncoding
        case invalidClosedTag
        case invalidOpeningTag
        case invalidOpeningTagName
        case invalidClosingTag
        case invalidClosingTagName
        case invalidAttribute
        case invalidAttributeValue
        case duplicateAttribute
    }
}
