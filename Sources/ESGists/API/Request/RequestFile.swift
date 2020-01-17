//
//  RequestFile.swift
//  ESGist
//
//  Created by Tomohiro Kumagai on H27/07/20.
//  Copyright © 平成27年 EasyStyle G.K. All rights reserved.
//

public struct GistFile : Codable {
	
	public var name: String
	public var content: Array<String>
    
    public init(name: String, content: Array<String>) {
        
        self.name = name
        self.content = content
    }
}

extension GistFile : JSONObjectConvertible {
    
    public func toJSON() -> Dictionary<String, Any> {
        
        [ name : content.toJSON() ]
    }
}
