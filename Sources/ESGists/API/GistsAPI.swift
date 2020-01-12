//
//  Gists.swift
//  ESGist
//
//  Created by Tomohiro Kumagai on H27/07/20.
//  Copyright © 平成27年 EasyStyle G.K. All rights reserved.
//

import APIKit

/*!
Gists API
https://developer.github.com/v3/gists/
*/

public protocol GistsRequest : RequestType {
	
}

extension GistsRequest {
	
	public var baseURL:NSURL {
		
		return NSURL(string: "https://api.github.com/gists")!
	}
}

extension GitHubAPI {
	
	public class Gists : Session {
		
		public struct ListUsersGists : GitHubRequest {
			
			public let method:HTTPMethod = .GET
			public let acceptableStatusCodes:Set<Int> = [ 200 ]
			
			public var username:String
			public var since:ISO8601Date?

			public var path:String {
				
				return "/users/\(self.username)/gists"
			}
			
			public var parameters:[String:AnyObject] {
				
				if let since = self.since {
					
					return [ "since" : since.ISO8601String ]
				}
				else {
					
					return [:]
				}
			}
			
			public init(username:String) {
			
				self.username = username
				self.since = nil
			}
			
			public init(username:String, since:ISO8601Date) {

				self.username = username
				self.since = since
			}
			
			public func responseFromObject(object: AnyObject, URLResponse: NSHTTPURLResponse) -> [Gist]? {
				
                do {

                    return try decodeArray(object) as [Gist]
                }
                catch {
                    
                    NSLog("\(error)")
                    return nil
                }
            }
            
            public func errorFromObject(object: AnyObject, URLResponse: NSHTTPURLResponse) -> ErrorType? {
                
                do {

                    return try decodeValue(object) as GistError
                }
                catch {
                    
                    return error
                }
            }
		}
		
		public struct CreateGist : GistsRequest, RequestWithAuthentication {
		
			public let method:HTTPMethod = .POST
			public let acceptableStatusCodes:Set<Int> = [ 201 ]
			public let path:String = ""
			
			public var files:[GistFile]
			public var description:String
			public var publicGist:Bool
			
			public var authorization:GitHubAuthorization
			
			public init(authorization:GitHubAuthorization, files:[GistFile], description:String, publicGist:Bool) {
				
				self.authorization = authorization
				self.files = files
				self.description = description
				self.publicGist = publicGist
			}
			
			public init(authorization:GitHubAuthorization, files:[GistFile], description:String) {
				
				self.init(authorization: authorization, files: files, description: description, publicGist: false)
			}
			
			public var parameters:[String:AnyObject] {
				
				return [
					
					"description" : self.description,
					"public" : toJSONBool(self.publicGist),
					"files" : self.files.toJSONObject()
				]
			}

			public func responseFromObject(object: AnyObject, URLResponse: NSHTTPURLResponse) -> GistCreated? {
				
                do {

                    return try decodeValue(object) as GistCreated
                }
                catch {
                    
                    NSLog("\(error)")
                    return nil
                }
			}
            
            public func errorFromObject(object: AnyObject, URLResponse: NSHTTPURLResponse) -> ErrorType? {
                
                do {

                    return try decodeValue(object) as GistError
                }
                catch {
                    
                    return error
                }
            }
		}
	}
}
