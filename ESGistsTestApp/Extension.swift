//
//  Extension.swift
//  ESGist
//
//  Created by Tomohiro Kumagai on H27/07/20.
//  Copyright © 平成27年 EasyStyle G.K. All rights reserved.
//

// 将来的に別のモジュールへ移動できそうな機能を実装しています。

import UIKit
import APIKit

// MARK: - UIKit

public protocol NibRegisterableCell : AnyObject {
	
}

extension NibRegisterableCell {
	
	public static var defaultReuseIdentifier:String {
	
		return NSStringFromClass(self).componentsSeparatedByString(".").last!
	}
	
	public static var nib:UINib {
	
		let name = self.defaultReuseIdentifier
		
		return UINib(nibName: name, bundle: nil)
	}

	public static func registerNib(to tableView:UITableView) {
		
		self.registerNib(to: tableView, reuseIdentifier: self.defaultReuseIdentifier)
	}
	
	public static func registerNib(to tableView:UITableView, reuseIdentifier:String) {
		
		tableView.registerNib(self.nib, forCellReuseIdentifier: reuseIdentifier)
	}

	public static func dequeue(from tableView:UITableView) -> Self? {

		return self.dequeue(from: tableView, reuseIdentifier: self.defaultReuseIdentifier)
	}
	
	public static func dequeue(from tableView:UITableView, reuseIdentifier:String) -> Self? {
		
		return tableView.dequeueReusableCellWithIdentifier(reuseIdentifier) as? Self
	}
}

// MARK: - APIKit

extension APIError : CustomDebugStringConvertible {
	
	public var debugDescription:String {
		
		switch self {
			
		case ConnectionError(let error):
			return error.localizedDescription
			
		case InvalidBaseURL(let url):
			return "Invalid base URL (\(url))"
			
		case ConfigurationError(let error):
			return "Configuration error (\(error))"
			
		case RequestBodySerializationError(let error):
			return "Request body serialization error (\(error))"
			
		case UnacceptableStatusCode(let code, let error):
			return "Unacceptable status code \(code) (\(error))"
			
		case ResponseBodyDeserializationError(let error):
			return "Response body deserialization error (\(error))"
			
		case InvalidResponseStructure(let object):
			return "Invalid response structure (\(object))"
			
		case NotHTTPURLResponse(let response):
			return "Not HTTP URL Response (\(response))"
		}
	}
}

