//
//  Date.swift
//  ESGist
//
//  Created by Tomohiro Kumagai on H27/07/20.
//  Copyright © 平成27年 EasyStyle G.K. All rights reserved.
//

import Foundation

public struct ISO8601Date : RawRepresentable, Codable {

    public var rawValue: Foundation.Date
    
    public init?(_ string: String) {
        
        guard let date = Self.iso8601DateFormatter.date(from: string) else {
            
            return nil
        }
        
        rawValue = date
    }
        
    public init(_ date: Foundation.Date) {
        
        rawValue = date
    }

    public init(rawValue date: Foundation.Date) {
        
        rawValue = date
    }

    public var iso8601String: String {
        
        Self.iso8601DateFormatter.string(from: rawValue)
    }
    
    public init(from decoder: Decoder) throws {
        
        let container = try decoder.singleValueContainer()
        
        guard let date = try ISO8601Date(container.decode(String.self)) else {
            
            throw DecodingError.dataCorruptedError(in: container, debugDescription: "Failed to convert to ISO8601 Formatted date.")
        }
        
        self = date
    }
}

extension ISO8601Date : CustomStringConvertible {
    
    public var description: String {
        
        rawValue.description
    }
}

private extension ISO8601Date {
    
    static let iso8601DateFormatter = ISO8601DateFormatter()
}

