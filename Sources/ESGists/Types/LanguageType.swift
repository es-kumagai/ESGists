//
//  LanguageType.swift
//  ESGists
//
//  Created by Tomohiro Kumagai on H27/08/04.
//  Copyright © 平成27年 EasyStyle G.K. All rights reserved.
//

public protocol LanguageType : RawRepresentable, CustomStringConvertible, Hashable {
	
	var extname:String { get }
	var language:Language { get }
	
	static var all:Set<Self> { get }
}

extension LanguageType {
	
	public var description:RawValue {
		
		return self.rawValue
	}
	
	public var hashValue:Int {
		
		return self.description.hashValue
	}
	
	public init?(displayText:String) {
		
		guard let found = Self.all.findElement({ $0.description == displayText }) else {
			
			return nil
		}
		
		self = found.element
	}
}

extension SequenceType where Generator.Element : LanguageType {
	
	public var languages:[Language] {
	
		return self.map(Language.init)
	}
	
	public func toLanguages() -> [Language] {
		
		return self.languages
	}
	
	@warn_unused_result
	public func sort() -> [Generator.Element] {

		return self.sort {
			
			$0.description.lowercaseString < $1.description.lowercaseString
		}
	}
}

extension Set where Element : LanguageType {
	
	public var languages:Set<Language> {
		
		return Set<Language>(self.map(Language.init))
	}
}
