//
//  Auth.swift
//  RESTApiCall
//
//  Created by macpro.javier.garcia on 7/19/17.
//  Copyright © 2017 Alejandro Vargas. All rights reserved.
//

import Foundation
import RestClient

public protocol AuthDelegate: NSObjectProtocol {

    func onSuccess(response: AnyObject?)
    
    func onFail(response: AnyObject?, error: String?)

}


public class Auth {
    
    public static let shared: Auth = Auth()
    
    weak var delegate: AuthDelegate?
    
    /// Metodo para autenticar con un clienteId y una contraseña
    ///
    /// - Parameters:
    ///   - clientId: clientId description
    ///   - password: password description
    ///   - completion: completion, bloque que se manda llamar al terminar la solicitud al servidor
    public func auth(clientId: String, password: String, completion: @escaping (AuthResponse) -> Void ) {
        
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
    
    
    /// Metodo para hacer login con usuario, contraseña y cliente
    ///
    /// - Parameters:
    ///   - username: username description
    ///   - password: password description
    ///   - client: client description
    ///   - completion: completion description
    public func login(username: String, password: String, client: String, completion: @escaping (LoginResponse) -> Void ) {
        
        let headers = ["Content-Type": " application/json"]
        let params: [String : AnyObject] = ["username": username, "password": password, "client": client] as [String : AnyObject]
        
        let url = Server.loginURL()
        
        APICall.request(method:.post, url: url, params: params, headers: headers) { (json, success, error) in
            
            let response: LoginResponse
            if let json = json {
                response = LoginResponse(json: json)
            }else{
                response = LoginResponse()
                response.error?.error = error ?? "Default error"
                response.status = 0
            }
            
            completion(response)
        }
    }

    
    
    /// Custom Login
    ///
    /// - Parameters:
    ///   - username: username description
    ///   - password: password description
    ///   - client: client description
    ///   - options: options URL
    ///   - delegate: delegate description reference to callback
    public func customLogin(username: String, password: String, client: String, options: String = "", delegate: AuthDelegate?) {
        
        let headers = ["Content-Type": " application/json"]
        let params: [String : AnyObject] = ["username": username, "password": password, "client": client] as [String : AnyObject]
        
        let url = Server.loginURL() + options
        
        self.delegate = delegate
        
        APICall.request(method: .post, url: url, params: params, headers: headers) { (json, success, error) in
            
            if success {
                delegate?.onSuccess(response: json)
            } else {
                delegate?.onFail(response: json, error: error)
            }
        }
    }

    
    
    
}
