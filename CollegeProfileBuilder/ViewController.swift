//
//  ViewController.swift
//  CollegeProfileBuilder
//
//  Created by Richie Gurgul on 1/20/16.
//  Copyright © 2016 Richie Gurgul. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate
{
    @IBOutlet weak var collegesTableView: UITableView!
    @IBOutlet weak var collegeEditButton: UIBarButtonItem!

    var collegeList = [College]()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    
        collegesTableView.dataSource = self
        collegesTableView.delegate = self
        collegesTableView.reloadData()
        
        collegeEditButton.tag = 0
    
        collegeList.append(College(Name: "University of Illinois", Loc: "Urbana–Champaign", Num: 44087))
        collegeList.append(College(Name: "University of Wisconsin", Loc: "Madison", Num: 43193))
        collegeList.append(College(Name: "Indiana University", Loc: "Bloomington", Num: 48514))
    }
    
    override func viewDidAppear(animated: Bool)
    {
        collegesTableView.reloadData()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        let nextVC = segue.destinationViewController as! DetailViewController
        let selectedRow = collegesTableView.indexPathForSelectedRow!.row
        nextVC.data = collegeList[selectedRow]
    }
    
    @IBAction func editCollegeList(sender: UIBarButtonItem)
    {
        if sender.tag == 0
        {
            collegesTableView.editing = true
            collegeEditButton.tag = 1
        }
        else
        {
            collegesTableView.editing = false
            collegeEditButton.tag = 0
        }
    }
    
    @IBAction func addCollege(sender: AnyObject)
    {
        let myAlert = UIAlertController(title: "Add a New College to the List", message: nil, preferredStyle: .Alert)
        myAlert.addTextFieldWithConfigurationHandler
        {   (pageField) -> Void in
            pageField.placeholder = "College Webpage"
        }
        myAlert.addTextFieldWithConfigurationHandler
        {   (nameField) -> Void in
            nameField.placeholder = "College Name"
        }
        myAlert.addTextFieldWithConfigurationHandler
        {   (locField) -> Void in
            locField.placeholder = "College Location"
        }
        myAlert.addTextFieldWithConfigurationHandler
        {   (numField) -> Void in
            numField.placeholder = "Number of Students"
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
        let confirmAction = UIAlertAction(title: "Confirm", style: .Default)
        {   (action) -> Void in
            let pageTF = myAlert.textFields![0]
            let nameTF = myAlert.textFields![1]
            let locTF = myAlert.textFields![2]
            let numTF = myAlert.textFields![3]
                
            self.collegeList.append(College(Page: pageTF.text!, Name: nameTF.text!, Loc: locTF.text!, Num: Int(numTF.text!)!))
            self.collegesTableView.reloadData()
        }
        
        myAlert.addAction(cancelAction)
        myAlert.addAction(confirmAction)
        
        self.presentViewController(myAlert, animated: true, completion: nil)
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath)
    {
        if editingStyle == .Delete
        {
            collegeList.removeAtIndex(indexPath.row)
            
            collegesTableView.reloadData()
        }
    }
    
    func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool
    {
        return true
    }
    
    func tableView(tableView: UITableView, moveRowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath)
    {
        collegeList.insert(collegeList.removeAtIndex(sourceIndexPath.row), atIndex: destinationIndexPath.row)
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let myCell = collegesTableView.dequeueReusableCellWithIdentifier("collegeCell", forIndexPath: indexPath)
        myCell.textLabel!.text = "\(collegeList[indexPath.row].name) (\(collegeList[indexPath.row].num))"
        myCell.detailTextLabel!.text = collegeList[indexPath.row].loc
        return myCell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return collegeList.count
    }
    
}

