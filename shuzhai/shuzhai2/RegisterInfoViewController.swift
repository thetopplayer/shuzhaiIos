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
            var cell = self.tableView!.dequeueReusableCellWithIdentifier("userNameCell") as! UITableViewCell
            return cell
        }
        
        if indexPath.row==1
        {
            var cell = self.tableView!.dequeueReusableCellWithIdentifier("userEmailCell") as! UITableViewCell
            return cell
        }
        
        if indexPath.row==2
        {
            var cell = self.tableView!.dequeueReusableCellWithIdentifier("userPasswordCell") as! UITableViewCell
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
