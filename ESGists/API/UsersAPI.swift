//
//  UsersAPI.swift
//  ESGists
//
//  Created by Tomohiro Kumagai on H27/08/12.
//  Copyright © 平成27年 EasyStyle G.K. All rights reserved.
//

import APIKit
import Himotoki

/*!
Users API
https://developer.github.com/v3/users/
*/

public protocol UsersRequest : RequestType {
	
}

extension UsersRequest {
	
	public var baseURL:NSURL {
		
		return NSURL(string: "https://api.github.com/user")!
	}
}

extension GitHubAPI {
	
	public class Users : API {
		
		public struct GetSingleUser : GitHubRequest {
			
			public let method:HTTPMethod = .GET
			public let acceptableStatusCodes:Set<Int> = [ 200 ]
			
			public var username:String
			
			public var path:String {
				
				return "/users/\(self.username)"
			}
			
			public init(username:String) {
				
				self.username = username
			}
			
			public func responseFromObject(object: AnyObject, URLResponse: NSHTTPURLResponse) -> GistUser? {
				
                do {

                    return try decode(object) as GistUser
                }
                catch {
                    
                    NSLog("\(error)")
                    return nil
                }
			}
            
            public func errorFromObject(object: AnyObject, URLResponse: NSHTTPURLResponse) -> ErrorType? {
                
                do {

                    return try decode(object) as GistError
                }
                catch {
                    
                    return error
                }
            }
		}
		
		public struct GetAuthenticatedUser : UsersRequest, RequestWithAuthentication {
			
			public let method:HTTPMethod = .GET
			public let acceptableStatusCodes:Set<Int> = [ 200 ]
			public let path:String = ""
			
			public var authorization:GitHubAuthorization
			
			public init(authorization:GitHubAuthorization) {
				
				self.authorization = authorization
			}
			
			public func responseFromObject(object: AnyObject, URLResponse: NSHTTPURLResponse) -> GistUser? {
				
                do {

                    return try decode(object) as GistUser
                }
                catch {
                    
                    NSLog("\(error)")
                    return nil
                }
			}
            
            public func errorFromObject(object: AnyObject, URLResponse: NSHTTPURLResponse) -> ErrorType? {
                
                do {

                    return try decode(object) as GistError
                }
                catch {
                    
                    return error
                }
            }
		}
	}
}
