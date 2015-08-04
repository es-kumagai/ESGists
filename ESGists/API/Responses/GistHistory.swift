//
//  GistHistory.swift
//  ESGist
//
//  Created by Tomohiro Kumagai on H27/07/20.
//  Copyright © 平成27年 EasyStyle G.K. All rights reserved.
//

import Himotoki

public struct GistHistory {
	
	public var url:URL
	public var version:String
	public var user:GistUser
}

extension GistHistory : Decodable {
	
	public static func decode(e: Extractor) -> GistHistory? {
		
		return build(
		
			e <| "url",
			e <| "version",
			e <| "user"
		
		).map(GistHistory.init)
	}
}