//
//  BaseViewController.swift
//  shuzhai
//
//  Created by He, Changchen on 6/19/15.
//  Copyright (c) 2015 com.Changchen. All rights reserved.
//

import UIKit


class BaseViewController: UIViewController,GuillotineAnimationDelegate {

    @IBOutlet var tableView: UITableView!
    
    var containerViewController:UIViewController?
    var mycontext  = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.hidden = true
        
        let navBar = self.navigationController!.navigationBar
        navBar.barTintColor = UIColor(red: 65.0 / 255.0, green: 62.0 / 255.0, blue: 79.0 / 255.0, alpha: 1)
        navBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 40.0
        tableView.contentInset = UIEdgeInsetsMake(100, 0, 0, 0)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "containerView"{
            self.containerViewController = segue.destinationViewController as! ContainerViewController
        }

    }
    
    func menuDidFinishDismissal() {
        println("-----")
    }

    
    // table delegate 
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if indexPath.row == 0{
            let identifier = "ProfileCell"
            let cell = tableView.dequeueReusableCellWithIdentifier(identifier) as! UITableViewCell
            return cell
        }else{
            
            let identifier = "SelectionCell"
            let cell = tableView.dequeueReusableCellWithIdentifier(identifier) as! UITableViewCell
            return cell
        }
        
    }
    
//    func tableView(tableView: UITableView!, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath!) -> CGFloat
//    {
//        if indexPath.row == 0{
//           return 100.0
//        }else{
//            return 44.0
//        }
//
//    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
