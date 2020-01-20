//
//  UsersAPI.swift
//  ESGists
//
//  Created by Tomohiro Kumagai on H27/08/12.
//  Copyright © 平成27年 EasyStyle G.K. All rights reserved.
//

import Foundation
import APIKit

/*!
Users API
https://developer.github.com/v3/users/
*/

public protocol UsersRequest : Request {
	
}

extension UsersRequest {
	
    public var baseURL: Foundation.URL {
		
        return Foundation.URL(string: "https://api.github.com/user")!
	}
    
    public func intercept(object: Any, urlResponse: HTTPURLResponse) throws -> Any {

        guard urlResponse.statusCode == 200 else {
            
            let decoder = JSONDecoder()
            let data = try JSONSerialization.data(withJSONObject: object, options: [])
            let error = try decoder.decode(GistError.self, from: data)
            
            throw error
        }
            
        return object
    }
}

extension GitHubAPI {
	
	public class Users : Session {
		
        public struct GetSingleUser : GitHubRequest {

			public let method: HTTPMethod = .get
			
			public var username:String
			
			public var path:String {
				
				return "/users/\(self.username)"
			}
			
			public init(username:String) {
				
				self.username = username
			}
			
            public func response(from object: Any, urlResponse: HTTPURLResponse) throws -> Gist.User {

                let decoder = JSONDecoder()
                let data = try JSONSerialization.data(withJSONObject: object, options: [])
                
                return try decoder.decode(Gist.User.self, from: data)
			}
		}
		
		public struct GetAuthenticatedUser : UsersRequest, RequestWithAuthentication {
			
			public let method: HTTPMethod = .get
			public let path: String = ""
			
			public var authorization:GitHubAuthorization
			
			public init(authorization:GitHubAuthorization) {
				
				self.authorization = authorization
			}
			
            public func response(from object: Any, urlResponse: HTTPURLResponse) throws -> Gist.User {

                let decoder = JSONDecoder()
                let data = try JSONSerialization.data(withJSONObject: object, options: [])
                
                return try decoder.decode(Gist.User.self, from: data)
			}
		}
	}
}
