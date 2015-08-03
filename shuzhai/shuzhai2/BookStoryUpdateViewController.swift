//
//  BookStoryUpdateViewController.swift
//  shuzhai2
//
//  Created by VincentHe on 8/2/15.
//  Copyright (c) 2015 VincentHe. All rights reserved.
//

import UIKit

class BookStoryUpdateViewController: UIViewController {

    
   @IBOutlet var textUpdateView:UITextView?
    var bookText:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.textUpdateView?.text = self.bookText
        
        var nextButton : UIBarButtonItem = UIBarButtonItem(title: "下一步", style: UIBarButtonItemStyle.Plain, target: self, action: "goNext")
        
        self.navigationItem.rightBarButtonItem = nextButton
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

    func goNext()
    {
        self.performSegueWithIdentifier("enricherSegue", sender: bookText)
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
