//
//  Authorization.swift
//  ESGist
//
//  Created by Tomohiro Kumagai on H27/07/20.
//  Copyright © 平成27年 EasyStyle G.K. All rights reserved.
//

import Foundation
import ESGists

var authorization = GitHubAuthorization()
var client = GitHubClient()

extension GitHubAuthorization {
	
	private init() {
		
		let bundle = NSBundle.mainBundle()
		let path = bundle.pathForResource("SampleAccount", ofType: "plist")!
		
		let data = NSDictionary(contentsOfFile: path) as! [String:String]
		
		self.init(id: data["id"]!, password: data["password"]!)
	}
}

struct GitHubClient {
	
	var id:String
	var secret:String
	
	private init() {
		
		let bundle = NSBundle.mainBundle()
		let path = bundle.pathForResource("SampleAccount", ofType: "plist")!
		
		let data = NSDictionary(contentsOfFile: path) as! [String:String]
		
		self.id = data["client_id"]!
		self.secret = data["client_secret"]!
	}
}
