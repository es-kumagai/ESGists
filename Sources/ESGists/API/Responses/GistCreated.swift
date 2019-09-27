//
//  GistCreated.swift
//  ESGist
//
//  Created by Tomohiro Kumagai on H27/07/20.
//  Copyright © 平成27年 EasyStyle G.K. All rights reserved.
//

import Himotoki

public struct GistCreated {

	public var gist:Gist
	public var history:[GistHistory]
}

extension GistCreated : Decodable {
	
	public static func decode(e: Extractor) throws -> GistCreated {
		
		return try GistCreated(

			gist: decodeValue(e.rawValue),
			history: e.array("history")
		
		)
	}
}
