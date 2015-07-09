//
//  StoryDetailViewController.swift
//  shuzhai2
//
//  Created by VincentHe on 7/1/15.
//  Copyright (c) 2015 VincentHe. All rights reserved.
//

import UIKit
import ImageLoader

class StoryDetailViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet var closeButton:UIButton?
    @IBOutlet var tableView:UITableView?

    
    var dailyReadingBook:DaliyReadingBook?
    var textViewDict:[NSIndexPath:UITextView] = Dictionary<NSIndexPath, UITextView>()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView?.estimatedRowHeight = 100.0
        self.tableView?.rowHeight = UITableViewAutomaticDimension
        
        // Do any additional setup after loading the view.
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
        return 3
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell:UITableViewCell!
        
        if indexPath.row==0
        {
            var cell = self.tableView!.dequeueReusableCellWithIdentifier("cell") as! TitleTableViewCell
            cell.titleLabel?.text = dailyReadingBook?.sectionTitle
            var imgUrl = self.dailyReadingBook?.imgsUrl?.first
            cell.storyImgView?.load(NSURL(string: imgUrl!)!, placeholder:UIImage(named: "82.jpg"))
            return cell
        }
        
        if indexPath.row==1
        {
            var cell = self.tableView!.dequeueReusableCellWithIdentifier("profileCell") as! StoryUtilCell
            //cell.titleLabel?.text = dailyReadingBook?.sectionTitle
            var imgUrl = self.dailyReadingBook?.creator_profileImg
            //cell.profileImg?.load(NSURL(string: imgUrl!)!, placeholder: UIImage(named: "round-profile-plc"))
            //cell.profileImg!.load(NSURL(string: imgUrl!)!, placeholder:UIImage(named: "round-profile-plc"))
            println(self.dailyReadingBook?.creator_nikeName)
            var a:String = self.dailyReadingBook!.bookTitle!
            if let useName = self.dailyReadingBook?.creator_userName{
                cell.userNameLabel?.text = useName
            }
            
            return cell
        }
        
        if indexPath.row == 2
        {
            var cell = self.tableView!.dequeueReusableCellWithIdentifier("textBodyCell") as! StoryTextBodyCell
            //cell.titleLabel?.text = dailyReadingBook?.sectionTitle
            //cell.textBodyLabel?.text = dailyReadingBook?.textBody
            var text:String = dailyReadingBook!.textBody!
            cell.textBodyView?.text = text
            cell.textBodyView?.setContentOffset(CGPointMake(0, 100), animated: false)
            self.textViewDict[indexPath] = cell.textBodyView
            println(text)
            return cell
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
