//
//  AuthorizationResponse.swift
//  ESGist
//
//  Created by Tomohiro Kumagai on H27/07/20.
//  Copyright © 平成27年 EasyStyle G.K. All rights reserved.
//

import Himotoki

public struct AuthorizationResponseWithStatus {
	
	public enum Status {
		
		case Created
		case AlreadyExists
	}
	
	public var status:Status
	public var authorization:AuthorizationResponse
	
	public init?(status:Int, @autoclosure authorization:()->AuthorizationResponse) {
		
		switch status {
			
		case 201:
			self.status = .Created
			
		case 200:
			self.status = .AlreadyExists
			
		default:
			return nil
		}
		
		self.authorization = authorization()
	}
}

public struct AuthorizationResponse {
	
	public var id:ID
	public var url:URL
	public var scopes:[Scope]
	public var token:OAuthToken
	public var tokenLastEight:String
	public var hashedToken:String
	public var app:OAuthAppInfo
	public var note:String?
	public var noteUrl:URL?
	public var timestamp:Gist.Timestamp
	public var fingerprint:String?
}

extension AuthorizationResponse : Decodable {
	
	public static func decode(e: Extractor) -> AuthorizationResponse? {

		return build(AuthorizationResponse.init)(
			
			e <| "id",
			e <| "url",
			e <|| "scopes",
			e <| "token",
			e <| "token_last_eight",
			e <| "hashed_token",
			e <| "app",
			e <|? "note",
			e <|? "note_url",
			Gist.Timestamp.decode(e),
			e <|? "fingerprint"
			
			)
	}
}

