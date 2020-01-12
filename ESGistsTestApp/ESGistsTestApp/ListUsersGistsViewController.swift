//
//  ListUsersGistsViewController.swift
//  ESGist
//
//  Created by Tomohiro Kumagai on H27/07/20.
//  Copyright © 平成27年 EasyStyle G.K. All rights reserved.
//

import UIKit
import ESGists
import APIKit

class ListUsersGistsViewController: UIViewController {

	var gists:[Gist]? {
		
		didSet {

			NSLog("Will update Gist list.")
			self.gistsTableView?.reloadData()
		}
	}
	
	@IBOutlet weak var usernameTextField:UITextField!
	@IBOutlet weak var sinceSwitch:UISwitch!
	@IBOutlet weak var sinceDatePicker:UIDatePicker!
	
	@IBOutlet weak var gistsTableView:UITableView!
	
	@IBAction func pushGetButton(sender:UIButton?) {
		
		let request:GitHubAPI.Gists.ListUsersGists
		let username = self.usernameTextField.text!
		
		if self.sinceSwitch.on {

			let date = Date(self.sinceDatePicker.date)
			
			NSLog("Username = \(username), date = \(date.ISO8601String)")
			
			request = GitHubAPI.Gists.ListUsersGists(username: username, since: date)
		}
		else {
			
			NSLog("Username = \(username)")
			
			request = GitHubAPI.Gists.ListUsersGists(username: username)
		}
		
		NSLog("Try to send request: base url = \(request.baseURL), path = \(request.path).")
		
		GitHubAPI.sendRequest(request) { response in
			
			switch response {
				
			case .success(let list):
				
				self.gists = list
				
			case .failure(let error):
				
				self.gists = nil
				self.showErrorAlert("Failed to get gists", error: error)
			}
		}
	}
	
    override func viewDidLoad() {
        super.viewDidLoad()

		GistSummaryTableViewCell.registerNib(to: self.gistsTableView)
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

extension ListUsersGistsViewController : UITableViewDelegate {
	
}

extension ListUsersGistsViewController : UITableViewDataSource {
	
	func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		
		let count = self.gists?.count ?? 0
		
		NSLog("Gist count: \(count)")
		
		return count
	}
	
	func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		
		let cell = GistSummaryTableViewCell.dequeue(from: tableView)!

		cell.gist = self.gists![indexPath.row]
		
		return cell
	}
}
