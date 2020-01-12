//
//  GitHub.swift
//  ESGist
//
//  Created by Tomohiro Kumagai on H27/07/20.
//  Copyright © 平成27年 EasyStyle G.K. All rights reserved.
//

import APIKit
import Foundation

public protocol Authorization {
	
	var value:String { get }
}

public protocol GitHubRequest : Request {
	
}

public protocol RequestWithAuthentication : Request {

	associatedtype Auth : Authorization

	var authorization:Auth { get }
}

extension GitHubRequest {
	
    public var baseURL: Foundation.URL {
		
        return Foundation.URL(string: "https://api.github.com")!
	}
}

extension RequestWithAuthentication {
	
	public func configureURLRequest(URLRequest: NSMutableURLRequest) throws -> NSMutableURLRequest {
		
		URLRequest.setValue(self.authorization.value, forHTTPHeaderField: "Authorization")
		
		return URLRequest
	}
}

public final class GitHubAPI : Session {

}

public enum GitHubAuthorization : Authorization {

	case basic(String)
	case token(String)
	
	public init(id:String, password:String) {
		
		let data = "\(id):\(password)".dataUsingEncoding(NSASCIIStringEncoding)!
		let value = data.base64EncodedStringWithOptions(.Encoding64CharacterLineLength)
		
		self = .Basic(value)
	}
	
	public init(token:String) {
		
		self = .Token(token)
	}
	
	public var value:String {
		
		switch self {
			
		case .basic(let value):
			return "Basic \(value)"
			
		case .token(let value):
			return "Token \(value)"
		}
	}
	
	public var token:String? {
		
		guard case .token(let value) = self else {
			
			return nil
		}
		
		return value
	}
	
	public var basic:String? {
		
		guard case .basic(let value) = self else {
			
			return nil
		}
		
		return value
	}
}
