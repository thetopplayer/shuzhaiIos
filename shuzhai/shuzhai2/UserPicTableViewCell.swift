//
//  UserPicTableViewCell.swift
//  shuzhai2
//
//  Created by VincentHe on 7/21/15.
//  Copyright (c) 2015 VincentHe. All rights reserved.
//

import UIKit

class UserPicTableViewCell: UITableViewCell {
    
    @IBOutlet var nameLabel:UILabel?
    @IBOutlet var profileImg:UIImageView?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
