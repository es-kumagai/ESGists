//
//  RequestFile.swift
//  ESGist
//
//  Created by Tomohiro Kumagai on H27/07/20.
//  Copyright © 平成27年 EasyStyle G.K. All rights reserved.
//

public struct GistFile {
	
	public var name:String
	public var content:String
	
	public init(name:String, content:String) {
		
		self.name = name
		self.content = content
	}
}

extension GistFile : JSONObjectConvertible {
	
	public func toJSONObject() -> [String:AnyObject] {
		
		return [
			
			self.name : ["content" : self.content ]
		]
	}
}

extension SequenceType where Generator.Element : JSONObjectConvertible {
	
	public func toJSONObject() -> [String:AnyObject] {
		
		var result = [String:AnyObject]()
		
		for (name, object) in self.flatMap({$0.toJSONObject()}) {

			result[name] = object
		}
		
		return result
	}
}