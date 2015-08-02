//
//  JSONObject.swift
//  ESGist
//
//  Created by Tomohiro Kumagai on H27/07/20.
//  Copyright © 平成27年 EasyStyle G.K. All rights reserved.
//

public protocol JSONObjectConvertible {
	
	func toJSONObject() -> [String:AnyObject]
}

public func toJSONBool(value:Bool) -> String {
	
	return value ? "true" : "false"
}
