//
//  DetailViewController.swift
//  CollegeProfileBuilder
//
//  Created by Richie Gurgul on 1/26/16.
//  Copyright © 2016 Richie Gurgul. All rights reserved.
//

import UIKit
import SafariServices

class DetailViewController: UIViewController, UITextFieldDelegate, SFSafariViewControllerDelegate
{
    
    @IBOutlet weak var collegePicture: UIImageView!
    @IBOutlet weak var collegeName: UITextField!
    @IBOutlet weak var collegeLocation: UITextField!
    @IBOutlet weak var collegePopulation: UITextField!
    @IBOutlet weak var collegeWebpage: UITextField!
    
    var data: College!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        collegePicture.image = data.pic
        collegeName.text = data.name
        collegeLocation.text = data.loc
        collegePopulation.text = "\(data.num)"
        collegeWebpage.text = data.page
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool
    {
        data.name = collegeName.text!
        data.loc = collegeLocation.text!
        data.num = Int(collegePopulation.text!)!
        data.page = collegeWebpage.text!
        
        textField.resignFirstResponder()
        
        return true
    }
    
    @IBAction func loadWebpage(sender: AnyObject)
    {
        let url = "https://www.\(collegeWebpage.text!)"
        let myURL = NSURL(string: url)
        let SVC = SFSafariViewController(URL: myURL!)
        SVC.delegate = self
        presentViewController(SVC, animated: true, completion: nil)
    }
    
    func safariViewControllerDidFinish(controller: SFSafariViewController)
    {
        controller.dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        if segue.identifier == "toDetail"
        {
            let nextVC = segue.destinationViewController as! ViewController
            nextVC.collegeList.append(data)
        }
        else if segue.identifier == "toCamera"
        {
            let nextVC = segue.destinationViewController as! CameraViewController
            nextVC.imageToDisplay = data.pic
            nextVC.collegeEdit = data
        }
    }
    
}
