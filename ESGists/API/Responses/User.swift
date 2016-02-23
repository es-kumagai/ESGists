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
		
		public static func decode(e: Extractor) throws -> Type {

            let string = try String.decode(e)
            
            guard let result = Type(rawValue: string) else {
                
                throw DecodeError.TypeMismatch(expected: "\(DecodedType.self)", actual: "\(string)", keyPath: nil)
            }
            
            return result
		}
	}
}

extension GistUser : Decodable {

	public static func decode(e: Extractor) throws -> GistUser {
		
		return try GistUser(
		
			login: e.value("login"),
			id: e.value("id"),
			name: e.valueOptional("name"),
			gravatarId: e.value("gravatar_id"),
			urls: Himotoki.decode(e.rawValue),
			type: e.value("type"),
			siteAdmin: e.value("site_admin")
		)
	}
}

extension GistUser.URLs : Decodable {
	
	public static func decode(e: Extractor) throws -> GistUser.URLs {

		return try GistUser.URLs(
		
			avatarUrl: e.value("avatar_url"),
			url: e.value("url"),
			htmlUrl: e.value("html_url"),
			followersUrl: e.value("followers_url"),
			followingUrl: e.value("following_url"),
			gistsUrl: e.value("gists_url"),
			starredUrl: e.value("starred_url"),
			subscriptionsUrl: e.value("subscriptions_url"),
			organizationsUrl: e.value("organizations_url"),
			reposUrl: e.value("repos_url"),
			eventsUrl: e.value("events_url"),
			receivedEventsUrl: e.value("received_events_url")
		
		)
	}
}
