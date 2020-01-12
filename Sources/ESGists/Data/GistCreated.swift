//
//  GistCreated.swift
//  ESGist
//
//  Created by Tomohiro Kumagai on H27/07/20.
//  Copyright © 平成27年 EasyStyle G.K. All rights reserved.
//

public struct GistCreated : Codable {

	public var gist: Gist
	public var history: [GistHistory]
}
