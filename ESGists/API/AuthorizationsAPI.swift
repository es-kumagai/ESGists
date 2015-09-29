//
//  AuthorizationsAPI.swift
//  ESGist
//
//  Created by Tomohiro Kumagai on H27/07/20.
//  Copyright © 平成27年 EasyStyle G.K. All rights reserved.
//

import APIKit
import Himotoki

/*!
OAuth Authorizations API
https://developer.github.com/v3/oauth_authorizations/#create-a-new-authorization
*/

public protocol OAuthAuthorizationsRequest : RequestWithAuthentication {
	
}

extension OAuthAuthorizationsRequest {
	
	public var baseURL:NSURL {
		
		return NSURL(string: "https://api.github.com/authorizations")!
	}
}

extension GitHubAPI {
	
	public class OAuthAuthorizations : API {
		
		public enum Option {
			
			case Scopes(Set<Scope>)
			case NoteUrl(URL)
			case ClientId(String)
			case ClientSecret(String)
			case Fingerprint(String)
			case Note(String)
		}
		
		public struct ListYourAuthorizations : OAuthAuthorizationsRequest {
			
			public let method:HTTPMethod = .GET
			public let path:String = ""
			public let acceptableStatusCodes:Set<Int> = [ 200 ]
			
			public var authorization:GitHubAuthorization
			
			public init(authorization:GitHubAuthorization) {
				
				self.authorization = authorization
			}
			
			public func responseFromObject(object: AnyObject, URLResponse: NSHTTPURLResponse) -> [AuthorizationResponse]? {
				
                do {

                    return try decodeArray(object)
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
		
		public struct GetSingleAuthorization : OAuthAuthorizationsRequest {
			
			public let method:HTTPMethod = .GET
			public let acceptableStatusCodes:Set<Int> = [ 200 ]

			public var id:ID
			public var authorization:GitHubAuthorization
			
			public init(authorization:GitHubAuthorization, id:ID) {
				
				self.authorization = authorization
				self.id = id
			}
			
			public var path:String {
				
				return "\(self.id)"
			}
			
			public func responseFromObject(object: AnyObject, URLResponse: NSHTTPURLResponse) -> AuthorizationResponse? {
				
                do {

                    return try decode(object) as AuthorizationResponse
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
		
		public struct CreateNewAuthorization : OAuthAuthorizationsRequest {

			public let method:HTTPMethod = .POST
			public let path:String = ""
			public let acceptableStatusCodes:Set<Int> = [ 201 ]

			public var authorization:GitHubAuthorization
			public var note:String
			public var options:Set<OAuthAuthorizations.Option>
			
			public var parameters:[String:AnyObject] {
			
				var result = self.options.toJSONObject()
				
				result["note"] = self.note

				#if DEBUG
				let data = try! NSString(data:NSJSONSerialization.dataWithJSONObject(result, options: NSJSONWritingOptions.PrettyPrinted), encoding:NSUTF8StringEncoding)!
				NSLog("Parameters = \(data)")
				#endif
				
				return result
			}
			
			public init(authorization:GitHubAuthorization, note:String) {
				
				self.init(authorization: authorization, note: note, options:[])
			}
			
			public init(authorization:GitHubAuthorization, note:String, options:Set<OAuthAuthorizations.Option>) {
				
				self.authorization = authorization
				self.note = note
				self.options = options
			}
			
			public func responseFromObject(object: AnyObject, URLResponse: NSHTTPURLResponse) -> AuthorizationResponse? {
				
                do {

                    return try decode(object) as AuthorizationResponse
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

		public struct GetOrCreateNewAuthorization : OAuthAuthorizationsRequest {
			
			public let method:HTTPMethod = .PUT
			public let acceptableStatusCodes:Set<Int> = [ 200, 201 ]
			
			public var clientId:String
			public var clientSecret:String
			public var authorization:GitHubAuthorization
			public var options:Set<OAuthAuthorizations.Option>
			
			public var path:String {
				
				return "/clients/\(self.clientId)"
			}
			
			public var parameters:[String:AnyObject] {
				
				var result = self.options.toJSONObject()
				
				result["client_id"] = nil
				result["client_secret"] = self.clientSecret
				
				#if DEBUG
					let data = try! NSString(data:NSJSONSerialization.dataWithJSONObject(result, options: NSJSONWritingOptions.PrettyPrinted), encoding:NSUTF8StringEncoding)!
					NSLog("Parameters = \(data)")
				#endif
				
				return result
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
			
			public func responseFromObject(object: AnyObject, URLResponse: NSHTTPURLResponse) -> AuthorizationResponseWithStatus? {
				
                do {

                    let authorization = try decode(object) as AuthorizationResponse
				
                    return AuthorizationResponseWithStatus(status: URLResponse.statusCode, authorization: authorization)
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
		
		public struct DeleteAuthorization : OAuthAuthorizationsRequest {
			
			public let method:HTTPMethod = .DELETE

			// Token では削除できないようなので、403 で失敗しても認証情報を削除するだけにします。
			public let acceptableStatusCodes:Set<Int> = [ 204, 403 ]
			
			public var id:ID
			public var authorization:GitHubAuthorization

			public var path:String {
				
				return "/\(self.id)"
			}
			
			public init(authorization:GitHubAuthorization, id:ID) {
				
				self.authorization = authorization
				self.id = id
			}
			
			public func responseFromObject(object: AnyObject, URLResponse: NSHTTPURLResponse) -> Void? {

				return ()
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

extension GitHubAPI.OAuthAuthorizations.Option : JSONObjectConvertible {
	
	public func toJSONObject() -> [String : AnyObject] {
		
		switch self {
			
		case .Scopes(let scopes):
			return scopes.count == 0 ? [:] : [ "scopes" : scopes.map { $0.rawValue } ]
			
		case .Note(let note):
			return [ "note" : note ]
			
		case .NoteUrl(let url):
			return [ "note_url" : String(url) ]
			
		case .ClientId(let id):
			return [ "client_id" : id ]
			
		case .ClientSecret(let secret):
			return [ "client_secret" : secret ]
			
		case .Fingerprint(let fingerprint):
			return [ "fingerprint" : fingerprint ]
		}
	}
}

extension GitHubAPI.OAuthAuthorizations.Option : Hashable {

	public var scopes:Set<Scope>? {
		
		guard case .Scopes(let value) = self else {
			
			return nil
		}
		
		return value
	}
	
	public var noteUrl:URL? {
		
		guard case .NoteUrl(let value) = self else {
			
			return nil
		}
		
		return value
	}
	
	public var clientId:String? {
		
		guard case .ClientId(let value) = self else {
			
			return nil
		}
		
		return value
	}
	
	public var clientSecret:String? {
		
		guard case .ClientSecret(let value) = self else {
			
			return nil
		}
		
		return value
	}
	
	public var fingerprint:String? {
		
		guard case .Fingerprint(let value) = self else {
			
			return nil
		}
		
		return value
	}
	
	/// 列挙子の値を考慮せずに一致判定を行います。オプション項目の一致に着目します。
	public var hashValue:Int {
		
		switch self {
			
		case .Scopes:
			return 1
			
		case .Note:
			return 2
			
		case .NoteUrl:
			return 3
			
		case .ClientId:
			return 4
			
		case .ClientSecret:
			return 5
			
		case .Fingerprint:
			return 6
		}
	}
}

public func == (lhs:GitHubAPI.OAuthAuthorizations.Option, rhs:GitHubAPI.OAuthAuthorizations.Option) -> Bool {
	
	return lhs.hashValue == rhs.hashValue
}
