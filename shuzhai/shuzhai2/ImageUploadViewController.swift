//
//  ImageUploadViewController.swift
//  shuzhai2
//
//  Created by VincentHe on 7/8/15.
//  Copyright (c) 2015 VincentHe. All rights reserved.
//

import UIKit

class ImageUploadViewController: UIViewController , UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    @IBOutlet var tableView:UITableView?
    
    var imageDataArray:[UIImage] = []
    let imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
        // Do view setup here.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0
        {
            return imageDataArray.count
        }else
        {
            return 1
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        
        var cell:UITableViewCell!
        
        if indexPath.section == 1
        {
            var cell = self.tableView!.dequeueReusableCellWithIdentifier("addMoreCell") as! UITableViewCell
            return cell
        }else
        {
            let cell:ImagePreviewCell = self.tableView!.dequeueReusableCellWithIdentifier("imgPreviewCell") as! ImagePreviewCell
            var img = imageDataArray[indexPath.row]
            cell.previewImageView?.image = img
            return cell
        }
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.section == 1
        {
            self.showActionSheet()
        }
    }

    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
       if indexPath.section == 0
       {
         return 95
       }else
       {
         return 95
       }
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            imageDataArray.append(pickedImage)
            self.tableView?.reloadData()
        }

        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func send()
    {
        for image in self.imageDataArray
        {
            var resultString:String = ""
            
//            DataManager.fetchResultFromBaiduOCR(image, completionHandler: { (result, error) -> Void in
//                if let response:BaiduOCRResponse = result{
//                    for retdata:BaiduOCRRetData in response.retData!
//                    {
//                        println(retdata.word!)
//                        resultString+=retdata.word!
//                    }
//                }
//                
//                var alert = UIAlertController(title: "Alert", message: resultString, preferredStyle: UIAlertControllerStyle.Alert)
//                alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Cancel, handler: nil))
//                self.presentViewController(alert, animated: true, completion: nil)
//                
//                
//                
//            })
            
            self.performSegueWithIdentifier("updateStorySegue", sender: "abcd")
            

        }
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        
        if(segue.identifier == "updateStorySegue")
        {
            
            var controller = (segue.destinationViewController as! BookStoryUpdateViewController)
            controller.bookText = sender as? String
        }
        
    }
    
    
    func showActionSheet() {
        
        // 1
        let optionMenu = UIAlertController(title: nil, message: "选择图片来源", preferredStyle: .ActionSheet)
        
        // 2
        let cAction = UIAlertAction(title: "照相机", style: .Default, handler: {
            (alert: UIAlertAction!) -> Void in
            
            self.imagePicker.allowsEditing = false
            self.imagePicker.sourceType = .Camera
            self.presentViewController(self.imagePicker, animated: true, completion: nil)
         })
        let pAction = UIAlertAction(title: "相册", style: .Default, handler: {
            (alert: UIAlertAction!) -> Void in
            self.imagePicker.allowsEditing = false
            self.imagePicker.sourceType = .PhotoLibrary
            self.presentViewController(self.imagePicker, animated: true, completion: nil)
        })
        
        //
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: {
            (alert: UIAlertAction!) -> Void in
        })
        
        
        // 4
        optionMenu.addAction(cAction)
        optionMenu.addAction(pAction)
        optionMenu.addAction(cancelAction)
        
        // 5
        self.presentViewController(optionMenu, animated: true, completion: nil)
    }
    
    
}
