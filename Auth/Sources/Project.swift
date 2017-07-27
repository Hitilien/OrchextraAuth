//
//  Project.swift
//  Auth
//
//  Created by macpro.javier.garcia on 7/25/17.
//  Copyright © 2017 macpro.javier.garcia. All rights reserved.
//

import Foundation

public struct Project: JSONDecodable {
    
    var name: String
    var users: [UserLogin]?
    var id: String
    
    static func decode(_ json: JSON) -> Project? {
        
        guard let json = json as? JSONDictionary else {
            return nil;
        }
        
        let name = json["name"] as? String ?? ""
        let id = json["id"] as? String ?? ""
        let project: Project?
        project = Project(name: name, users: nil, id: id)
        
        return project
    }
    
}
