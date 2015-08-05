//
//  TargetUserViewController.swift
//  shuzhai2
//
//  Created by VincentHe on 7/30/15.
//  Copyright (c) 2015 VincentHe. All rights reserved.
//

import UIKit

class TargetUserViewController: UIViewController {

    @IBOutlet var tableView:UITableView?
    
    var dailyReadingBook:DaliyReadingBook?
    var user:User?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.hidden = false
        self.tableView!.contentInset = UIEdgeInsetsMake(-36,0,0,0);
        self.edgesForExtendedLayout = UIRectEdge.None
        self.navigationController?.navigationBarHidden = false

        DataManager.getUserInformation(dailyReadingBook?.creator_userName, completionHandler: { (userResponse, error) -> Void in
            if userResponse != nil
            {
                self.user = userResponse
                self.tableView?.reloadData()
            }
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        if self.user == nil
        {
            return 0;
        }
        
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell:UITableViewCell!
        
        if indexPath.row==0
        {
            var cell = self.tableView!.dequeueReusableCellWithIdentifier("userPicCell") as! UserPicTableViewCell
            if let user = self.user
            {
                cell.nameLabel?.text = user.userName
            }
            return cell
        }
        
        if indexPath.row==1
        {
            var cell = self.tableView!.dequeueReusableCellWithIdentifier("likeCell") as! UserTextCellWithNumberAndBotton
            if let user = self.user
            {
                cell.setCountNumber(user.followingCount)
                cell.buttonCall = { () -> () in return self.followThisUser() }
            }
            return cell
        }
        
        if indexPath.row == 2
        {
            var cell = self.tableView!.dequeueReusableCellWithIdentifier("myFollowers") as! UserTextCellWithNumberCell
            if let user = self.user
            {
                cell.setCountNumber(user.followerCount)
            }
            return cell
        }
        
        if indexPath.row == 3
        {
            var cell = self.tableView!.dequeueReusableCellWithIdentifier("myBookCell") as! UITableViewCell
            return cell
        }
        
        
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath.row == 0
        {
            return 145
        }
        else
        {
            return 50
        }
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.row == 3
        {
            self.performSegueWithIdentifier("storyCollectionSegue", sender: nil)
        }
    }
    
    
    func followThisUser()
    {
        if let user = self.user{
            
            DataManager.followUser(user.userInfoId!, completionHandler: { (success, error) -> Void in
                if(success != nil && success == true)
                {
                    var alert = UIAlertController(title: "牛读", message: "关注用户成功", preferredStyle: UIAlertControllerStyle.Alert)
                    alert.addAction(UIAlertAction(title: "确认", style: UIAlertActionStyle.Default, handler: nil))
                    self.presentViewController(alert, animated: true, completion: nil)
                }else if(success != nil && success == false)
                {
                    var alert = UIAlertController(title: "牛读", message: "关注用户失败", preferredStyle: UIAlertControllerStyle.Alert)
                    alert.addAction(UIAlertAction(title: "确认", style: UIAlertActionStyle.Default, handler: nil))
                    self.presentViewController(alert, animated: true, completion: nil)
                }else
                {
                    var alert = UIAlertController(title: "牛读", message: "网络出现问题", preferredStyle: UIAlertControllerStyle.Alert)
                    alert.addAction(UIAlertAction(title: "确认", style: UIAlertActionStyle.Default, handler: nil))
                    self.presentViewController(alert, animated: true, completion: nil)
                }
            })
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
