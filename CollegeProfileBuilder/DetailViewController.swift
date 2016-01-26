//
//  DetailViewController.swift
//  CollegeProfileBuilder
//
//  Created by Richie Gurgul on 1/26/16.
//  Copyright © 2016 Richie Gurgul. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController
{
    
    @IBOutlet weak var collegePicture: UIImageView!
    @IBOutlet weak var collegeName: UITextField!
    @IBOutlet weak var collegeLocation: UITextField!
    @IBOutlet weak var collegePopulation: UITextField!
    
    var data: College!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        collegePicture.image = data.pic
        collegeName.text = data.name
        collegeLocation.text = data.loc
        collegePopulation.text = "\(data.num)"
    }
    
    @IBAction func saveNewData(sender: UIButton)
    {
        data.name = collegeName.text!
        data.loc = collegeLocation.text!
        data.num = Int(collegePopulation.text!)!
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        let nextVC = segue.destinationViewController as! ViewController
        nextVC.collegeList.append(data)
    }
    
}
