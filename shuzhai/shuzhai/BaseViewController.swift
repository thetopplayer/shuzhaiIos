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
        //self.navigationController?.navigationBar.hidden = true
        
        let navBar = self.navigationController!.navigationBar
        navBar.barTintColor = UIColor(red: 65.0 / 255.0, green: 62.0 / 255.0, blue: 79.0 / 255.0, alpha: 1)
        navBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        if segue.identifier == "mainMenuSegue"{
//            // Your Menu View Controller vew must know the following data for the proper animatio
//            let destinationVC = segue.destinationViewController as! GuillotineMenuViewController
//            destinationVC.hostNavigationBarHeight = self.navigationController!.navigationBar.frame.size.height
//            destinationVC.hostTitleText = self.navigationItem.title
//            destinationVC.view.backgroundColor = self.navigationController!.navigationBar.barTintColor
//            destinationVC.setMenuButtonWithImage(barButton.imageView!.image!)
//            
//            
//            if self.containerViewController != nil{
//                destinationVC.addObserver(self.containerViewController!, forKeyPath: "selectedButton", options: .New, context: &mycontext)
//                destinationVC.referredContainerViewController = self.containerViewController!
//            }
//        }
        
        if segue.identifier == "containerView"{
            self.containerViewController = segue.destinationViewController as! ContainerViewController
        }

    }
    
    func menuDidFinishDismissal() {
        println("-----")
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
