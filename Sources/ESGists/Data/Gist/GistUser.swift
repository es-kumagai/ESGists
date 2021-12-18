//
//  User.swift
//  ESGist
//
//  Created by Tomohiro Kumagai on H27/07/20.
//  Copyright © 平成27年 EasyStyle G.K. All rights reserved.
//

extension Gist {
    
    public struct User: Decodable, Sendable {
        
        public var login: String
        public var id: ID
        public var nodeId: String
        public var gravatarId: String
        public var type: UserType
        public var isSiteAdmin: Bool
        
        public var urls: URLs

        enum CodingKeys: String, CodingKey {
            
            case login
            case id
            case nodeId = "node_id"
            case gravatarId = "gravatar_id"
            case type = "type"
            case isSiteAdmin = "site_admin"
            case urls = "urls"

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
        
        public init(from decoder: Decoder) throws {
            
            let container = try decoder.container(keyedBy: CodingKeys.self)
            
            login = try container.decode(String.self, forKey: .login)
            id = try container.decode(ID.self, forKey: .id)
            nodeId = try container.decode(String.self, forKey: .nodeId)
            gravatarId = try container.decode(String.self, forKey: .gravatarId)
            type = try container.decode(UserType.self, forKey: .type)
            isSiteAdmin = try container.decode(Bool.self, forKey: .isSiteAdmin)
            
            urls = try URLs(from: decoder)
        }
    }
}
