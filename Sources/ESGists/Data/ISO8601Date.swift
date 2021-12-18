//
//  Date.swift
//  ESGist
//
//  Created by Tomohiro Kumagai on H27/07/20.
//  Copyright © 平成27年 EasyStyle G.K. All rights reserved.
//

import Foundation

public struct ISO8601Date : RawRepresentable, Codable, Sendable {

    public var timeIntervalSinceReferenceDate: TimeInterval
    
    public init?(_ string: String) {
        
        guard let date = Self.iso8601DateFormatter.date(from: string) else {
            
            return nil
        }
        
        timeIntervalSinceReferenceDate = date.timeIntervalSinceReferenceDate
    }
        
    public init(_ date: Foundation.Date) {
        
        timeIntervalSinceReferenceDate = date.timeIntervalSinceReferenceDate
    }

    public init(rawValue date: Foundation.Date) {
        
        timeIntervalSinceReferenceDate = date.timeIntervalSinceReferenceDate
    }

    public var rawValue: Date {
    
        Date(timeIntervalSinceReferenceDate: timeIntervalSinceReferenceDate)
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
    
    public func encode(to encoder: Encoder) throws {
        
        var container = encoder.singleValueContainer()
        
        try container.encode(iso8601String)
    }
}

extension ISO8601Date : CustomStringConvertible {
    
    public var description: String {
        
        rawValue.description
    }
}

extension ISO8601Date : Comparable {
    
    public static func ==(lhs: ISO8601Date, rhs: ISO8601Date) -> Bool {
        
        lhs.rawValue == rhs.rawValue
    }

    public static func !=(lhs: ISO8601Date, rhs: ISO8601Date) -> Bool {
        
        lhs.rawValue != rhs.rawValue
    }

    public static func <(lhs: ISO8601Date, rhs: ISO8601Date) -> Bool {
        
        lhs.rawValue < rhs.rawValue
    }

    public static func >(lhs: ISO8601Date, rhs: ISO8601Date) -> Bool {
        
        lhs.rawValue > rhs.rawValue
    }

    public static func <=(lhs: ISO8601Date, rhs: ISO8601Date) -> Bool {
        
        lhs.rawValue <= rhs.rawValue
    }

    public static func >=(lhs: ISO8601Date, rhs: ISO8601Date) -> Bool {
        
        lhs.rawValue >= rhs.rawValue
    }

}

private extension ISO8601Date {
    
    static let iso8601DateFormatter = ISO8601DateFormatter()
}

