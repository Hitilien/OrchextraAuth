//
//  BaseResponse.swift
//  RESTApiCall
//
//  Created by macpro.javier.garcia on 7/19/17.
//  Copyright © 2017 Alejandro Vargas. All rights reserved.
//

import Foundation


class BaseResponse {

    var status: Int!
    
    var error: Errors?
    
    var isSuccess: Bool {
        return status == 1
    }

    init(json: JSON) {
        
        if let json = json as? JSONDictionary {
        
            if let status = json["status"] as? NSNumber {
                self.status = status.intValue
            }
            
            if let error = json["error"] {
                self.error = Errors.decode(error);
            }
        }
    }
    
    public init(){
        status = 0;
        error  = Errors(error: "Default Error", code: -1, errors: "")
    }
}
