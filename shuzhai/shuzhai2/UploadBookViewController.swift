//
//  UploadBookViewController.swift
//  shuzhai2
//
//  Created by VincentHe on 7/8/15.
//  Copyright (c) 2015 VincentHe. All rights reserved.
//

import UIKit
import AVFoundation

class UploadBookViewController: UIViewController {
    
    @IBOutlet var takePicButton:UIButton?
    @IBOutlet var editTextButton:UIButton?
    @IBOutlet var endButton:UIButton?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func buttonClicked(sender:UIButton)
    {
        var tag = sender.tag
        
        if tag==0
        {
            self.performSegueWithIdentifier("imgUploadSegue", sender: nil)
        }
    }
    

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        
        if(segue.identifier == "imgUploadSegue")
        {
            
        }
    }
    
}
