//
//  UserProfileSettingsViewController.swift
//  shuzhai2
//
//  Created by VincentHe on 7/19/15.
//  Copyright (c) 2015 VincentHe. All rights reserved.
//

import UIKit

class UserProfileSettingsViewController: UIViewController {

    @IBOutlet var tableView:UITableView?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView!.contentInset = UIEdgeInsetsMake(-36,0,0,0);

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(section==0)
        {
            return 3
        }else
        {
            return 1
        }
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell:UITableViewCell!
        
        if indexPath.row==0 && indexPath.section == 0
        {
            var cell = self.tableView!.dequeueReusableCellWithIdentifier("profilePic") as! UITableViewCell
            return cell
        }
        
        if indexPath.row==1 && indexPath.section == 0
        {
            var cell = self.tableView!.dequeueReusableCellWithIdentifier("nickName") as! UITableViewCell
            return cell
        }
        
        if indexPath.row==2 && indexPath.section == 0
        {
            var cell = self.tableView!.dequeueReusableCellWithIdentifier("cellPhone") as! UITableViewCell
            return cell
        }
        
        if indexPath.row==0 && indexPath.section == 1
        {
            var cell = self.tableView!.dequeueReusableCellWithIdentifier("loginName") as! UITableViewCell
            return cell
        }
        
        if indexPath.row==0 && indexPath.section == 2
        {
            var cell = self.tableView!.dequeueReusableCellWithIdentifier("logout") as! UITableViewCell
            return cell
        }
        
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath.row == 0 && indexPath.section == 0
        {
            return 66
        }
        else
        {
            return 50
        }
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.row == 1
        {
            //self.performSegueWithIdentifier("UserSettingsSegue", sender: nil)
        }
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
