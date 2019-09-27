//
//  AuthenticatedUserViewController.swift
//  ESGists
//
//  Created by Tomohiro Kumagai on H27/08/12.
//  Copyright © 平成27年 EasyStyle G.K. All rights reserved.
//

import UIKit
import ESGists
import APIKit

class AuthenticatedUserViewController: UsersViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
	@IBAction override func pushGetButton(sender:UIButton?) {
		
		let request = GitHubAPI.Users.GetAuthenticatedUser(authorization: authorization)
		
		NSLog("Try to send request: base url = \(request.baseURL), path = \(request.path).")
		
		GitHubAPI.sendRequest(request) { response in
			
			switch response {
				
			case .Success(let user):
				
				self.user = user
				
			case .Failure(let error):
				
				self.user = nil
				self.showErrorAlert("Failed to get user", error: error)
			}
		}
	}

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
