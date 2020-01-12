//
//  GistCommentStatus.swift
//  ESGists
//
//  Created by Tomohiro Kumagai on 2020/01/12.
//

extension Gist {
    
    public struct CommentStatus : Codable {
        
        public var count: Int
        public var url: URL
    }
}
