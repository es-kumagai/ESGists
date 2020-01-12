//
//  GistURLs.swift
//  APIKit
//
//  Created by Tomohiro Kumagai on 2020/01/12.
//

extension Gist {
    
    public struct URLs : Codable {
        
        public var url: URL
        public var forksUrl: URL
        public var commitsUrl: URL
        public var commentUrl: URL
        public var htmlUrl: URL
        public var gitPullUrl: URL
        public var gitPushUrl: URL
        
        public enum CodingKeys : String, CodingKey {
            
            case url
            case forksUrl = "forks_url"
            case commitsUrl = "commits_url"
            case commentUrl = "comments_url"
            case htmlUrl = "html_url"
            case gitPullUrl = "git_pull_url"
            case gitPushUrl = "git_push_url"
        }
    }
}
