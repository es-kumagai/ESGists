//
//  AuthorizationsAPI.swift
//  ESGist
//
//  Created by Tomohiro Kumagai on H27/07/20.
//  Copyright © 平成27年 EasyStyle G.K. All rights reserved.
//

@preconcurrency import APIKit
import Foundation

/*!
OAuth Authorizations API
https://developer.github.com/v3/oauth_authorizations/#create-a-new-authorization
*/

private let jsonDecoder = JSONDecoder()

public protocol OAuthAuthorizationsRequest : RequestWithAuthentication {
	
}

extension OAuthAuthorizationsRequest {
	
    public var baseURL: Foundation.URL {
		
		Foundation.URL(string: "https://api.github.com/authorizations")!
	}
    
    public func intercept(object: Any, urlResponse: HTTPURLResponse) throws -> Any {

        guard urlResponse.statusCode == 200 else {
            
            let data = try JSONSerialization.data(withJSONObject: object, options: [])

            throw try jsonDecoder.decode(GistError.self, from: data)
        }
            
        return object
    }
}

extension GitHubAPI {
	
	public class OAuthAuthorizations : Session {
		
        public enum Option : Sendable {
			
			case scopes(Set<Scope>)
			case noteUrl(URL)
			case clientId(String)
			case clientSecret(String)
			case fingerprint(String)
			case note(String)
		}
		
		public struct ListYourAuthorizations : OAuthAuthorizationsRequest {
			
			public let method: HTTPMethod = .get
			public let path: String = ""
			
			public var authorization: GitHubAuthorization
			
			public init(authorization: GitHubAuthorization) {
				
				self.authorization = authorization
			}
			
			public func response(from object: Any, urlResponse: HTTPURLResponse) throws -> [AuthorizationResponse] {
				
                let data = try JSONSerialization.data(withJSONObject: object, options: [])

                return try jsonDecoder.decode([AuthorizationResponse].self, from: data)
			}
		}
		
		public struct GetSingleAuthorization : OAuthAuthorizationsRequest {
			
			public let method: HTTPMethod = .get

			public var id: ID
			public var authorization: GitHubAuthorization
			
			public init(authorization: GitHubAuthorization, id: ID) {
				
				self.authorization = authorization
				self.id = id
			}
			
			public var path: String {
				
				"\(self.id)"
			}
			
			public func response(from object: Any, urlResponse: HTTPURLResponse) throws -> AuthorizationResponse {
				
                let data = try JSONSerialization.data(withJSONObject: object, options: [])

                return try jsonDecoder.decode(AuthorizationResponse.self, from: data)
			}
		}
		
		public struct CreateNewAuthorization : OAuthAuthorizationsRequest {

			public let method: HTTPMethod = .post
			public let path: String = ""

			public var authorization: GitHubAuthorization
			public var note: String
			public var options: Set<OAuthAuthorizations.Option>
			
			public var bodyParameters: BodyParameters? {
			
				var parameters = options.toJSON()
				
				parameters["note"] = note

				#if DEBUG
                let data = try! NSString(data: JSONSerialization.data(withJSONObject: parameters, options: JSONSerialization.WritingOptions.prettyPrinted), encoding: String.Encoding.utf8.rawValue)!
				NSLog("Parameters = \(data)")
				#endif
				
				return JSONBodyParameters(JSONObject: parameters)
			}
			
			public init(authorization:GitHubAuthorization, note:String) {
				
				self.init(authorization: authorization, note: note, options:[])
			}
			
			public init(authorization:GitHubAuthorization, note:String, options:Set<OAuthAuthorizations.Option>) {
				
				self.authorization = authorization
				self.note = note
				self.options = options
			}
			
			public func response(from object: Any, urlResponse: HTTPURLResponse) throws -> AuthorizationResponse {

                let data = try JSONSerialization.data(withJSONObject: object, options: [])

                return try jsonDecoder.decode(AuthorizationResponse.self, from: data)
			}
            
            public func intercept(object: Any, urlResponse: HTTPURLResponse) throws -> Any {

                guard urlResponse.statusCode == 201 else {
                    
                    let data = try JSONSerialization.data(withJSONObject: object, options: [])

                    throw try jsonDecoder.decode(GistError.self, from: data)
                }
                    
                return object
            }
		}

		public struct GetOrCreateNewAuthorization : OAuthAuthorizationsRequest {
			
			public let method: HTTPMethod = .put
			
			public var clientId: String
			public var clientSecret: String
			public var authorization: GitHubAuthorization
			public var options: Set<OAuthAuthorizations.Option>
			
			public var path: String {
				
				return "/clients/\(self.clientId)"
			}
			
