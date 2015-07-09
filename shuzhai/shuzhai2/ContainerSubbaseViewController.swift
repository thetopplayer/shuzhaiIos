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

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
