//
//  User.swift
//  ESGist
//
//  Created by Tomohiro Kumagai on H27/07/20.
//  Copyright © 平成27年 EasyStyle G.K. All rights reserved.
//

import Himotoki

public struct GistUser {
	
	public var login:String
	public var id:ID
	public var name:String?
	public var gravatarId:String
	public var urls:URLs
	public var type:Type
	public var siteAdmin:Bool
	
	public struct URLs {

		public var avatarUrl:URL
		public var url:URL
		public var htmlUrl:URL
		public var followersUrl:URL
		public var followingUrl:URL
		public var gistsUrl:URL
		public var starredUrl:URL
		public var subscriptionsUrl:URL
		public var organizationsUrl:URL
		public var reposUrl:URL
		public var eventsUrl:URL
		public var receivedEventsUrl:URL
	}
	
	public enum Type : String, Decodable {
		
		case User
		
		public static func decode(e: Extractor) -> Type? {
			
			return String.decode(e).flatMap(Type.init)
		}
	}
}

extension GistUser : Decodable {

	public static func decode(e: Extractor) -> GistUser? {
		
		return build(
		
			e <| "login",
			e <| "id",
			e <|? "name",
			e <| "gravatar_id",
			GistUser.URLs.decode(e),
			e <| "type",
			e <| "site_admin"
			
		).map(GistUser.init)
	}
}

extension GistUser.URLs : Decodable {
	
	public static func decode(e: Extractor) -> GistUser.URLs? {

		return build(
		
			e <| "avatar_url",
			e <| "url",
			e <| "html_url",
			e <| "followers_url",
			e <| "following_url",
			e <| "gists_url",
			e <| "starred_url",
			e <| "subscriptions_url",
			e <| "organizations_url",
			e <| "repos_url",
			e <| "events_url",
			e <| "received_events_url"
		
		).map(GistUser.URLs.init)
	}
}