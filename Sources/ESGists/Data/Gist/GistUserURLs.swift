//
//  User.swift
//  ESGist
//
//  Created by Tomohiro Kumagai on H27/07/20.
//  Copyright © 平成27年 EasyStyle G.K. All rights reserved.
//

extension Gist.User {
    
    public struct URLs : Decodable, Sendable {
        
        public var avatarUrl: URL
        public var url: URL
        public var htmlUrl: URL
        public var followersUrl: URL
        public var followingUrl: URL
        public var gistsUrl: URL
        public var starredUrl: URL
        public var subscriptionsUrl: URL
        public var organizationsUrl: URL
        public var reposUrl: URL
        public var eventsUrl: URL
        public var receivedEventsUrl: URL
        
        enum CodingKeys: String, CodingKey {
            
            case avatarUrl = "avatar_url"
            case url = "url"
            case htmlUrl = "html_url"
            case followersUrl = "followers_url"
            case followingUrl = "following_url"
            case gistsUrl = "gists_url"
            case starredUrl = "starred_url"
            case subscriptionsUrl = "subscriptions_url"
            case organizationsUrl = "organizations_url"
            case reposUrl = "repos_url"
            case eventsUrl = "events_url"
            case receivedEventsUrl = "received_events_url"
        }
    }
}
