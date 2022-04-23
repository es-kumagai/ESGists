//
//  Gists.swift
//  ESGist
//
//  Created by Tomohiro Kumagai on H27/07/20.
//  Copyright © 平成27年 EasyStyle G.K. All rights reserved.
//

@preconcurrency import APIKit
import Foundation

private let jsonDecoder = JSONDecoder()

/*!
Gists API
https://developer.github.com/v3/gists/
*/

public protocol GistsRequest : Request {
	
}

extension GistsRequest {
	
    public var baseURL: Foundation.URL {
		
        return Foundation.URL(string: "https://api.github.com/gists")!
	}
}

extension GitHubAPI {
	
	public class Gists : Session {
		
		public struct ListUsersGists : GitHubRequest {
			
			public let method: HTTPMethod = .get
			
			public var username: String
			public var since: ISO8601Date?

			public var path:String {
				
				return "/users/\(self.username)/gists"
			}
			
			public var bodyParameters: BodyParameters? {
				
                let parameters: [String : Any]
                
                switch since {
					
                case .some(let date):
					parameters = [ "since" : date.iso8601String ]

                case .none:
					parameters = [:]
				}
                
                return JSONBodyParameters(JSONObject: parameters)
			}
			
			public init(username: String) {
			
				self.username = username
				self.since = nil
			}
			
			public init(username: String, since: ISO8601Date) {

				self.username = username
				self.since = since
			}
			
			public func response(from object: Any, urlResponse: HTTPURLResponse) throws -> [Gist] {
				
                let data = try JSONSerialization.data(withJSONObject: object, options: [])
                return try jsonDecoder.decode([Gist].self, from: data)
            }
            
            public func intercept(object: Any, urlResponse: HTTPURLResponse) throws -> Any {

                guard urlResponse.statusCode == 200 else {
                    
                    let data = try JSONSerialization.data(withJSONObject: object, options: [])
                    throw try jsonDecoder.decode(GistError.self, from: data)
                }
                    
                return object
            }
		}
		
		public struct CreateGist : GistsRequest, RequestWithAuthentication {
		
			public let method: HTTPMethod = .post
			public let path: String = ""
			
			public var files: [GistFile]
			public var description: String
			public var publicGist: Bool
			
			public var authorization: GitHubAuthorization
			
			public init(authorization: GitHubAuthorization, files: [GistFile], description: String, publicGist: Bool) {
				
				self.authorization = authorization
				self.files = files
				self.description = description
				self.publicGist = publicGist
			}
			
			public init(authorization: GitHubAuthorization, files: [GistFile], description: String) {
				
				self.init(authorization: authorization, files: files, description: description, publicGist: false)
			}
			
            public var bodyParameters: BodyParameters? {
            
                let parameters: [String : Any] = [
                    
                    "description" : description,
                    "public" : publicGist.toJSON(),
                    "files" : files.toJSON()
                    ]
                
                return JSONBodyParameters(JSONObject: parameters)
            }

			public func response(from object: Any, urlResponse: HTTPURLResponse) throws -> GistCreated {
				
                let data = try JSONSerialization.data(withJSONObject: object, options: [])
                return try jsonDecoder.decode(GistCreated.self, from: data)
			}
            
            public func intercept(object: Any, urlResponse: HTTPURLResponse) throws -> Any {

                guard urlResponse.statusCode == 201 else {
                    
                    let data = try JSONSerialization.data(withJSONObject: object, options: [])
                    throw try jsonDecoder.decode(GistError.self, from: data)
                }
                    
                return object
            }
		}
	}
}
