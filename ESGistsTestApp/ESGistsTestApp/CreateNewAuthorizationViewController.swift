//
//  CreateNewAuthorizationViewController.swift
//  ESGist
//
//  Created by Tomohiro Kumagai on H27/07/21.
//  Copyright © 平成27年 EasyStyle G.K. All rights reserved.
//

import UIKit
import ESGists
import APIKit

class CreateNewAuthorizationViewController: UIViewController {

	@IBOutlet weak var useClientIdSwitch:UISwitch!
	@IBOutlet weak var noteTextField:UITextField!
	
	@IBOutlet weak var gistScopeSwitch:UISwitch!
	@IBOutlet weak var publicRepoSwitch:UISwitch!
	
	var lastID:ID?
	
	@IBAction func pushGetAuthenticationButton(sender:UIButton?) {
		
		if let id = self.lastID {
			
			let request = GitHubAPI.OAuthAuthorizations.GetSingleAuthorization(authorization: authorization, id:id)
			
			GitHubAPI.sendRequest(request) { response in
				
				switch response {
					
				case .success(let authorized):
					
					self.showAlert("authorization get successfully", message: String(authorized))
					
				case .failure(let error):
					
					self.showErrorAlert("Failed to get authorization", error: error)
				}
			}
		}
		else {
			
			NSLog("Authorization is not loaded.")
		}
	}
	
	@IBAction func pushDeleteButton(sender:UIButton?) {
	
		if let id = self.lastID {
		
			let request = GitHubAPI.OAuthAuthorizations.DeleteAuthorization(authorization: authorization, id:id)

			GitHubAPI.sendRequest(request) { response in
				
				switch response {
					
				case .success:
					
					self.showAlert("Delete successfully", message: String(id))
					
				case .failure(let error):
					
					self.showErrorAlert("Failed to delete authorization", error: error)
				}
			}
		}
		else {
			
			NSLog("Authorization is not loaded.")
		}
	}
	
	@IBAction func pushCreateButton(sender:UIButton?) {
		
		let note = self.noteTextField.text!
		var scopes = Set<Scope>()
		
		if self.gistScopeSwitch.on {
			
			scopes.unionInPlace([Scope.Gist])
		}
		
		if self.publicRepoSwitch.on {
			
			scopes.unionInPlace([Scope.PublicRepo])
		}
		
		if self.useClientIdSwitch.on {
			
			let request = GitHubAPI.OAuthAuthorizations.GetOrCreateNewAuthorization(authorization: authorization, clientId: client.id, clientSecret: client.secret, options: [ .Scopes(scopes) ])
			
			NSLog("ClientID=\(client.id), Scopes=\(scopes)")
			NSLog("Try to send request: base url = \(request.baseURL), path = \(request.path).")
			
			GitHubAPI.sendRequest(request) { response in
				
				switch response {
					
				case .success(let authorized):
					
					self.lastID = authorized.authorization.id
					self.showAlert("Authorization successfully", message: String(authorized))
					
				case .failure(let error):
					
					self.showErrorAlert("Failed to authorization", error: error)
				}
			}
		}
		else {

			let request = GitHubAPI.OAuthAuthorizations.CreateNewAuthorization(authorization: authorization, note: note, options: [ .Scopes(scopes) ])

			NSLog("Note=\(note), Scopes=\(scopes)")
			NSLog("Try to send request: base url = \(request.baseURL), path = \(request.path).")
			
			GitHubAPI.sendRequest(request) { response in
				
				switch response {
					
				case .success(let authorized):
					
					self.lastID = authorized.id
					self.showAlert("Authorization successfully", message: String(authorized))
					
				case .failure(let error):
					
					self.showErrorAlert("Failed to authorization", error: error)
				}
			}
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
