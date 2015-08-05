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

class UserTextCellWithNumberAndBotton:UserTextCellWithNumberCell
{
    @IBOutlet var button:UIButton?
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    var buttonCall:(() -> ())?
    
    @IBAction func buttonClicked(sender:UIButton)
    {
        if sender.tag == 0 // like
        {
            if let buttonCall = buttonCall{
                buttonCall()
            }
        }
    }
    
}

class RegistEditTableViewCell: UITableViewCell {
    
    @IBOutlet var textField:UITextField?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        //self.textField!.secureTextEntry = true;
        // Initialization code
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}

class modifyNickNameCell: UITableViewCell {
    
    @IBOutlet var textField:UITextField?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.textField?.becomeFirstResponder()
        var user:User? = Util.getLocalUserAsObject()
        if let userNickName = user?.nickName{
            self.textField?.placeholder = userNickName
        }
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }

}

class UserProfileSettingTextCell: UITableViewCell  {
    @IBOutlet var label:UILabel?
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
}