//
//  Auth.swift
//  RESTApiCall
//
//  Created by macpro.javier.garcia on 7/19/17.
//  Copyright © 2017 Alejandro Vargas. All rights reserved.
//

import Foundation
import RestClient

public class Auth {
    
    static let shared: Auth = Auth()
    
    func auth(clientId: String, password: String, completion: @escaping (AuthResponse) -> Void ) {
        
        let headers = ["Content-Type": " application/json"]
        let params: [String : AnyObject] = ["clientId": clientId, "clientSecret": password] as [String : AnyObject]
        
        let url = Server.authURL()
        
        APICall.request(method:.post, url: url, params: params, headers: headers) { (json, success, error) in
            
            let response: AuthResponse
            if let json = json {
                response = AuthResponse(json: json)
            }else{
                response = AuthResponse()
                response.error?.error = error ?? "Default error"
                response.status = 0
            }
            
            completion(response)
        }
    }
    
    
}
