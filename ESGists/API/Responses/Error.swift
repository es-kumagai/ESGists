//
//  Error.swift
//  ESGists
//
//  Created by Tomohiro Kumagai on H27/09/16.
//  Copyright © 平成27年 EasyStyle G.K. All rights reserved.
//

import Himotoki

public struct GistError {
    
    public var message:String
    public var documentationUrl:String
}

extension GistError : Decodable {
    
    public static func decode(e: Extractor) -> GistError? {
        
        return build(GistError.init)(
            
            e <| "message",
            e <| "documentation_url"
        )
    }
}

extension GistError : ErrorType {
    
}

extension GistError : CustomStringConvertible {
    
    public var description:String {
        
        return self.message
    }
}

extension GistError : CustomDebugStringConvertible {
    
    public var debugDescription:String {
        
        return "\(self.message), \(self.documentationUrl)"
    }
}
