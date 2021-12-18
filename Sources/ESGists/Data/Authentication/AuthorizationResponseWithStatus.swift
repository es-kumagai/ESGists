//
//  AuthorizationResponse.swift
//  ESGist
//
//  Created by Tomohiro Kumagai on H27/07/20.
//  Copyright © 平成27年 EasyStyle G.K. All rights reserved.
//

public struct AuthorizationResponseWithStatus : Sendable {
	
    public enum Status : Sendable {
		
		case created
		case alreadyExists
	}
	
	public var status: Status
	public var authorization: AuthorizationResponse
	
	public init?(status:Int, authorization: @autoclosure () -> AuthorizationResponse) {
		
		switch status {
			
		case 201:
			self.status = .created
			
		case 200:
			self.status = .alreadyExists
			
		default:
			return nil
		}
		
		self.authorization = authorization()
	}
}
