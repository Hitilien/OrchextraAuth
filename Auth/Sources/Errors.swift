//
//  Errors.swift
//  Auth
//
//  Created by macpro.javier.garcia on 7/21/17.
//  Copyright © 2017 macpro.javier.garcia. All rights reserved.
//

import Foundation

public struct Errors: JSONDecodable {
    
    public var error: String
    public var code: Int
    public var errors: Dictionary<String, AnyObject>?
    
    static func decode(_ json: JSON) -> Errors? {
        
        guard let jsonData = json as? JSONDictionary, let error = jsonData["error"] as? String, let code = jsonData["code"] as? Int else {
            return nil;
        }
        
        if let jsonErrors = jsonData["errors"] as? JSONDictionary{
            return Errors(error: error, code: code, errors: jsonErrors)
        }
        
        return Errors(error: error, code: code, errors: [:])
    }
    
}

// MARK: - CustomStringConvertible
extension Errors: CustomStringConvertible {
    
    public var description: String{
        return "Error: \(error) \nCode: \(code)"
    }
    
}
