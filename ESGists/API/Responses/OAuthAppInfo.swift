//
//  OAuthAppInfo.swift
//  ESGist
//
//  Created by Tomohiro Kumagai on H27/07/20.
//  Copyright © 平成27年 EasyStyle G.K. All rights reserved.
//

import Himotoki

public struct OAuthAppInfo {

	public var name:String
	public var clientId:String
	public var url:URL
}

extension OAuthAppInfo : Decodable {
	
	public static func decode(e: Extractor) throws -> OAuthAppInfo {
		
		return try OAuthAppInfo(
			
			name: e.value("name"),
			clientId: e.value("client_id"),
			url: e.value("url")

		)
	}
}
