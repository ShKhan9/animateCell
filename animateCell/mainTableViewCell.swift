//
//  mainTableViewCell.swift
//  MasryTester
//
//  Created by Approcks Mac Mini on 1/9/17.
//  Copyright © 2017 Approcks. All rights reserved.
//

import UIKit

/**
 
 ## mainTableViewCell class ##
 
 This class is a layout cell to dispaly main tableview
 
 */

class mainTableViewCell: UITableViewCell {

    @IBOutlet weak var labeltopCon: NSLayoutConstraint!
    @IBOutlet weak var leftLb: UILabel!
    var animate:Bool!
    var cellIndex:Int!
    override func awakeFromNib() {
        super.awakeFromNib()
     
        cellIndex  = 0
        
        animate = false
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
