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
    
    var subControllerDict = [String: UIViewController]()
    
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
        if subControllerDict[segue.identifier!] == nil{
            subControllerDict[segue.identifier!] = self.currentViewController
        }
        
        if (self.childViewControllers.count > 0) {
            self.swapTwoViewControllers(self.childViewControllers[0] as! UIViewController, toViewController: self.currentViewController)
        }else
        {
            self.addChildViewController(self.currentViewController)
            var dstView: UIView = self.currentViewController.view
            dstView.autoresizingMask = UIViewAutoresizing.FlexibleWidth | UIViewAutoresizing.FlexibleHeight
            dstView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)
            self.view.addSubview(dstView)
            segue.destinationViewController.didMoveToParentViewController(self)
        }
        
    }
    

    
    private func getUIControllerFromControllerEnum(controllerEnum: ClassEnums.MainContentsControllers)->UIViewController?
    {
        var enumValue = controllerEnum.rawValue
        
        if let tmpController = self.subControllerDict[enumValue]{
            return tmpController
        }else{
            return nil
        }
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
    
    func swapViewControllers(dstControllerEnum: ClassEnums.MainContentsControllers){
        
        if self.transitionInProgress{
            return
        }
        
        self.transitionInProgress = true
        
        var dstController: UIViewController? = getUIControllerFromControllerEnum(dstControllerEnum)
        if (dstControllerEnum.rawValue != self.currentSegueController.rawValue && dstController != nil)
        {
            self.swapTwoViewControllers(self.currentViewController, toViewController: dstController!)
            self.currentViewController = dstController
        }
        
        self.performSegueWithIdentifier(dstControllerEnum.rawValue, sender: nil)
        
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

