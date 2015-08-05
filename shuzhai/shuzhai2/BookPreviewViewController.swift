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
    var bookInfoDataDictArray:[(String,String)]?

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
        if let count = bookInfoDataDictArray?.count{
            return count
        }else
        {
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
        
        if let dictArray = self.bookInfoDataDictArray{
            var infoDict = dictArray[0]
            cell?.textLabel?.text   = infoDict.0
            cell?.detailTextLabel?.text = infoDict.1
        }


        
        return cell!
        
    }
    
    
    func bookInfoConvertor(doubanBook:DoubanBook)->[(String,String)]{
        var bookInfo = doubanBook.books?.first
        
        var bookinfoarray = [(String,String)]()
        if let bookInfo = bookInfo{
//            bookinfoarray.append(("书名",bookInfo.title) as! (String,String))
//            bookinfoarray.append(("作者",bookInfo.author?.first) as! (String,String))

        }
        
        
        
        return bookinfoarray
    
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
