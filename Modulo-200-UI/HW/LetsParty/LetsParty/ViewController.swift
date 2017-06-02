//
//  ViewController.swift
//  LetsParty
//
//  Created by Árthur Ken Aramaki Mota on 10/10/16.
//  Copyright © 2016 Ken Aramaki. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var myTextFields: [UITextField]!
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var ageField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    
    // This IBAction clears all the texts from the Outlet Collection 'myTextFields'
    @IBAction func clearAll() {
        for field in myTextFields{
            field.text = ""
        }
    }
    
    // This IBAction is used at the 'Close' button to return to this View Controller
    @IBAction func goBack(sender: UIStoryboardSegue){
        print("I got back!")
    }
    
    // Performing the segue to the second View
    override func shouldPerformSegueWithIdentifier(identifier: String, sender: AnyObject?) -> Bool {
        
        // Making sure that the segue identifier we're using is the 'enter'
        guard identifier == "enter" else {
            return true
        }
        
        // Making sure all the fields are filled
        guard allFilled() else {
            showAlert("Sorry, mate! You must complete all the the info.")
            return false
        }
        
        // Making sure the password is correct. In this case, 123
        guard passwordField.text == "123" else {
            showAlert("Password Incorrect. \nTry again.")
            return false
        }
        
        // Making sure the ageField is filled and it is 18+
        guard let age = ageField.text where Int(age) >= 18 else {
            showAlert("This party is for 18+")
            return false
        }
        
        return true
    }
    
    // Method used to get the warning text we want to show and setting it to the AlertView
    func showAlert(warningText: String){
        
        let warning = AlertView(frame: self.view.frame, warningText: warningText)
        self.view.addSubview(warning)
        
        print(warningText)
        
    }
    
    // Method used to check if all the textFields are filled
    // It will look through  all the textFields and check if any of them is "" and filter them
    // So if none of the are "" the .isEmpty will return true
    // True -> There's no empty text field
    // False -> At least one of the textFields is ""
    func allFilled() -> Bool {
        return (myTextFields.filter {$0.text == ""}).isEmpty
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

