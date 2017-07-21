//
//  Server.swift
//  RESTApiCall
//
//  Created by macpro.javier.garcia on 7/19/17.
//  Copyright © 2017 Alejandro Vargas. All rights reserved.
//

import Foundation

struct Server {
    
    private static let kHost: String = "https://auth-api-coupons.s.gigigoapps.com"
   
    private static let kAuth: String = "/auth"
    
    static func authURL() -> String {
        let endpoint = kHost + kAuth
        return endpoint
    }
}
