//
//  BookInfoEnRicherViewController.swift
//  shuzhai2
//
//  Created by VincentHe on 8/2/15.
//  Copyright (c) 2015 VincentHe. All rights reserved.
//

import UIKit

class BookInfoEnRicherViewController: UIViewController {
    
    @IBOutlet var bookTitleField:UITextField?
    @IBOutlet var bookSectionSummaryView:UITextView?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        var nextButton : UIBarButtonItem = UIBarButtonItem(title: "下一步", style: UIBarButtonItemStyle.Plain, target: self, action: "goNext")
        self.navigationItem.rightBarButtonItem = nextButton
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func goNext()
    {
        
        if let bookTitle = self.bookTitleField?.text{
            if count(bookTitle) > 0
            {
                DataManager.getDoubanBookInfo(bookTitle, resultCount: 1, completionHandler: { (book, error) -> Void in
                    if let book = book{
                        //
                        self.performSegueWithIdentifier("bookPreviewSegue", sender: book)
                    }
                })
            }
        }
        
        //self.performSegueWithIdentifier("enricherSegue", sender: bookText)
    }

    
    // MARK: - Navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "bookPreviewSegue")
        {
            var controller = (segue.destinationViewController as! BookPreviewViewController)
            controller.doubanBook = sender as? DoubanBook
        }
    }
    

}
