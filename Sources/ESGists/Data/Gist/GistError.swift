//
//  Error.swift
//  ESGists
//
//  Created by Tomohiro Kumagai on H27/09/16.
//  Copyright © 平成27年 EasyStyle G.K. All rights reserved.
//

public struct GistError : Error {
    
    public var message:String
    public var documentationUrl:String
}

extension GistError : Decodable {
    
    public enum CodingKeys : String, CodingKey {
        
        case message
        case documentationUrl = "documentation_url"
    }
}

extension GistError : CustomStringConvertible {
    
    public var description: String {
        
        return message
    }
}

extension GistError : CustomDebugStringConvertible {
    
    public var debugDescription: String {
        
        return "\(self.message), \(self.documentationUrl)"
    }
}
