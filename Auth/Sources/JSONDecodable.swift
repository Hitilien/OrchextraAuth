//
//  JSONDecodable.swift
//  Auth
//
//  Created by macpro.javier.garcia on 7/21/17.
//  Copyright © 2017 macpro.javier.garcia. All rights reserved.
//

import Foundation

typealias JSON = AnyObject
typealias JSONDictionary = Dictionary<String, JSON>
typealias JSONArray = Array<JSON>

protocol JSONDecodable {
    static func decode(_ json: JSON) -> Self?
}
