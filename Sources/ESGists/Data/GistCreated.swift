//
//  GistCreated.swift
//  ESGist
//
//  Created by Tomohiro Kumagai on H27/07/20.
//  Copyright © 平成27年 EasyStyle G.K. All rights reserved.
//

public struct GistCreated : Sendable {

	public var gist: Gist
	public var history: [GistHistory]
}

extension GistCreated : Decodable {
    
    enum CodingKeys : String, CodingKey {
        
        case history
    }
    
    public init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        gist = try Gist(from: decoder)
        history = try container.decode([GistHistory].self, forKey: .history)
    }
}
