//
//  JSONObject.swift
//  ESGist
//
//  Created by Tomohiro Kumagai on H27/07/20.
//  Copyright © 平成27年 EasyStyle G.K. All rights reserved.
//

public protocol JSONValueConvertible {

    associatedtype JSONValueType
    
    func toJSON() -> JSONValueType
}

public protocol JSONObjectConvertible : JSONValueConvertible {
	
	func toJSON() -> Dictionary<String, Any>
}

extension String : JSONValueConvertible {

    public func toJSON() -> String {
        
        self
    }
}

extension Bool : JSONValueConvertible {

    public func toJSON() -> String {
        
        return self ? "true" : "false"
    }
}

extension Sequence where Element : JSONValueConvertible {
    
    public func toJSON() -> Array<Any> {
        
        map { $0.toJSON() }
    }
}

extension Sequence where Element : JSONObjectConvertible {
    
    public func toJSON() -> Dictionary<String, Any> {
        
        map { $0.toJSON() }
            .reduce(into: [:]) { result, item in
                
                result.merge(item) { _, new in new }
        }
    }
}
