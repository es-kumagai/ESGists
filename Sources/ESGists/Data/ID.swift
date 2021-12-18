//
//  ID.swift
//  ESGist
//
//  Created by Tomohiro Kumagai on H27/07/20.
//  Copyright © 平成27年 EasyStyle G.K. All rights reserved.
//

public struct ID : Codable, Sendable {
	
	public var value: UInt64
	
	public init(_ value: UInt64) {
		
		self.value = value
	}
}

extension ID {

    public init?(string: String) {
        
        guard let value = UInt64(string, radix: 10) else {
            
            return nil
        }
        
        self.value = value
    }
}

// MARK: Cordable
extension ID {
    
    public init(from decoder: Decoder) throws {
    
        let container = try decoder.singleValueContainer()
        
        value = try container.decode(UInt64.self)
    }
    
    public func encode(to encoder: Encoder) throws {
        
        var container = encoder.singleValueContainer()
        
        try container.encode(value)
    }
}

// MARK: CustomStringConvertible
extension ID : CustomStringConvertible {
	
	public var description:String {
		
		"\(self.value)"
	}
}

// MARK : Equatable
extension ID : Equatable {
	
}

public func == (lhs:ID, rhs:ID) -> Bool {
	
	lhs.value == rhs.value
}
