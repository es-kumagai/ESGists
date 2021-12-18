//
//  OAuthToken.swift
//  ESGist
//
//  Created by Tomohiro Kumagai on H27/07/20.
//  Copyright © 平成27年 EasyStyle G.K. All rights reserved.
//

public struct OAuthToken : Decodable, Sendable {
	
	public var value: String
	
	public init(_ value: String) {
		
		self.value = value
	}
    
    public init(from decoder: Decoder) throws {
        
        let container = try decoder.singleValueContainer()
        
        value = try container.decode(String.self)
    }
}

extension OAuthToken : ExpressibleByStringLiteral {
	
	public init(stringLiteral value: String) {
	
		self.init(value)
	}
}
