//
//  GistFilename.swift
//  ESGists
//
//  Created by Tomohiro Kumagai on 2020/01/12.
//

extension Gist {
    
    public struct Filename : Decodable, RawRepresentable {
        
        public var rawValue: String
        
        public init(rawValue value: String) {
            
            rawValue = value
        }
        
        public init(from decoder: Decoder) throws {
            
            let container = try decoder.singleValueContainer()
            
            rawValue = try container.decode(String.self)
        }
    }
}

extension Gist.Filename : Hashable {
    
    public var hashValue: Int {
        
        rawValue.hashValue
    }
}
