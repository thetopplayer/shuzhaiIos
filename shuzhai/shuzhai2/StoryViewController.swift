//
//  StoryViewController.swift
//  shuzhai
//
//  Created by VincentHe on 6/24/15.
//  Copyright (c) 2015 com.Changchen. All rights reserved.
//

import UIKit
import Alamofire
import ImageLoader
import EasyAnimation


class StoryViewController: ContainerSubbaseViewController,UICollectionViewDataSource,UICollectionViewDelegate {

    @IBOutlet var collectionView:UICollectionView?
    @IBOutlet var userInfoView:UIView?
    @IBOutlet var bookCreatorNameLabel:UILabel?
    @IBOutlet var collectionContainerView:UIView?
    @IBOutlet var pageController:UIPageControl?
    
    let backGroundColors:[UIColor] = GlobalVariables.defaultColorGroup
    
    var bookDataArray : [DailyReading]=[]
    var currentIndex  = 0
    
    private let reuseIdentifier = "StoryPageItemCell"
    private let sectionInsets = UIEdgeInsets(top: 10, left: 10.0, bottom: 10.0, right: 10.0)
    
    override func viewDidAppear(animated: Bool) {

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.automaticallyAdjustsScrollViewInsets = false
        
        DataManager.fetchNumberOfBooks({ (todayReadings, error) -> Void in
            
                if let todayReadings = todayReadings {
                    self.bookDataArray.extend(todayReadings)
                    self.collectionView?.reloadData()
                    self.updateUserInfoViewWithIndex(0)
                    self.setOutLayColorByIndex(0)
                    self.pageController?.numberOfPages = todayReadings.count
                }else
                {
                    println(error)
                }

            })
    
    }

    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        
        return 1;
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.bookDataArray.count;
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! StoryPageCell
        self.configCellContent(cell, andIndexPath: indexPath)
        //cell.backgroundColor = UIColor.blackColor()
        // Configure the cell
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        self.performSegueWithIdentifier("BookDetailSegue", sender: self)
    }
    
    
    func configCellContent(cell:StoryPageCell, andIndexPath indexPath:NSIndexPath) -> Void
    {
        var dailyReadying:DailyReading = self.bookDataArray[indexPath.row]
        if(dailyReadying.bookInfoVO?.imgsUrl?.count>0)
        {
            
            var imgUrl = dailyReadying.bookInfoVO?.imgsUrl?.first
            cell.bookImgview?.load(NSURL(string: imgUrl!)!, placeholder:UIImage(named: "round-profile-plc"))
        }
        cell.bookTitleLabel?.text = dailyReadying.bookInfoVO?.bookTitle
        cell.bookSummaryContentView?.text = dailyReadying.bookInfoVO?.summary
        cell.bookSectionTitleLabel?.text = dailyReadying.bookInfoVO?.sectionTitle
        cell.layer.borderWidth=1.0
        cell.layer.cornerRadius = 3.0
        cell.layer.borderColor = self.backGroundColors[indexPath.row].CGColor
    }
    
    func setOutLayColorByIndex(index:Int)
    {
        var currentColor = self.backGroundColors[index]
        var borderWidth:CGFloat = 1
        self.userInfoView?.layer.borderColor = currentColor.CGColor
        self.userInfoView?.layer.borderWidth = borderWidth
        self.userInfoView?.layer.cornerRadius = 3.0
        self.setButtonIconByIndex(index)
    }
    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
//    func scrollViewDidScroll(scrollView: UIScrollView) {
//        println(scrollView.contentOffset)
//        var pageWidth = self.collectionView?.bounds.width
//        var ratio = sin(Double( scrollView.contentOffset.x / (pageWidth!)) * 2 * M_PI)
//        var actuallValue = 100.0 * ratio
//        self.userInfoView?.setTranslatesAutoresizingMaskIntoConstraints(true)
//        self.userInfoView?.center.y += CGFloat(actuallValue)
//        //println(self.collectionView?.bounds.width)
//        println(actuallValue)
//    }

    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        var pageWidth = self.collectionView?.bounds.width
        var cellToSwipe:Int =  Int(scrollView.contentOffset.x / (pageWidth!))
        if(self.currentIndex != cellToSwipe)
        {
            self.currentIndex = cellToSwipe
            self.pageController?.currentPage = self.currentIndex
            
            self.setOutLayColorByIndex(self.currentIndex)
            self.updateUserInfoViewWithIndex(cellToSwipe)
            
            UIView.animateAndChainWithDuration(0.5, delay: 0, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
                self.userInfoView?.alpha = 0
                self.setOutLayColorByIndex(self.currentIndex)
                }, completion: {(finished) -> Void in
                    // update user info
                    self.updateUserInfoViewWithIndex(cellToSwipe)
                }
                ).animateWithDuration(0.5,animations: { () -> Void in
                   self.userInfoView?.alpha = 1
                })
        }
    }
    
    func updateUserInfoViewWithIndex(index:Int){
        var dailyReading = self.bookDataArray[index]
        var name = dailyReading.bookInfoVO?.creator_userName
        self.bookCreatorNameLabel?.text =  name
    }
    
    

}


extension StoryViewController : UICollectionViewDelegateFlowLayout {
    //1
    func collectionView(collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
            
            return CGSize(width: collectionView.frame.width-20, height: collectionView.frame.height)
    }
    
    //3
    func collectionView(collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        insetForSectionAtIndex section: Int) -> UIEdgeInsets {
            return sectionInsets
    }
}
