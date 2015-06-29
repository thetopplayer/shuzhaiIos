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
    var contentView:UIView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        //storyScrollView?.contentSize = CGSizeMake((self.storyScrollView?.frame.size.width)!*2, (self.storyScrollView?.frame.size.height)!)
        
        println(self.storyScrollView?.frame.width)
        println(self.storyScrollView?.frame.height)
        println(self.storyScrollView?.constraints())
        
        if let resultController = storyboard.instantiateViewControllerWithIdentifier("StoryPageID") as? StoryPageViewController {
            
            contentView = UIView()
            contentView?.backgroundColor = UIColor.redColor()
            self.storyScrollView?.addSubview(contentView!)
            
            let views:[NSObject:NSObject] = ["beeView":contentView!]
            var metrics:[NSObject:NSObject] = ["height" : 600, "width" : 900]

           var widthConstraints =  NSLayoutConstraint.constraintsWithVisualFormat("V:|[beeView(height)]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: metrics, views: views)
            
            self.storyScrollView?.addConstraints(widthConstraints)
        
            
            
            //resultController.view.frame = CGRectMake(0, 0, (self.storyScrollView?.frame.size.width)!,(self.storyScrollView?.frame.size.height)!)
        
            //self.storyScrollView?.addSubview(resultController.view)
            
            
            //self.view.addSubview(resultController.view)
            //self.navigationController?.pushViewController(resultController, animated: true)
            //presentViewController(resultController, animated: true, completion: nil)
        }
        
        

        
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
