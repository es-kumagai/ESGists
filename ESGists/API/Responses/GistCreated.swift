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
		
		return try build(GistCreated.init)(

			Gist.decode(e),
			e <|| "history"
		
		)
	}
}
