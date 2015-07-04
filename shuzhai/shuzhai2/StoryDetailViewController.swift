//
//  StoryDetailViewController.swift
//  shuzhai2
//
//  Created by VincentHe on 7/1/15.
//  Copyright (c) 2015 VincentHe. All rights reserved.
//

import UIKit

class StoryDetailViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet var closeButton:UIButton?
    @IBOutlet var tableView:UITableView?

    var dailyReadingBook:DaliyReadingBook?
    
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
            return cell
        }
        
        if indexPath.row==1
        {
            var cell = self.tableView!.dequeueReusableCellWithIdentifier("profileCell") as! UITableViewCell
            //cell.titleLabel?.text = dailyReadingBook?.sectionTitle
            return cell
        }
        
        if indexPath.row == 2
        {
            var cell = self.tableView!.dequeueReusableCellWithIdentifier("textBodyCell") as! StoryTextBodyCell
            //cell.titleLabel?.text = dailyReadingBook?.sectionTitle
            //cell.textBodyLabel?.text = dailyReadingBook?.textBody
            var text:String = dailyReadingBook!.textBody!
            cell.textBodyView?.text = text
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
         let storytextCell : StoryTextBodyCell? = self.tableView!.cellForRowAtIndexPath(indexPath) as? StoryTextBodyCell
            return storytextCell!.getConfiguredCellHeight()
        }
        
    }

    
    func heightForBasicCellAtIndexPath(indexPath:NSIndexPath) -> CGFloat
    {
        var storytextCell : StoryTextBodyCell? = self.tableView?.dequeueReusableCellWithIdentifier("textBodyCell") as? StoryTextBodyCell
        
        self.configureBasicCell(storytextCell!, indexPath: indexPath)
        return self.calculateHeightForConfiguredSizingCell(storytextCell!)
    }
    
    func configureBasicCell(cell:StoryTextBodyCell,indexPath:NSIndexPath)
    {
       // cell.textBodyLabel?.text = dailyReadingBook?.textBody
    }
    
    
    func calculateHeightForConfiguredSizingCell(sizingCell:UITableViewCell) -> CGFloat
    {
        sizingCell.setNeedsLayout()
        sizingCell.layoutIfNeeded()
        var size: CGSize = sizingCell.contentView.systemLayoutSizeFittingSize(UILayoutFittingCompressedSize)
        return size.height
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
