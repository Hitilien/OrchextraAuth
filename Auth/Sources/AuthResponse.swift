//
//  AuthResponse.swift
//  RESTApiCall
//
//  Created by macpro.javier.garcia on 7/20/17.
//  Copyright © 2017 Alejandro Vargas. All rights reserved.
//

import Foundation

class AuthResponse: BaseResponse {
    
    var user: User?
    
    override init() {
        super.init()
    }
    
    override init(json: JSON) {
        super.init(json: json)
        
        if let json = json as? JSONDictionary, let userData = json["data"] {
            user = User.decode(userData)
        }
    }
    
}
