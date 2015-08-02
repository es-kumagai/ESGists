//
//  CreateGistViewController.swift
//  ESGist
//
//  Created by Tomohiro Kumagai on H27/07/20.
//  Copyright © 平成27年 EasyStyle G.K. All rights reserved.
//

import UIKit
import ESGists
import APIKit

class CreateGistViewController: UIViewController {

	@IBOutlet weak var filenameTextField:UITextField!
	@IBOutlet weak var fileContentTextView:UITextView!
	@IBOutlet weak var descriptionTextField:UITextField!
	@IBOutlet weak var publicSwitch:UISwitch!
	
	@IBAction func pushPostButton(sender:UIButton?) {
		
		let file = GistFile(name: self.filenameTextField.text!, content: self.fileContentTextView.text!)
		let description = self.descriptionTextField.text!
		let publicGist = self.publicSwitch.on
		
		let request = GitHubAPI.Gists.CreateGist(authorization: authorization, files: [file], description: description, publicGist: publicGist)
	
		NSLog("Public=\(publicGist), File=\(file.name), description=\(description)")
		NSLog("Try to send request: base url = \(request.baseURL), path = \(request.path).")
		
		GitHubAPI.sendRequest(request) { response in
			
			switch response {
				
			case .Success(let gist):
				
				self.clear()
				self.showAlert("A Gist created successfully", message: String(gist))
				
			case .Failure(let error):
				
				self.showErrorAlert("Failed to post a gist", error: error)
			}
		}
	}
	
	func clear() {
	
		self.filenameTextField.text = ""
		self.descriptionTextField.text = ""
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
