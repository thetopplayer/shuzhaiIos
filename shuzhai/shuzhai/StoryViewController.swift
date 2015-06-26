//
//  StoryViewController.swift
//  shuzhai
//
//  Created by VincentHe on 6/24/15.
//  Copyright (c) 2015 com.Changchen. All rights reserved.
//

import UIKit


class StoryViewController: UIViewController,G8TesseractDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var tesseract:G8Tesseract = G8Tesseract(language:"chi_sim");
        //tesseract.language = "eng+ita";
        tesseract.delegate = self;
        tesseract.charWhitelist = "01234567890";
        tesseract.image = UIImage(named: "1.png");
        tesseract.recognize();
        NSLog("%@", tesseract.recognizedText);

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
