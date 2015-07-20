//
//  UserProfileViewController.swift
//  shuzhai2
//
//  Created by VincentHe on 7/18/15.
//  Copyright (c) 2015 VincentHe. All rights reserved.
//

import UIKit

class UserProfileViewController: ContainerSubbaseViewController {

    @IBOutlet var tableView:UITableView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.hidden = false
        self.tableView!.contentInset = UIEdgeInsetsMake(-36,0,0,0);
        self.edgesForExtendedLayout = UIRectEdge.None
    
        
        
        
        var button: UIButton = Util.getNavigationMenuButton()
        button.addTarget(self, action: "showMenu:", forControlEvents: UIControlEvents.TouchUpInside)
        
        var leftItem:UIBarButtonItem = UIBarButtonItem()
        leftItem.customView = button
        self.navigationItem.leftBarButtonItem = leftItem
        
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(false)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell:UITableViewCell!
        
        if indexPath.row==0
        {
            var cell = self.tableView!.dequeueReusableCellWithIdentifier("userPicCell") as! UITableViewCell
            return cell
        }
        
        if indexPath.row==1
        {
            var cell = self.tableView!.dequeueReusableCellWithIdentifier("settingsCell") as! UITableViewCell
            return cell
        }
        
        if indexPath.row==2
        {
            var cell = self.tableView!.dequeueReusableCellWithIdentifier("messageCell") as! UITableViewCell
            return cell
        }
        
        if indexPath.row==3
        {
            var cell = self.tableView!.dequeueReusableCellWithIdentifier("markCell") as! UITableViewCell
            return cell
        }
        
        if indexPath.row==4
        {
            var cell = self.tableView!.dequeueReusableCellWithIdentifier("likeCell") as! UITableViewCell
            return cell
        }
        
        if indexPath.row==5
        {
            var cell = self.tableView!.dequeueReusableCellWithIdentifier("myBookCell") as! UITableViewCell
            return cell
        }
        
        if indexPath.row==6
        {
            var cell = self.tableView!.dequeueReusableCellWithIdentifier("offLineCell") as! UITableViewCell
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
        if indexPath.row == 1
        {
           self.performSegueWithIdentifier("UserSettingsSegue", sender: nil)
        }
    }
    
    
    
    func showMenu(sender: UIButton!)
    {
        GlobalObservable.sharedInstance.mainMenuOpenAndCloseStatus = 1
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
