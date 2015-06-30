//
//  StoryViewController.swift
//  shuzhai
//
//  Created by VincentHe on 6/24/15.
//  Copyright (c) 2015 com.Changchen. All rights reserved.
//

import UIKit

class StoryViewController: ContainerSubbaseViewController {

    @IBOutlet var storyScrollView:UIScrollView?
    @IBOutlet var contentView:UIView?
    let storyMargin:CGFloat = 8.0
    
    override func viewDidAppear(animated: Bool) {

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        storyScrollView?.contentSize = CGSizeMake(((self.storyScrollView?.frame.size.width)!*2 + self.storyMargin*4), (self.storyScrollView?.frame.size.height)!)
        
        println(self.storyScrollView?.frame.width)
        println(self.storyScrollView?.frame.height)
        println(self.storyScrollView?.constraints())
        
        if let resultController = storyboard.instantiateViewControllerWithIdentifier("StoryPageID") as? StoryPageViewController {
            
            resultController.view.frame = CGRectMake(0, 0, ((self.storyScrollView?.frame.size.width )! - self.storyMargin*2),(self.storyScrollView?.frame.size.height)!)
            
            self.storyScrollView?.addSubview(resultController.view)
            
            self.view.addConstraint(NSLayoutConstraint(item: resultController.view, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: self.contentView, attribute: NSLayoutAttribute.Width, multiplier: 1, constant: 0))
            
            
        }
        
        if let resultController = storyboard.instantiateViewControllerWithIdentifier("StoryPageID") as? StoryPageViewController {
            
            
            resultController.view.frame = CGRectMake((self.storyScrollView?.frame.size.width)!+self.storyMargin*3, 0, ((self.storyScrollView?.frame.size.width )! - self.storyMargin*2),(self.storyScrollView?.frame.size.height)!)
            
            self.storyScrollView?.addSubview(resultController.view)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.automaticallyAdjustsScrollViewInsets = false

        // Do any additional setup after loading the view.
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

}
