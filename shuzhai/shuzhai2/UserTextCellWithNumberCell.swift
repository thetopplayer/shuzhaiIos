//
//  UserTextCellWithNumberCell.swift
//  shuzhai2
//
//  Created by VincentHe on 7/21/15.
//  Copyright (c) 2015 VincentHe. All rights reserved.
//

import UIKit

class UserTextCellWithNumberCell: UITableViewCell {

    @IBOutlet var numberLabel:UILabel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setCountNumber(count:Int?)
    {
        if let count = count{
            self.numberLabel?.text = String(format: "(%d)", count)
        }
        
    }
}
