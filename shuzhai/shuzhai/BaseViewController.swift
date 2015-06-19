//
//  BaseViewController.swift
//  shuzhai
//
//  Created by He, Changchen on 6/19/15.
//  Copyright (c) 2015 com.Changchen. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    var tabButtonViewController:TabButtonViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.hidden = true
        tabButtonViewController = TabButtonViewController(nibName:"TabButtonViewController", bundle:nil)
        self.view.addSubview(tabButtonViewController.view)

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
