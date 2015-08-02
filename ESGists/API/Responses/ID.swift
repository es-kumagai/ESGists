//
//  ID.swift
//  ESGist
//
//  Created by Tomohiro Kumagai on H27/07/20.
//  Copyright © 平成27年 EasyStyle G.K. All rights reserved.
//

import Himotoki

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
	
	public static func decode(e: Extractor) -> ID? {
		
		return UInt64.decode(e).map(ID.init)
	}
}

extension ID : CustomStringConvertible {
	
	public var description:String {
		
		return "\(self.value)"
	}
}
