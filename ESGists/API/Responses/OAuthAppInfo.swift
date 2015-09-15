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
	
	public static func decode(e: Extractor) -> OAuthAppInfo? {
		
		return build(OAuthAppInfo.init)(
			
			e <| "name",
			e <| "client_id",
			e <| "url"

		)
	}
}
