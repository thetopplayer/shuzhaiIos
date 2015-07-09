//
//  TitleTableViewCell.swift
//  shuzhai2
//
//  Created by VincentHe on 7/4/15.
//  Copyright (c) 2015 VincentHe. All rights reserved.
//

import UIKit

class TitleTableViewCell: UITableViewCell {

    @IBOutlet var titleLabel:UILabel?
    @IBOutlet var storyImgView:UIImageView?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
