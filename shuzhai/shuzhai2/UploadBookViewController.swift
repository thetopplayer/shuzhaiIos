//
//  UploadBookViewController.swift
//  shuzhai2
//
//  Created by VincentHe on 7/8/15.
//  Copyright (c) 2015 VincentHe. All rights reserved.
//

import UIKit
import AVFoundation

class UploadBookViewController: ContainerSubbaseViewController {
    
    @IBOutlet var takePicButton:UIButton?
    @IBOutlet var editTextButton:UIButton?
    @IBOutlet var endButton:UIButton?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var button: UIButton = Util.getNavigationMenuButton()
        button.addTarget(self, action: "showMenu:", forControlEvents: UIControlEvents.TouchUpInside)
        
        var leftItem:UIBarButtonItem = UIBarButtonItem()
        leftItem.customView = button
        self.navigationItem.leftBarButtonItem = leftItem
        
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
    
    func showMenu(sender: UIButton!)
    {
        GlobalObservable.sharedInstance.mainMenuOpenAndCloseStatus = 1
    }
    
}
