//
//  StoryUtilCell.swift
//  shuzhai2
//
//  Created by VincentHe on 7/5/15.
//  Copyright (c) 2015 VincentHe. All rights reserved.
//

import UIKit

class StoryUtilCell: UITableViewCell {
    @IBOutlet var profileImg:UIImageView?
    @IBOutlet var userNameLabel:UILabel?
    @IBOutlet var likeButton:UIButton?
    @IBOutlet var markButton:UIButton?
    @IBOutlet var shareButton:UIButton?
    @IBOutlet var containerView:UIView?
    
    var dailyReadingBook:DaliyReadingBook?
    var parentViewController:UIViewController?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    

    @IBAction func likeBook()
    {
        var bookInfoId = self.dailyReadingBook?.bookInfoId
        if let bookInfoId = bookInfoId
        {
            var intId = Int(bookInfoId)
            DataManager.likeBook(self.parentViewController, bookId: intId, completionHandler: { (success, error) -> Void in
                var alert = UIAlertController(title: "牛读", message: "喜欢！", preferredStyle: UIAlertControllerStyle.Alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Cancel, handler: nil))
                self.parentViewController?.presentViewController(alert, animated: true, completion: nil);
            })
        }
        
    }
}
