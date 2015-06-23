//
//  ContainerViewController.swift
//  shuzhai
//
//  Created by VincentHe on 6/23/15.
//  Copyright (c) 2015 com.Changchen. All rights reserved.
//

import UIKit

class ContainerViewController: UIViewController {

    let SegueIdentifierFirst = "embedFirst"
    let SegueIdentifierSecond = "embedSecond"
    
    var transitionInProgress : Bool = false
    var currentSegueController:ClassEnums.MainContentsControllers = .DailyReading
    
    var currentViewController: UIViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.performSegueWithIdentifier(self.currentSegueController.rawValue, sender: nil)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        self.currentViewController = segue.destinationViewController as! UIViewController;
    }
    
    private func swapTwoViewControllers(fromController:UIViewController, toViewController:UIViewController){
        fromController.willMoveToParentViewController(nil)
        self.addChildViewController(toViewController)
        
        self.transitionFromViewController(fromController, toViewController: toViewController, duration: 1.0, options: UIViewAnimationOptions.TransitionCrossDissolve, animations: nil) { (finished) -> Void in
            fromController.removeFromParentViewController()
            toViewController.didMoveToParentViewController(self)
            self.transitionInProgress = false
        }
        
    }
    
    func swapViewControllers(dstController: ClassEnums.MainContentsControllers){
        
        if self.transitionInProgress{
            return
        }
        
        self.transitionInProgress = true
        if dstController.rawValue != self.currentSegueController.rawValue
        {
            
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
