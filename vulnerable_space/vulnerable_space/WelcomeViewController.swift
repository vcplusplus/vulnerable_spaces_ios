//
//  WelcomePage.swift
//  vulnerable_spaces
//
//  Created by Kathryn Hodge on 11/14/15.
//  Copyright © 2015 VC++. All rights reserved.
//

import Foundation

class WelcomeViewController: UIViewController {
    
    @IBOutlet weak var textBox: UITextView!
    @IBOutlet weak var continueButton: UIButton!
    var textCounter = 0
    let text0 = "The data of “emotional moments,” collected via this application, from Vassar students with regard to the campus and the surrounding Poughkeepsie area will be used to construct one or many visualized pieces demonstrating shared spaces of importance and vulnerability."
    let text1 = "In discovering these common spaces, the hope is to learn more about how we as Vassar students can communicate and connect with each other. Both the positive and the negative importances we share and the spaces we share need to be better understood. This data is a portion of my ultimate thesis project entitled: The Climate of Vulnerable Spaces."
    let text2 = "All data is anonymous. no names or personal data will be relayed or incorporated into the project."
    let text3 = "Please mark places where something of emotional significance has happened to you. It may be positive or negative. Submit as many places as you want. Please by as precise as possible."
    
    override func viewDidLoad() {
        
        continueButton.layer.cornerRadius = 10;
        continueButton.clipsToBounds = true;
        
        textBox.text = text0
        textCounter = 0
    }
    
    @IBAction func continueButtonPressed(sender: UIButton) {
        textCounter++
        if textCounter == 1 {
            textBox.text = text1
        }
        if textCounter == 2 {
            textBox.text = text2
        }
        if textCounter == 3 {
            continueButton.setTitle("Finish", forState: UIControlState.Normal)
            textBox.text = text3
        }
        if textCounter > 3 {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewControllerWithIdentifier("mapView") as! MapViewController
            self.presentViewController(vc,animated:true,completion:nil)
        }
        
    }
}