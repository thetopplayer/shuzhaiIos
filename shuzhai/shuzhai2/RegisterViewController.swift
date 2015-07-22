//
//  RegisterViewController.swift
//  shuzhai2
//
//  Created by VincentHe on 7/14/15.
//  Copyright (c) 2015 VincentHe. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {
    @IBOutlet var tableView:UITableView?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.hidden = false
        self.tableView!.contentInset = UIEdgeInsetsMake(-36,0,0,0);
        
        var button: UIButton = Util.getNavigationMenuButton()
        button.addTarget(self, action: "showMenu:", forControlEvents: UIControlEvents.TouchUpInside)
        
        var leftItem:UIBarButtonItem = UIBarButtonItem()
        leftItem.customView = button
        self.navigationItem.leftBarButtonItem = leftItem

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        if Util.getLocalUserAuthentication() != nil
        {
            self.performSegueWithIdentifier("toUserProfileSegue", sender: nil)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell:UITableViewCell!
        
        if indexPath.row==0
        {
            var cell = self.tableView!.dequeueReusableCellWithIdentifier("weibo") as! UITableViewCell
            return cell
        }
        
        if indexPath.row==1
        {
            var cell = self.tableView!.dequeueReusableCellWithIdentifier("qq") as! UITableViewCell
            return cell
        }
        
        if indexPath.row==2
        {
            var cell = self.tableView!.dequeueReusableCellWithIdentifier("email") as! UITableViewCell
            return cell
        }
        
       
        
        
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 44
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
         self.performSegueWithIdentifier("registerInfoSegue", sender: nil)
    }
    
    func showMenu(sender: UIButton!)
    {
        GlobalObservable.sharedInstance.mainMenuOpenAndCloseStatus = 1
    }

}
