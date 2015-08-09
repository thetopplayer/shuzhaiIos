//
//  BriefStoryCollectionViewController.swift
//  shuzhai2
//
//  Created by VincentHe on 7/30/15.
//  Copyright (c) 2015 VincentHe. All rights reserved.
//

import UIKit
import ImageLoader


class BriefStoryCollectionViewController: UIViewController {
    
    @IBOutlet var tableView:UITableView?
    var books:[DaliyReadingBook]?
    var users:[User]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView?.reloadData()
        self.tableView!.contentInset = UIEdgeInsetsMake(-100,0,0,0);

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.navigationBar.hidden = false
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        if let count = self.books?.count
        {
            return count;
        }else{
            return 0;
        }
        
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = self.tableView!.dequeueReusableCellWithIdentifier("briefStoryCell") as! BriefStoryCollectionCell
        
        if cell.book == nil
        {
            if let books = self.books
            {
                var book = books[indexPath.section];
                var imgUrl = book.imgsUrl?.first
                //var bookImgUrl = NSURL(string: imgUrl[0]!)
                var bookImgUrl: NSURL = NSURL(string: imgUrl!)!
                cell.storyImgView?.load(bookImgUrl, placeholder: UIImage(named: "82.jpg"))
                cell.bookTitleLabel?.text = book.sectionTitle
                
            }
            
            if let users = self.users
            {
                var user = users[indexPath.section]
                var imgUrl = user.profileImg
                //var bookImgUrl = NSURL(string: imgUrl[0]!)
                var profileImgUrl =  NSURL(string: "")!
                if let imgUrl = imgUrl{
                    profileImgUrl = NSURL(string: imgUrl)!
                }
                
                cell.profileImageView?.load(profileImgUrl, placeholder: UIImage(named: "round-profile-pic"))
                cell.userName?.text = user.userName
            }
            
        }
 
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 105
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        
        if let books = self.books
        {
            var book = books[indexPath.section];
            DataManager.fetchSingleBook(Int(book.bookInfoId!), completionHandler: { (fetchedBook, error) -> Void in
                if(error == nil)
                {
                    self.performSegueWithIdentifier("BookDetailSegue", sender: fetchedBook)
                }
            })
            
        }
        
//        
//        if indexPath.row == 3
//        {
//            self.performSegueWithIdentifier("storyCollectionSegue", sender: nil)
//        }
    }
    
    
    // MARK: - Navigation

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        
        if(segue.identifier == "BookDetailSegue")
        {
            
            var controller = (segue.destinationViewController as! StoryDetailViewController)
            controller.dailyReadingBook = sender as? DaliyReadingBook
        }
        
    }


}
