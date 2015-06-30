//
//  StoryViewController.swift
//  shuzhai
//
//  Created by VincentHe on 6/24/15.
//  Copyright (c) 2015 com.Changchen. All rights reserved.
//

import UIKit

class StoryViewController: ContainerSubbaseViewController,UICollectionViewDataSource,UICollectionViewDelegate {

    @IBOutlet var collectionView:UICollectionView?
    
    private let reuseIdentifier = "StoryPageItemCell"
    private let sectionInsets = UIEdgeInsets(top: 10, left: 10.0, bottom: 10.0, right: 10.0)
    
    override func viewDidAppear(animated: Bool) {

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.automaticallyAdjustsScrollViewInsets = false

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! UICollectionViewCell
        //cell.backgroundColor = UIColor.blackColor()
        // Configure the cell
        return cell
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
