//
//  GistHistory.swift
//  ESGist
//
//  Created by Tomohiro Kumagai on H27/07/20.
//  Copyright © 平成27年 EasyStyle G.K. All rights reserved.
//


public struct GistHistory {
	
    public var url: URL
	public var version: String
    public var user: Gist.User
    public var changeStatus: ChangeStatus
}

extension GistHistory : Decodable {
    
    enum CodingKeys : String, CodingKey {
        
        case url
        case version
        case user
        case changeStatus = "change_status"
    }
}

extension GistHistory {
    
    public struct ChangeStatus : Decodable {
        
        public var total: Int
        public var deletions: Int
        public var additions: Int
    }
}
