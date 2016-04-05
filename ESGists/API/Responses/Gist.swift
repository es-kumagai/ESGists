//
//  Gist.swift
//  ESGist
//
//  Created by Tomohiro Kumagai on H27/07/20.
//  Copyright © 平成27年 EasyStyle G.K. All rights reserved.
//

import Himotoki

public struct Gist {

	public var id:String
	public var description:String
	public var publicGist:Bool
	public var owner:GistUser?
	public var user:String?
	public var files:[String:Gist.GistFileInfo]
	public var commentCount:Int
	public var timestamp:Gist.Timestamp
	public var urls:Gist.URLs
}

extension Gist {

	public struct URLs {
		
		public var url:URL
		public var forksUrl:URL
		public var commitsUrl:URL
		public var commentUrl:URL
		public var htmlUrl:URL
		public var gitPullUrl:URL
		public var gitPushUrl:URL
	}
	
	public struct GistFileInfo {
		
        public enum LanguageInfo {
        
            case Unknown
            case Specified(Language)
        }
        
		public var size:Int
		public var rawUrl:URL
		public var type:String
		public var truncated:Bool?
		public var language:LanguageInfo?
	}
	
	public struct CommentStatus {
		
		public var count:Int
		public var url:URL
	}
	
	public struct Timestamp {
		
		public var createdAt:Date
		public var updatedAt:Date
	}
}

extension Gist : Decodable {
	
	public static func decode(e: Extractor) throws -> Gist {
		
		return try Gist(
		
			id: e.value("id"),
			description: e.value("description"),
			publicGist: e.value("public"),
			owner: e.valueOptional("owner"),
			user: e.valueOptional("user"),
			files: e.dictionary("files"),
			commentCount: e.value("comments"),
			timestamp: Himotoki.decodeValue(e.rawValue),
			urls: decodeValue(e.rawValue)
		)
	}
}

extension Gist.GistFileInfo : Decodable {

	public static func decode(e: Extractor) throws -> Gist.GistFileInfo {

		return try Gist.GistFileInfo(
		
			size: e.value("size"),
			rawUrl: e.value("raw_url"),
			type: e.value("type"),
			truncated: e.valueOptional("truncated"),
			language: e.valueOptional("language")
		
		)
	}
}

extension Gist.URLs : Decodable {

	public static func decode(e: Extractor) throws -> Gist.URLs {
		
		return try Gist.URLs(
		
			url: e.value("url"),
			forksUrl: e.value("forks_url"),
			commitsUrl: e.value("commits_url"),
			commentUrl: e.value("comments_url"),
			htmlUrl: e.value("html_url"),
			gitPullUrl: e.value("git_pull_url"),
			gitPushUrl: e.value("git_push_url")
			
		)
	}
}

extension Gist.GistFileInfo.LanguageInfo : Decodable {
	
	public init(language: String) {
		
		if let language = Language(rawValue: language) {
			
			self = .Specified(language)
		}
		else {
			
			self = .Unknown
		}
	}
	
	public static func decode(e: Extractor) throws -> Gist.GistFileInfo.LanguageInfo.DecodedType {
		
		return try Gist.GistFileInfo.LanguageInfo(language: String.decode(e))
	}
}


extension Gist.Timestamp : Decodable {
	
	public static func decode(e: Extractor) throws -> Gist.Timestamp {
		
		return try Gist.Timestamp(
			
			createdAt: e.value("updated_at"),
			updatedAt: e.value("created_at")
			
			)
	}
}

extension Gist.Timestamp : CustomStringConvertible {
	
	public var description:String {
		
		return String(self.updatedAt)
	}
}

extension Gist.Timestamp : CustomDebugStringConvertible {
	
	public var debugDescription:String {
		
		return "{ Updated at \(self.updatedAt), Created at \(self.createdAt) }"
	}
}
