//
//  AppDelegate.swift
//  vulnerable_space
//
//  Created by Jayce Rudig-Leathers on 11/1/15.
//  Copyright © 2015 VC++. All rights reserved.
//

import UIKit
import Parse
import Bolts
import Fabric
import Crashlytics


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    let googleMapsApiKey = "AIzaSyAPgC44Q2EApq8r3g0wh61L22MH24Ie44o";


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        //crashlytics
        Fabric.with([Crashlytics.self])

        
        // Override point for customization after application launch.
        GMSServices.provideAPIKey(googleMapsApiKey)

        // [Optional] Power your app with Local Datastore. For more info, go to
        // https://parse.com/docs/ios_guide#localdatastore/iOS
        Parse.enableLocalDatastore()

        // Initialize Parse.
        Parse.setApplicationId("Y4ZAEHzKFMnAoF6H69mdDL5HXfjhkCGPjAyR79wV",
            clientKey: "UCT5NSVRKIyACaGCYh5kMT3IQw9dcJM3olB9wUsr")

        // [Optional] Track statistics around application opens.
        PFAnalytics.trackAppOpenedWithLaunchOptions(launchOptions)

    
        let launchedBefore = NSUserDefaults.standardUserDefaults().boolForKey("LaunchedBefore")
        let storyboard = UIStoryboard(name:"Main", bundle:NSBundle.mainBundle());
        var rootViewController : UIViewController;
        
        
        if launchedBefore {
            if let _ = PFUser.currentUser() {
                
            }
            else {
                // Set up unique user
                let deviceIdentifier = UIDevice.currentDevice().identifierForVendor!.UUIDString
                PFUser.logInWithUsernameInBackground(deviceIdentifier, password:""){
                    (user: PFUser?, error: NSError?) -> Void in
                    if user != nil {

                    }
                    else {

                    }
                }

            }
             rootViewController = storyboard.instantiateViewControllerWithIdentifier("mapView") as UIViewController;
        }
        else {
            let user = PFUser()
            let deviceIdentifier = UIDevice.currentDevice().identifierForVendor!.UUIDString
            user.username = deviceIdentifier
            user.password = ""

            user.signUpInBackgroundWithBlock {
                (succeeded: Bool, error: NSError?) -> Void in
                if let error = error{
                    _ = error.userInfo["error"] as? NSString
                }
                else {
                }
            }
            
            // Launch welcome view
            rootViewController = storyboard.instantiateViewControllerWithIdentifier("welcomeView") as UIViewController;
            
            
            NSUserDefaults.standardUserDefaults().setBool(true, forKey: "LaunchedBefore")
        }
        
        self.window?.rootViewController = rootViewController
        self.window?.makeKeyAndVisible()

        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}
