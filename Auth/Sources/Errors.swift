//
//  Errors.swift
//  Auth
//
//  Created by macpro.javier.garcia on 7/21/17.
//  Copyright © 2017 macpro.javier.garcia. All rights reserved.
//

import Foundation

struct Errors: JSONDecodable {
    
    var error: String
    var code: Int
    var errors: String
    
    static func decode(_ json: JSON) -> Errors? {
        
        guard let jsonData = json as? JSONDictionary, let error = jsonData["error"] as? String, let code = jsonData["code"] as? Int else {
            return nil;
        }
        
        return Errors(error: error, code: code, errors: "")
    }
    
}

// MARK: - CustomStringConvertible
extension Errors: CustomStringConvertible {
    
    var description: String{
        return "Error: \(error) \nCode: \(code)"
    }
    
}
