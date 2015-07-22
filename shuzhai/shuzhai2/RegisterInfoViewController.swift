//
//  RegisterInfoViewController.swift
//  shuzhai2
//
//  Created by VincentHe on 7/14/15.
//  Copyright (c) 2015 VincentHe. All rights reserved.
//

import UIKit

class RegisterInfoViewController: UIViewController {

    @IBOutlet var tableView:UITableView?
    
    var userNameCell:RegistEditTableViewCell?
    var userPasswordCell:RegistEditTableViewCell?
    var userEmailCell:RegistEditTableViewCell?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.hidden = false

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell:UITableViewCell!
        
        if indexPath.row==0
        {
            var cell = self.tableView!.dequeueReusableCellWithIdentifier("userNameCell") as! RegistEditTableViewCell
            self.userNameCell = cell;
            return cell
        }
        
        if indexPath.row==1
        {
            var cell = self.tableView!.dequeueReusableCellWithIdentifier("userEmailCell") as! RegistEditTableViewCell
            self.userEmailCell = cell
            return cell
        }
        
        if indexPath.row==2
        {
            var cell = self.tableView!.dequeueReusableCellWithIdentifier("userPasswordCell") as! RegistEditTableViewCell
            self.userPasswordCell = cell
            return cell
        }
        
        if indexPath.row==3
        {
            var cell = self.tableView!.dequeueReusableCellWithIdentifier("goCell") as! UITableViewCell
            return cell
        }
        
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 44
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.row == 3
        {
            println(self.userEmailCell?.textField?.text)
            if(self.userEmailCell?.textField?.text=="" || self.userNameCell?.textField?.text=="" || self.userPasswordCell?.textField?.text=="")
            {
                var alert = UIAlertController(title: "牛读", message: "Sorry,请填写您的信息", preferredStyle: UIAlertControllerStyle.Alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Cancel, handler: nil))
                self.presentViewController(alert, animated: true, completion: nil)
                return
            }else
            {
                let userEmail = self.userEmailCell?.textField?.text
                let userName = self.userNameCell?.textField?.text
                let userPassword = self.userPasswordCell?.textField?.text
                if !isValidEmail(userEmail!)
                {
                    var alert = UIAlertController(title: "牛读", message: "Sorry,请填正确的邮件地址", preferredStyle: UIAlertControllerStyle.Alert)
                    alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Cancel, handler: nil))
                    self.presentViewController(alert, animated: true, completion: nil)
                    return
                }
                
                DataManager.createOrLoginNewUser(userName!, userEmail: userEmail!, userPassword: userPassword!, funcCompletionHandler: { (success, message, status) -> Void in
                    if success
                    {
                        var messageJson = message as! NSDictionary
                        var authentication: AnyObject? = messageJson["authenticationCode"]
                        Util.setLocalUserAnthentication(userName!,anthentication:authentication as! String)
                        Util.syncUserInfoToLocal(userName, complete: { (done) -> Void in
                            
                        })
                        
                        self.performSegueWithIdentifier("toUserProfileSegue", sender: nil)
                    }else
                    {
                        println(message)
                    }
                })

                
            }
        }
    }
    
    func isValidEmail(testStr:String) -> Bool {
        // println("validate calendar: \(testStr)")
        let emailRegEx = "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluateWithObject(testStr)
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
