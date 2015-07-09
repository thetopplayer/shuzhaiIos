//
//  BaseViewController.swift
//  shuzhai
//
//  Created by He, Changchen on 6/19/15.
//  Copyright (c) 2015 com.Changchen. All rights reserved.
//

import UIKit


class BaseViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet var tableView: UITableView!
    @IBOutlet var containerView:UIView!
    
    private var kvoContext: UInt8 = 1
    
    var containerViewController:ContainerViewController?
    var menuCellIdentifiers = ["ProfileCell","SelectionCell","SelectionCell","SelectionCell","SelectionCell"]
    var mycontext  = 2
    var sideMenuOpened = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.hidden = true
        
        let navBar = self.navigationController!.navigationBar
        navBar.barTintColor = UIColor(red: 65.0 / 255.0, green: 62.0 / 255.0, blue: 79.0 / 255.0, alpha: 1)
        navBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 40.0
        tableView.contentInset = UIEdgeInsetsMake(100, 0, 0, 0)
        tableView.delegate = self
        
        //let options = NSKeyValueObservingOptions([.New, .Old])
        GlobalObservable.sharedInstance.addObserver(self, forKeyPath: "mainMenuOpenAndCloseStatus", options: .New, context: &kvoContext)
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "containerView"{
            self.containerViewController = segue.destinationViewController as? ContainerViewController
        }

    }
    
    func menuDidFinishDismissal() {
        println("-----")
    }

    //
    func openSideMenu(){
        if !sideMenuOpened{
            UIView.animateWithDuration(0.3, delay:0, options: .CurveEaseOut, animations:  {
                self.containerView.layer.position.x  += self.view.bounds.width*0.55
                
                //self.containerView.center.x += self.view.bounds.width*0.6
               // self.containerViewController?.view.layer.position.x  += self.view.bounds.width*0.6
                }, completion: { (Bool) -> Void in
                     self.sideMenuOpened = true
            })
        }
    }
    
    func closeSideMenu()
    {
        if sideMenuOpened{
            UIView.animateWithDuration(0.3, delay:0, options: .CurveEaseOut, animations:  {
                self.containerView.layer.position.x  -= self.view.bounds.width*0.55
                //self.containerView.center.x -= self.view.bounds.width*0.6
                }, completion: { (Bool) -> Void in
                    self.sideMenuOpened = false
            })
        }
    }
    
    
    // table delegate 
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let identifier = menuCellIdentifiers[indexPath.row]
        
        if indexPath.row == 0{
            let identifier = "ProfileCell"
            let cell = tableView.dequeueReusableCellWithIdentifier(identifier) as! UITableViewCell
            return cell
        }else if indexPath.row == 1{
            
            let identifier = "SelectionCell"
            let cell = tableView.dequeueReusableCellWithIdentifier(identifier) as! UITableViewCell
            return cell
        }else
        {
            let indentifier = "UploadCell"
            let cell = tableView.dequeueReusableCellWithIdentifier(identifier) as! UITableViewCell
            return cell
        }
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        if indexPath.row==1{
            self.containerViewController!.swapViewControllers(ClassEnums.MainContentsControllers.DailyReading)
        }
        
        if indexPath.row==2{
            self.containerViewController!.swapViewControllers(ClassEnums.MainContentsControllers.UserProfile)
        }
        
        // close the menu
        GlobalObservable.sharedInstance.mainMenuOpenAndCloseStatus = 0
        
    }
    
    
    
    override func observeValueForKeyPath(keyPath: String, ofObject object: AnyObject, change: [NSObject : AnyObject],context: UnsafeMutablePointer<Void>) {
            if context == &kvoContext {
                if let newValue: AnyObject = change[NSKeyValueChangeNewKey] {
                    if newValue as! Int == 1
                    {
                        self.openSideMenu()
                    }else
                    {
                        self.closeSideMenu()
                    }
                }
            }
    }
    
    
    deinit {
        GlobalObservable.sharedInstance.removeObserver(self, forKeyPath: "mainMenuOpenAndCloseStatus", context: &kvoContext)
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
