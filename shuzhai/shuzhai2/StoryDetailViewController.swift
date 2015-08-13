//
//  StoryDetailViewController.swift
//  shuzhai2
//
//  Created by VincentHe on 7/1/15.
//  Copyright (c) 2015 VincentHe. All rights reserved.
//

import UIKit
import ImageLoader
import ActionButton

class StoryDetailViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet var closeButton:UIButton?
    @IBOutlet var tableView:UITableView?



    var userComment:UserComment?
    
    var dailyReadingBook:DaliyReadingBook?
    var textViewDict:[NSIndexPath:UITextView] = Dictionary<NSIndexPath, UITextView>()
    var actionButton: ActionButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView?.estimatedRowHeight = 100.0
        self.tableView?.rowHeight = UITableViewAutomaticDimension
        
        if let book = dailyReadingBook{
            DataManager.fetchCommemtsForBook(Int(book.bookInfoId!), completionHandler: { (commentObj, error) -> Void in
                if(error == nil)
                {
                    self.userComment = commentObj
                    self.tableView?.reloadData()
                }
            })

        }
        
        let likeImg = UIImage(named: "StoryLikeIcon.png")!
        let markImg = UIImage(named: "StoryMarkIcon.png")!
        let shareImg = UIImage(named: "StoryShareIcon.png")!
        let chatImg = UIImage(named: "StoryChatIcon.png")!
        
        let likeButton = ActionButtonItem(title: "", image: likeImg)
        
        likeButton.action = { item in
            DataManager.likeBook(self, bookId: Int(self.dailyReadingBook!.bookInfoId!), completionHandler: { (success, error) -> Void in
            
            })
            self.actionButton.toggleMenu()
        }
        
        let markButton = ActionButtonItem(title: "", image: markImg)
        markButton.action = { item in println("Google Plus...") }
        
        let shareButton = ActionButtonItem(title: "", image: shareImg)
        shareButton.action = { item in println("Google Plus...") }
        
        let chatButton = ActionButtonItem(title: "", image: chatImg)
        chatButton.action = { item in println("Google Plus...") }
        
        actionButton = ActionButton(attachedToView: self.view, items: [markButton,likeButton ,shareButton,chatButton])
        actionButton.action = { button in button.toggleMenu() }
        
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.hidden = true
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        self.tableView!.reloadData()
    }
    
    @IBAction func closeView()
    {
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0
        {
            return 3
        }else if(section == 1)
        {
            if let messages = self.userComment?.messages
            {
                return messages.count
            }else
            {
                return 0
            }
            
        }
        
        return 0
        
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell:UITableViewCell!
        
        if indexPath.row==0 && indexPath.section == 0
        {
            var cell = self.tableView!.dequeueReusableCellWithIdentifier("cell") as! TitleTableViewCell
            cell.titleLabel?.text = dailyReadingBook?.sectionTitle
            var imgUrl = self.dailyReadingBook?.imgsUrl?.first
            cell.storyImgView?.load(NSURL(string: imgUrl!)!, placeholder:UIImage(named: "82.jpg"))
            return cell
        }
        
        if indexPath.row==1 && indexPath.section == 0
        {
            var cell = self.tableView!.dequeueReusableCellWithIdentifier("profileCell") as! StoryUtilCell
            cell.parentViewController = self
            cell.dailyReadingBook = self.dailyReadingBook
            //cell.titleLabel?.text = dailyReadingBook?.sectionTitle
            var imgUrl = self.dailyReadingBook?.creator_profileImg
            //cell.profileImg?.load(NSURL(string: imgUrl!)!, placeholder: UIImage(named: "round-profile-plc"))
            //cell.profileImg!.load(NSURL(string: imgUrl!)!, placeholder:UIImage(named: "round-profile-plc"))
            var a:String = self.dailyReadingBook!.bookTitle!
            if let useName = self.dailyReadingBook?.creator_userName{
                cell.userNameLabel?.text = useName
            }
            
            return cell
        }
        
        if indexPath.row == 2  && indexPath.section == 0
        {
            var cell = self.tableView!.dequeueReusableCellWithIdentifier("textBodyCell") as! StoryTextBodyCell
            var text:String = dailyReadingBook!.textBody!
            cell.textBodyView?.text = text
            cell.textBodyView?.setContentOffset(CGPointMake(0, 100), animated: false)
            self.textViewDict[indexPath] = cell.textBodyView
            return cell
        }
        
        if indexPath.section == 1
        {
            var cell = self.tableView!.dequeueReusableCellWithIdentifier("StoryCommentCell") as! StoryCommentCell
            
            if let userCommentMessages = self.userComment?.messages{
               var commentMessage =  userCommentMessages[indexPath.row]
               cell.commentTextView?.text = commentMessage.comment
               self.textViewDict[indexPath] = cell.commentTextView
                return cell
            }
            
            

        }
        
        
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath.row == 0
        {
            return tableView.bounds.height / CGFloat(3.5)
        }else if indexPath.row == 1
        {
            return 50
        }else
        {
            return self.textViewHeightForHeightFOrRowAtIndexPath(indexPath)
        }
        
    }
    
    func textViewHeightForHeightFOrRowAtIndexPath(indexPath:NSIndexPath) -> CGFloat
    {
        var calculationView = self.textViewDict[indexPath]
        var textViewWidth = calculationView?.frame.size.width
        if calculationView?.attributedText == nil
        {
           
        }
        var size = calculationView?.sizeThatFits(CGSizeMake(textViewWidth!, CGFloat.max))
        return size!.height
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

