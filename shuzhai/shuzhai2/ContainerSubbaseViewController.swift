//
//  ContainerSubbaseViewController.swift
//  shuzhai
//
//  Created by VincentHe on 6/27/15.
//  Copyright (c) 2015 com.Changchen. All rights reserved.
//

import UIKit

class ContainerSubbaseViewController: UIViewController {
    
    @IBOutlet var menuButton:UIButton?;
    
    var sliderCloseButton: UIButton = UIButton()
    private var kvoStoryContext: UInt8 = 2

    override func viewDidLoad() {
        super.viewDidLoad()

        
        GlobalObservable.sharedInstance.addObserver(self, forKeyPath: "mainMenuOpenAndCloseStatus", options: .New, context: &kvoStoryContext)
        
        // setup slider invisible button
        sliderCloseButton.frame = CGRectMake(0, 0, self.view.bounds.width, self.view.bounds.height)
        sliderCloseButton.addTarget(self, action: "sliderButtonPressed", forControlEvents: .TouchUpInside)
        sliderCloseButton.hidden = true
        sliderCloseButton.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.7)
        self.view.addSubview(sliderCloseButton)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func menuButtonClicked(sender:UIButton)
    {
        //println("hello")
        GlobalObservable.sharedInstance.mainMenuOpenAndCloseStatus = 1
    }
    
    func setButtonIconByIndex(index:Int)
    {
        var imageName = String(format: "Berger%d", index+1)
        self.menuButton?.setImage(UIImage(named: imageName), forState: UIControlState.Normal)
    }
    
    override func observeValueForKeyPath(keyPath: String, ofObject object: AnyObject, change: [NSObject : AnyObject],context: UnsafeMutablePointer<Void>) {
        if context == &kvoStoryContext {
            if let newValue: AnyObject = change[NSKeyValueChangeNewKey] {
                if newValue as! Int == 1
                {
                    self.sliderCloseButton.hidden = false
                }else
                {
                    self.sliderCloseButton.hidden = true
                }
            }
        }
    }
    
    
    deinit {
        GlobalObservable.sharedInstance.removeObserver(self, forKeyPath: "mainMenuOpenAndCloseStatus", context: &kvoStoryContext)
    }
    
    
    func sliderButtonPressed()
    {
        GlobalObservable.sharedInstance.mainMenuOpenAndCloseStatus = 0
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
