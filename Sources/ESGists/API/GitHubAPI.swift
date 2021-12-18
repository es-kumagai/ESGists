//
//  GitHub.swift
//  ESGist
//
//  Created by Tomohiro Kumagai on H27/07/20.
//  Copyright © 平成27年 EasyStyle G.K. All rights reserved.
//

import APIKit
import Foundation

public protocol Authorization : Sendable {
	
	var value: String { get }
}

public protocol GitHubRequest : Request, Sendable {
	
}

public protocol RequestWithAuthentication : Request, Sendable {

	associatedtype Auth : Authorization

	var authorization: Auth { get }
}

extension GitHubRequest {
	
    public var baseURL: Foundation.URL {
		
        return Foundation.URL(string: "https://api.github.com")!
	}
    
    public func intercept(object: Any, urlResponse: HTTPURLResponse) throws -> Any {

        guard urlResponse.statusCode == 200 else {
            
            let decoder = JSONDecoder()
            let error = try decoder.decode(GistError.self, from: object as! Data)
            
            throw error
        }
            
        return object
    }
}

extension RequestWithAuthentication {
	
    public func intercept(urlRequest: URLRequest) throws -> URLRequest {

        var urlRequest = urlRequest
        
        urlRequest.setValue(self.authorization.value, forHTTPHeaderField: "Authorization")
        
        return urlRequest
    }
}

public final class GitHubAPI : Session {

}

public enum GitHubAuthorization : Authorization {

	case basic(String)
	case token(String)
	
	public init(id:String, password:String) {
		
        let data = "\(id):\(password)".data(using: .ascii)!
        let value = data.base64EncodedString(options: .lineLength64Characters)
		
		self = .basic(value)
	}
	
	public init(token: String) {
		
		self = .token(token)
	}
	
	public var value: String {
		
		switch self {
			
		case .basic(let value):
			return "Basic \(value)"
			
		case .token(let value):
			return "Token \(value)"
		}
	}
	
	public var token: String? {
		
		guard case .token(let value) = self else {
			
			return nil
		}
		
		return value
	}
	
	public var basic: String? {
		
		guard case .basic(let value) = self else {
			
			return nil
		}
		
		return value
	}
}
