//
//  AuthorizationResponse.swift
//  ESGist
//
//  Created by Tomohiro Kumagai on H27/07/20.
//  Copyright © 平成27年 EasyStyle G.K. All rights reserved.
//

public struct AuthorizationResponse : Decodable, Sendable {
	
	public var id: ID
	public var url: URL
	public var scopes: [Scope]
	public var token: OAuthToken
	public var tokenLastEight: String
	public var hashedToken: String
	public var app: OAuthAppInfo
	public var note: String?
	public var noteUrl: URL?
	public var fingerprint: String?
    
    public var timestamp: Gist.Timestamp


    enum CodingKeys : String, CodingKey {
     
        case id
        case url
        case scopes
        case token
        case tokenLastEight = "token_last_eight"
        case hashedToken = "hashed_token"
        case app
        case note
        case noteUrl = "note_url"
        case fingerprint
        
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
    
    public init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try container.decode(ID.self, forKey: .id)
        url = try container.decode(URL.self, forKey: .url)
        scopes = try container.decode([Scope].self, forKey: .scopes)
        token = try container.decode(OAuthToken.self, forKey: .token)
        tokenLastEight = try container.decode(String.self, forKey: .tokenLastEight)
        hashedToken = try container.decode(String.self, forKey: .hashedToken)
        app = try container.decode(OAuthAppInfo.self, forKey: .app)
        note = try container.decode(String.self, forKey: .note)
        noteUrl = try container.decode(URL.self, forKey: .noteUrl)
        fingerprint = try container.decode(String.self, forKey: .fingerprint)
        
        timestamp = try Gist.Timestamp(from: decoder)
    }
}
