//
//  Alerts.swift
//  ESGist
//
//  Created by Tomohiro Kumagai on H27/07/20.
//  Copyright © 平成27年 EasyStyle G.K. All rights reserved.
//

import UIKit
import APIKit

extension UIViewController {
	
	func showAlert(title:String, message:String) {
		
		let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
		let okAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
		
		alert.addAction(okAction)
		
		self.presentViewController(alert, animated: true, completion: nil)
	}
	
	func showErrorAlert(title:String, error:APIError) {
		
		NSLog("\(title)\n\(error)")
		
		let alert = UIAlertController(title: title, message: String(error), preferredStyle: UIAlertControllerStyle.Alert)
		let okAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
		
		alert.addAction(okAction)
		
		self.presentViewController(alert, animated: true, completion: nil)
	}
}

