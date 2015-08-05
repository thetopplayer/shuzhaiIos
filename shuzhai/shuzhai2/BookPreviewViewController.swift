//
//  BookPreviewViewController.swift
//  shuzhai2
//
//  Created by VincentHe on 8/2/15.
//  Copyright (c) 2015 VincentHe. All rights reserved.
//

import UIKit

class BookPreviewViewController: UIViewController {
    
    @IBOutlet var tableView:UITableView?
    var doubanBook: DoubanBook?
    var bookInfoDataDictArray:NSMutableArray?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let bookInfoArray = self.bookInfoDataDictArray
        {
            return bookInfoArray.count
        }else{
            
            return 0
        }
        
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        
        var cell:UITableViewCell? = self.tableView?.dequeueReusableCellWithIdentifier("BookInfoCell") as? UITableViewCell
        
        if (cell != nil)
        {
            cell = UITableViewCell(style: UITableViewCellStyle.Value2,reuseIdentifier: "BookInfoCell")
        }
        
        var infoDict = self.bookInfoDataDictArray?.objectAtIndex(indexPath.row) as! (String,String)

        cell?.textLabel?.text   = infoDict.0
        cell?.detailTextLabel?.text = infoDict.1
        
        return cell!
        
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
