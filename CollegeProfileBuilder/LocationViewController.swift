//
//  LocationViewController.swift
//  CollegeProfileBuilder
//
//  Created by Richie Gurgul on 2/22/16.
//  Copyright © 2016 Richie Gurgul. All rights reserved.
//

import Foundation
import UIKit
import MapKit

class LocationViewController: UIViewController, UISearchBarDelegate
{
    @IBOutlet weak var locationDisplay: MKMapView!
    @IBOutlet weak var locationSearchBar: UISearchBar!
    
    var data: College!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        geocodeLocation(data.loc)
        locationSearchBar.text = data.loc
    }
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar)
    {
        data.loc = locationSearchBar.text!
        geocodeLocation(data.loc)
    }
    
    func geocodeLocation(Location: String)
    {
        let myGeocoder = CLGeocoder()
        myGeocoder.geocodeAddressString(Location)
        {   (placemarks, error) -> Void in
            
            if error != nil
            {
            }
            else if placemarks?.count > 1
            {
                let mySheet = UIAlertController(title: nil, message: nil, preferredStyle: .ActionSheet)
                
                for placemark in placemarks!
                {
                    mySheet.addAction(UIAlertAction(title: "\(placemark.name!), \(placemark.locality)", style: .Default, handler:
                    {(cameraAction) -> Void in
                        self.displayMap(placemark)
                    }))
                }
                
                mySheet.addAction(UIAlertAction(title: "Cancel", style: .Cancel, handler: nil))
                
                self.presentViewController(mySheet, animated: true, completion: nil)
            }
            else if placemarks?.count == 1
            {
                self.displayMap(placemarks![0])
            }
        }
    }
    
    func displayMap(myPlacemark: CLPlacemark)
    {
        let myLocation = myPlacemark.location
        let mySpan = MKCoordinateSpanMake(1.0, 1.0)
        let myRegion = MKCoordinateRegionMake((myLocation?.coordinate)!, mySpan)
        locationDisplay.setRegion(myRegion, animated: true)
        
        let myPin = MKPointAnnotation()
        myPin.coordinate = (myLocation?.coordinate)!
        myPin.title = myPlacemark.name!
        locationDisplay.addAnnotation(myPin)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        if segue.identifier == "toMap"
        {
            let nextVC = segue.destinationViewController as! DetailViewController
            data.loc = locationSearchBar.text!
            nextVC.data = data
        }
    }
    
}