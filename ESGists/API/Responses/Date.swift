//
//  Date.swift
//  ESGist
//
//  Created by Tomohiro Kumagai on H27/07/20.
//  Copyright © 平成27年 EasyStyle G.K. All rights reserved.
//

import Himotoki

// MARK: - NSDate Extension

extension NSDate {
	
	public static func dateFromString(string:String) -> NSDate? {
		
		let dateFromFormat = { (format:String) -> NSDate? in
			
			let formatter = NSDateFormatter()
			
			formatter.locale = NSLocale(localeIdentifier: "en_US_POSIX")
			formatter.timeZone = NSTimeZone(forSecondsFromGMT: 0)
			formatter.dateFormat = format
			
			return formatter.dateFromString(string)
		}
		
		// RFC3339
		if let date = dateFromFormat("yyyy'-'MM'-'dd'T'HH':'mm':'ss'Z'") {
			
			return date
		}
		
		if let date = dateFromFormat("yyyy'-'MM'-'dd'T'HH':'mm':'ss'.'S") {
			
			return date
		}
		
		return nil
	}
	
	public static func ISO8601FromDate(date:NSDate) -> String {
		
		let formatter = NSDateFormatter()
		
		formatter.locale = NSLocale(localeIdentifier: "en_US_POSIX")
		formatter.timeZone = NSTimeZone(forSecondsFromGMT: 0)
		formatter.dateFormat = "yyyy'-'MM'-'dd'T'HH':'mm':'ss'Z'"
		
		return formatter.stringFromDate(date)
	}
}

// MARK: - Date

public struct Date : RawRepresentable {

	public var rawValue:NSDate
	
	public init(rawValue:NSDate) {
		
		self.rawValue = rawValue
	}
	
	public init(_ date:NSDate) {
	
		self.rawValue = date
	}
	
	public init?(_ string:String) {
		
		guard let date = NSDate.dateFromString(string) else {
			
			return nil
		}
		
		self.rawValue = date
	}
	
	public var ISO8601String:String {
	
		return NSDate.ISO8601FromDate(self.rawValue)
	}
}

extension Date : Decodable {
	
	public static func decode(e: Extractor) throws -> Date {
		
        let string = try String.decode(e)

        guard let result = Date(string) else {
            
            throw DecodeError.TypeMismatch(expected: "\(DecodedType.self)", actual: "\(string)", keyPath: nil)
        }
        
        return result
	}
}

extension Date : CustomStringConvertible {
	
	public var description:String {
		
		return self.rawValue.description
	}
}