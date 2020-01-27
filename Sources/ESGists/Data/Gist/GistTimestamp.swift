//
//  GistTimestamp.swift
//  ESGists
//
//  Created by Tomohiro Kumagai on 2020/01/12.
//

extension Gist {
    
    public struct Timestamp : Decodable {
        
        public var createdAt: ISO8601Date
        public var updatedAt: ISO8601Date
        
        public enum CodingKeys : String, CodingKey {
            
            case createdAt = "created_at"
            case updatedAt = "updated_at"
        }
    }
}

extension Gist.Timestamp : CustomStringConvertible {
    
    public var description: String {
        
        updatedAt.description
    }
}

extension Gist.Timestamp : CustomDebugStringConvertible {
    
    public var debugDescription: String {
        
        return "{ Updated at \(updatedAt), Created at \(createdAt) }"
    }
}
