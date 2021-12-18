//
//  GistURLs.swift
//  APIKit
//
//  Created by Tomohiro Kumagai on 2020/01/12.
//

extension Gist {

    public struct FileInfo : Sendable {
        
        public var type: String
        public var language: String?
        public var rawUrl: URL
        public var size: Int
        public var truncated: Bool?
        public var content: String
    }
}

extension Gist.FileInfo : Decodable {

    enum CodingKeys : String, CodingKey {
            
        case type
        case language
        case rawUrl = "raw_url"
        case size
        case truncated
        case content
    }
}
