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
  var searchedTypes = ["bakery", "bar", "cafe", "grocery_or_supermarket", "restaurant"]
  let locationManager = CLLocationManager()
    var launchedBefore:Bool =  NSUserDefaults.standardUserDefaults().boolForKey("LaunchedBefore");
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Do any additional setup after loading the view, typically from a nib.
    locationManager.delegate = self
    locationManager.requestWhenInUseAuthorization()
    submitButton.layer.cornerRadius = 10;
    submitButton.clipsToBounds = true;
    
    
  }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        if (launchedBefore) {
        } else {
           // let alert = UIAlertController(title: "Alert", message: "Message", preferredStyle: UIAlertControllerStyle.Alert)
           // alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
           // self.presentViewController(alert, animated: true, completion: nil)
          //  showLocationAlert = true;
        }
    }
    
    @IBAction func infoButtonPressed(sender: AnyObject) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewControllerWithIdentifier("welcomeView") as! WelcomeViewController
        self.presentViewController(vc,animated:true,completion:nil)
    }
    
    @IBAction func submitButtonPressed(sender: UIButton) {
        // Go get location of the center point
        let point:CGPoint = mapView.center
        let coor:CLLocationCoordinate2D = mapView.projection.coordinateForPoint(point);
        let currentLocation = coor
        
        var user = PFUser.currentUser()
        var location = Location()
        location.longitude = currentLocation.longitude
        location.latitude = currentLocation.latitude
        location["user"] = user
        
        
        do {
            try location.save()
        }
        catch {
            
        }
        
        let alert = UIAlertController(title: "Submitted!", message: "You submitted a location.", preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "Continue", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
        
    }
    
  
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
   

  