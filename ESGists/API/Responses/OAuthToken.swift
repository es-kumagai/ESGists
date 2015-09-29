//
//  OAuthToken.swift
//  ESGist
//
//  Created by Tomohiro Kumagai on H27/07/20.
//  Copyright © 平成27年 EasyStyle G.K. All rights reserved.
//

import Himotoki

public struct OAuthToken {
	
	public var value:String
	
	public init(_ value:String) {
		
		self.value = value
	}
}

extension OAuthToken : StringLiteralConvertible {
	
	public typealias StringLiteralType = String
	public typealias ExtendedGraphemeClusterLiteralType = String
	public typealias UnicodeScalarLiteralType = String

	public init(stringLiteral value: StringLiteralType) {
	
		self.init(value)
	}
	
	public init(extendedGraphemeClusterLiteral value: ExtendedGraphemeClusterLiteralType) {
		
		self.init(value)
	}
	
	public init(unicodeScalarLiteral value: UnicodeScalarLiteralType) {
		
		self.init(value)
	}
}

extension OAuthToken : Decodable {
	
	public static func decode(e: Extractor) throws -> OAuthToken {
		
		return OAuthToken(try String.decode(e))
	}
}
