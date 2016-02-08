//
//  CameraViewController.swift
//  CollegeProfileBuilder
//
//  Created by Richie Gurgul on 2/2/16.
//  Copyright © 2016 Richie Gurgul. All rights reserved.
//

import UIKit

class CameraViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate
{
    
    @IBOutlet weak var displayImage: UIImageView!
    
    var imageToDisplay: UIImage!
    var collegeEdit: College!
    
    let imagePicker = UIImagePickerController()

    override func viewDidLoad()
    {
        super.viewDidLoad()
        imagePicker.delegate = self
        displayImage.image = imageToDisplay
    }
    
    @IBAction func cameraButton(sender: AnyObject)
    {
        if UIImagePickerController.isSourceTypeAvailable(.Camera)
        {
            imagePicker.sourceType = .Camera
            presentViewController(imagePicker, animated: true, completion: nil)
        }
        else
        {
            photosButton(sender)
        }
    }
    
    @IBAction func photosButton(sender: AnyObject)
    {
        imagePicker.sourceType = .PhotoLibrary
        presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject])
    {
        imagePicker.dismissViewControllerAnimated(true)
        {() -> Void in
            self.imageToDisplay = info[UIImagePickerControllerOriginalImage] as! UIImage
            self.displayImage.image = self.imageToDisplay
            self.collegeEdit.pic = self.imageToDisplay
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        if segue.identifier == "toCamera"
        {
            let nextVC = segue.destinationViewController as! DetailViewController
            nextVC.data = collegeEdit
        }
    }
    
    
}