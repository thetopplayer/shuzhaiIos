//
//  StoryTextBodyCell.swift
//  shuzhai2
//
//  Created by VincentHe on 7/4/15.
//  Copyright (c) 2015 VincentHe. All rights reserved.
//

import UIKit

class StoryTextBodyCell: UITableViewCell {

    @IBOutlet var textBodyView:UITextView?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func getConfiguredCellHeight() -> CGFloat
    {
        var size:CGSize? = textBodyView?.frame.size
        if let size1 = size{
            var sizeThatShouldFitTheContent:CGSize = self.textBodyView!.sizeThatFits(size1)
            return sizeThatShouldFitTheContent.height;
        }
        return CGSizeZero.height
    }

}
