//
//  ID.swift
//  ESGist
//
//  Created by Tomohiro Kumagai on H27/07/20.
//  Copyright © 平成27年 EasyStyle G.K. All rights reserved.
//

import Himotoki
import Ocean

public struct ID {
	
	public var value:UInt64
	
	public init(_ value:UInt64) {
		
		self.value = value
	}
}

extension ID {

	public init?(string:String) {
		
		guard let value = UInt64(string) else {
			
			return nil
		}
		
		self.value = value
	}
}

extension ID : Decodable {
	
	public static func decode(e: Extractor) throws -> ID {
		
		return try ID(UInt64.decode(e))
	}
}

extension ID : CustomStringConvertible {
	
	public var description:String {
		
		return "\(self.value)"
	}
}

// MARK : Equatable

extension ID : Equatable {
	
}

public func == (lhs:ID, rhs:ID) -> Bool {
	
	return lhs.value == rhs.value
}
