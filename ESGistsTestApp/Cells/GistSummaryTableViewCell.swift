//
//  GistSummaryTableViewCell.swift
//  ESGist
//
//  Created by Tomohiro Kumagai on H27/07/20.
//  Copyright © 平成27年 EasyStyle G.K. All rights reserved.
//

import ESGists
import UIKit

class GistSummaryTableViewCell: UITableViewCell, NibRegisterableCell {

	@IBOutlet var descriptionLabel:UILabel!
	@IBOutlet var timestampLabel:UILabel!
	
	var gist:Gist! {
		
		didSet {
			
			self.descriptionLabel.text = self.gist.description
			self.timestampLabel.text = String(self.gist.timestamp)
		}
	}
}