			public var bodyParameters: BodyParameters? {
				
                var parameters = options.toJSON()
				
				parameters["client_id"] = nil
				parameters["client_secret"] = self.clientSecret
				
				#if DEBUG
                let data = try! NSString(data:JSONSerialization.data(withJSONObject: parameters, options: JSONSerialization.WritingOptions.prettyPrinted), encoding:String.Encoding.utf8.rawValue)!
					NSLog("Parameters = \(data)")
				#endif
				
				return JSONBodyParameters(JSONObject: parameters)
			}
			
			public init(authorization:GitHubAuthorization, clientId:String, clientSecret:String) {
				
				self.init(authorization: authorization, clientId: clientId, clientSecret: clientSecret, options:[])
			}
			
			public init(authorization:GitHubAuthorization, clientId:String, clientSecret:String, options:Set<OAuthAuthorizations.Option>) {
				
				self.authorization = authorization
				self.clientId = clientId
				self.clientSecret = clientSecret
				self.options = options
			}
			
            public func response(from object: Any, urlResponse: HTTPURLResponse) throws -> AuthorizationResponseWithStatus {
                
                let data = try JSONSerialization.data(withJSONObject: object, options: [])

                let authorization = try jsonDecoder.decode(AuthorizationResponse.self, from: data)
                
                guard let response = AuthorizationResponseWithStatus(status: urlResponse.statusCode, authorization: authorization) else {

                    throw ResponseError.unexpectedObject(object)
                }
                
                return response
            }
            
            public func intercept(object: Any, urlResponse: HTTPURLResponse) throws -> Any {

                guard 200 ..< 202 ~= urlResponse.statusCode else {
                    
                    let data = try JSONSerialization.data(withJSONObject: object, options: [])

                    throw try jsonDecoder.decode(GistError.self, from: data)
                }
                    
                return object
            }
		}
		
		public struct DeleteAuthorization : OAuthAuthorizationsRequest {
			
			public let method: HTTPMethod = .delete
			
			public var id: ID
			public var authorization: GitHubAuthorization

			public var path: String {
				
				return "/\(self.id)"
			}
			
			public init(authorization: GitHubAuthorization, id:ID) {
				
				self.authorization = authorization
				self.id = id
			}
			
			public func response(from object: Any, urlResponse: HTTPURLResponse) throws -> Void {

				return ()
			}
            
            public func intercept(object: Any, urlResponse: HTTPURLResponse) throws -> Any {

                // Token では削除できないようなので、403 で失敗しても認証情報を削除するだけにします。
                guard [204, 403].contains(urlResponse.statusCode) else {
                    
                    let data = try JSONSerialization.data(withJSONObject: object, options: [])

                    throw try jsonDecoder.decode(GistError.self, from: data)
                }
                    
                return object
            }
		}
	}
}

extension GitHubAPI.OAuthAuthorizations.Option : JSONObjectConvertible {
	
	public func toJSON() -> Dictionary<String, Any> {
		
		switch self {
			
        case .scopes(let scopes) where scopes.count == 0:
			return [:]

        case .scopes(let scopes):
            return [ "scopes" : scopes.map { $0.rawValue } ]
            
		case .note(let note):
			return [ "note" : note ]
			
		case .noteUrl(let url):
            return [ "note_url" : url.rawValue ]
			
		case .clientId(let id):
			return [ "client_id" : id ]
			
		case .clientSecret(let secret):
			return [ "client_secret" : secret ]
			
		case .fingerprint(let fingerprint):
			return [ "fingerprint" : fingerprint ]
		}
	}
}

extension GitHubAPI.OAuthAuthorizations.Option : Hashable {

	public var scopes: Set<Scope>? {
		
		guard case .scopes(let value) = self else {
			
			return nil
		}
		
		return value
	}
	
	public var noteUrl: URL? {
		
		guard case .noteUrl(let value) = self else {
			
			return nil
		}
		
		return value
	}
	
	public var clientId: String? {
		
		guard case .clientId(let value) = self else {
			
			return nil
		}
		
		return value
	}
	
	public var clientSecret: String? {
		
		guard case .clientSecret(let value) = self else {
			
			return nil
		}
		
		return value
	}
	
	public var fingerprint: String? {
		
		guard case .fingerprint(let value) = self else {
			
			return nil
		}
		
		return value
	}
	
	/// 列挙子の値を考慮せずに一致判定を行います。オプション項目の一致に着目します。
    public func hash(into hasher: inout Hasher) {
        
		switch self {
			
		case .scopes:
            hasher.combine(1)
			
		case .note:
            hasher.combine(2)
			
		case .noteUrl:
            hasher.combine(3)
			
		case .clientId:
            hasher.combine(4)
			
		case .clientSecret:
            hasher.combine(5)
			
		case .fingerprint:
            hasher.combine(6)
		}
	}
}

public func == (lhs: GitHubAPI.OAuthAuthorizations.Option, rhs: GitHubAPI.OAuthAuthorizations.Option) -> Bool {
	
	return lhs.hashValue == rhs.hashValue
}
