//
//  Gist.swift
//  ESGist
//
//  Created by Tomohiro Kumagai on H27/07/20.
//  Copyright © 平成27年 EasyStyle G.K. All rights reserved.
//

public struct Gist : Decodable {

	public var id: String
	public var description: String
	public var isPublic: Bool
	public var owner: User?
	public var user: String?
	public var files: [Filename: FileInfo]
	public var commentCount: Int
    
	public var urls: URLs
    public var timestamp: Timestamp

    
    enum CodingKeys : String, CodingKey {
        
        case id
        case description
        case isPublic = "public"
        case owner
        case user
        case files
        case commentCount = "comments"
        
        case url
        case forksUrl = "forks_url"
        case commitsUrl = "commits_url"
        case commentUrl = "comments_url"
        case htmlUrl = "html_url"
        case gitPullUrl = "git_pull_url"
        case gitPushUrl = "git_push_url"

        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
    
    public init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try container.decode(String.self, forKey: .id)
        description = try container.decode(String.self, forKey: .description)
        isPublic = try container.decode(Bool.self, forKey: .isPublic)
        owner = try container.decode(Gist.User?.self, forKey: .owner)
        user = try container.decode(String?.self, forKey: .user)
        files = try container.decode([Filename: FileInfo].self, forKey: .files)
        commentCount = try container.decode(Int.self, forKey: .commentCount)
        
        urls = try URLs(from: decoder)
        timestamp = try Timestamp(from: decoder)
    }
}
