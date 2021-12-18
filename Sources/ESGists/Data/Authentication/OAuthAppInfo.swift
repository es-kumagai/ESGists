//
//  OAuthAppInfo.swift
//  ESGist
//
//  Created by Tomohiro Kumagai on H27/07/20.
//  Copyright © 平成27年 EasyStyle G.K. All rights reserved.
//

public struct OAuthAppInfo : Decodable, Sendable {

	public var name: String
	public var clientId: String
	public var url: URL
    
    public enum CodingKeys : String, CodingKey {
        
        case name
        case clientId = "client_id"
        case url
    }
}
