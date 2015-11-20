//
//  MapViewController.swift
//  Feed Me
//
/*
* Copyright (c) 2015 Razeware LLC
*
* Permission is hereby granted, free of charge, to any person obtaining a copy
* of this software and associated documentation files (the "Software"), to deal
* in the Software without restriction, including without limitation the rights
* to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
* copies of the Software, and to permit persons to whom the Software is
* furnished to do so, subject to the following conditions:
*
* The above copyright notice and this permission notice shall be included in
* all copies or substantial portions of the Software.
*
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
* AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
* LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
* OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
* THE SOFTWARE.
*/

import UIKit
import Parse

class MapViewController: UIViewController {
    
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var mapView: GMSMapView!
    @IBOutlet weak var mapCenterPinImage: UIImageView!
    @IBOutlet weak var pinImageVerticalConstraint: NSLayoutConstraint!
    let locationManager = CLLocationManager()
    var launchedBefore:Bool =  NSUserDefaults.standardUserDefaults().boolForKey("LaunchedBefore");
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyBestForNavigation
        submitButton.layer.cornerRadius = 10
        submitButton.clipsToBounds = true;
        
        // Putting the user's submitted pin on the board
        putSubmittedPinsOnTheMap()
        
        let button   = UIButton(type: UIButtonType.System) as UIButton
        button.frame = CGRectMake(100, 100, 100, 50)
        button.backgroundColor = UIColor.greenColor()
        button.setTitle("Undo", forState: UIControlState.Normal)
        button.addTarget(self, action: "deleteLastPin:", forControlEvents: UIControlEvents.TouchUpInside)
        
        self.view.addSubview(button)
        
        
        
        
        
    }
    
    func putSubmittedPinsOnTheMap() {
        
        let query = PFQuery(className:"Location")
        
        if let user = PFUser.currentUser() {
            query.whereKey("user", equalTo:user)
            query.findObjectsInBackgroundWithBlock {
                (locations: [PFObject]?, error: NSError?) -> Void in
                if error == nil {
                    // The find succeeded.
                    // Do something with the found objects
                    if let locations = locations as [PFObject]! {
                        for location in locations {
                            let lat:Double = location.objectForKey("latitude") as! Double
                            let long:Double = location.objectForKey("longitude") as! Double
                            let position = CLLocationCoordinate2DMake(lat, long)
                            let marker = GMSMarker(position:position);
                            // marker icon?
                            marker.map = self.mapView
                        }
                    }
                }
                
            }
        }
    }
    
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    @IBAction func infoButtonPressed(sender: AnyObject) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewControllerWithIdentifier("welcomeView") as! WelcomeViewController
        self.presentViewController(vc,animated:true,completion:nil)
    }
    
    
    @IBAction func submitButtonPressed(sender: UIButton) {
        // Go get location of the center point
        let point:CGPoint = self.view.center
        let coor:CLLocationCoordinate2D = mapView.projection.coordinateForPoint(point);
        // Put a pin on the location that we just submitted
        let marker = GMSMarker(position: coor)
        //marker.icon
        marker.map = mapView
        
        let currentLocation = coor
        
        let user = PFUser.currentUser()
        let location = Location()
        location.longitude = currentLocation.longitude
        location.latitude = currentLocation.latitude
        location["user"] = user
        
        
        do {
            try location.save()
        }
        catch {
            
        }
        
        // Location submitted alert!
        let alert = UIAlertController(title: "Submitted!", message: "Location submitted successfully", preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "Continue", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
        
        
    }
    
    // UNDO
    // 1. Get all of the user's locations with time stamps
    
    @IBAction func deleteLastPin(sender: AnyObject) {
        let query = PFQuery(className:"Location")
        print("hello to you")
        if let user = PFUser.currentUser() {
            query.whereKey("user", equalTo:user)
            query.findObjectsInBackgroundWithBlock {
                (locations: [PFObject]?, error: NSError?) -> Void in
                if error == nil {
                    // The find succeeded.
                    // Do something with the found objects
                    var latestLocation = locations![0]
                    if let locations = locations as [PFObject]! {
                        for location in locations {
                            if((latestLocation.updatedAt!).laterDate(location.updatedAt!) == location.updatedAt) {
                                latestLocation = location
                            }
                            
                        }
                        
                    }
                    
                    // Location submitted alert!
                    let alert = UIAlertController(title: "Warning!", message: "Are you sure you want to delete your last pin?", preferredStyle: UIAlertControllerStyle.Alert)
                    
                    alert.addAction(UIAlertAction(title:"Yes", style:.Default, handler: { (action: UIAlertAction!) in
                        
                        latestLocation.deleteInBackgroundWithBlock({ (v:Bool, error: NSError?) -> Void in
                            self.refreshPins()
                        })
                        
                        }))
                        
                    alert.addAction(UIAlertAction(title:"No", style:.Default, handler: { (action: UIAlertAction!) in
                        
                        }))
                
                    
                    self.presentViewController(alert, animated: true, completion: nil)
                    
                    
                
                }
                
            }
        
        }
    }
    
    func refreshPins() {
        self.mapView.clear();
        self.putSubmittedPinsOnTheMap()
        print("really finished")
    }
    // 2. Find the one that is the most recent
    
    // 3. Delete the most recent one
    
    // 4. Update the submittedPins on the map
    
    
    
}

// MARK: - CLLocationManagerDelegate
//1
extension MapViewController: CLLocationManagerDelegate {
    // 2
    func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        // 3
        if status == .AuthorizedWhenInUse {
            
            // 4
            locationManager.startUpdatingLocation()
            
            //5
            mapView.myLocationEnabled = true
            mapView.settings.myLocationButton = true
        }
    }
    
    // 6
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            
            // 7
            mapView.camera = GMSCameraPosition(target: location.coordinate, zoom: 18, bearing: 0, viewingAngle: 0)
            
            // 8
            locationManager.stopUpdatingLocation()
            
        }
        
    }
    
}


  