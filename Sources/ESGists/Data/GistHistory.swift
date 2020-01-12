//
//  GistHistory.swift
//  ESGist
//
//  Created by Tomohiro Kumagai on H27/07/20.
//  Copyright © 平成27年 EasyStyle G.K. All rights reserved.
//


public struct GistHistory : Codable {
	
    public var url: URL
	public var version: String
    public var user: Gist.User
}
