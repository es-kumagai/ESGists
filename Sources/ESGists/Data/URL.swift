//
//  GistURL.swift
//  APIKit
//
//  Created by Tomohiro Kumagai on 2020/01/12.
//

import Foundation

public struct URL : Codable, RawRepresentable {
    
    public var rawValue: String
    
    public init(rawValue value: String) {
        
        rawValue = value
    }
    
    public init(from decoder: Decoder) throws {
        
        rawValue = try decoder.singleValueContainer().decode(String.self)
    }
    
    public func encode(to encoder: Encoder) throws {
        
        var container = encoder.singleValueContainer()
        
        try container.encode(rawValue)
    }
}

extension URL {
    
    public var rawUrl: Foundation.URL? {
        
        Foundation.URL(string: rawValue)
    }
}

extension URL : CustomStringConvertible {
    
    public var description: String {
        
        rawValue
    }
}
