//
//  UsersViewController.swift
//  ESGists
//
//  Created by Tomohiro Kumagai on H27/08/12.
//  Copyright © 平成27年 EasyStyle G.K. All rights reserved.
//

import UIKit
import ESGists
import APIKit

class UsersViewController: UIViewController {

	@IBOutlet weak var usernameTextField:UITextField!

	@IBOutlet weak var idLabel:UILabel!
	@IBOutlet weak var loginLabel:UILabel!
	@IBOutlet weak var nameLabel:UILabel!
	@IBOutlet weak var urlLabel:UILabel!
	@IBOutlet weak var typeLabel:UILabel!
	@IBOutlet weak var createdAtLabel:UILabel!
	
	@IBAction func pushGetButton(sender:UIButton?) {
		
		let username = self.usernameTextField.text!
		let request = GitHubAPI.Users.GetSingleUser(username: username)
		
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
	
	var user:GistUser? {
		
		didSet {
			
			self.idLabel.text = self.user?.id.description
			self.loginLabel.text = self.user?.login
			self.nameLabel.text = self.user?.name
			self.urlLabel.text = self.user?.urls.htmlUrl.description
			self.typeLabel.text = self.user?.type.rawValue
		}
	}

	override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
