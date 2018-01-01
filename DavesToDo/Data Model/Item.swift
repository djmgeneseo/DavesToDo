//
//  File.swift
//  DavesToDo
//
//  Created by David Murphy on 12/31/17.
//  Copyright © 2017 David Murphy. All rights reserved.
//

import Foundation

// Objects of custom class 'Item' an now be converted via Encoder. Properties must be of standard type.
// Same goes for Decodable. If using both Encodable and Decodable (which we are, and you probably will always use together), then simply set "codable" as the class's superclass
class Item: Codable {
    var title : String = ""
    var done: Bool = false
}
