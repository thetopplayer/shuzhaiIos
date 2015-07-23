//
//  UserNicknameChangeController.swift
//  shuzhai2
//
//  Created by VincentHe on 7/22/15.
//  Copyright (c) 2015 VincentHe. All rights reserved.
//

import UIKit

class UserNicknameChangeController: UIViewController,UITextFieldDelegate {

    
    @IBOutlet var tableView:UITableView?
    var textField:UITextField?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView!.contentInset = UIEdgeInsetsMake(-36,0,0,0);
        
        
        var saveButton : UIBarButtonItem = UIBarButtonItem(title: "保存", style: UIBarButtonItemStyle.Plain, target: self, action: "save")
        self.navigationItem.rightBarButtonItem = saveButton
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return 1
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell:UITableViewCell!
        
        if indexPath.row==0
        {
            var cell = self.tableView!.dequeueReusableCellWithIdentifier("nickNameCell") as! modifyNickNameCell
            self.textField =  cell.textField
            self.textField?.delegate = self
            self.textField?.becomeFirstResponder()
            return cell
        }

        
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 66
    }
    
    
    func save()
    {
        var userNewNickName = self.textField?.text
        DataManager.updateUserInformation(UserInfoModification.nickName, value: userNewNickName) { (success, message, error) -> Void in
            if success! == false
            {
                //TODO log unsucess
            }else
            {
                var user = Util.getLocalUserAsObject()
                user?.nickName = userNewNickName
                Util.saveUserObjectToPlist(user)
            }
            self.navigationController?.popViewControllerAnimated(true)
        }
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
    
//    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
//        if indexPath.row==1 && indexPath.section == 0
//        {
//            self.performSegueWithIdentifier("changeNickNameSegue", sender: nil)
//        }
//    }
}
