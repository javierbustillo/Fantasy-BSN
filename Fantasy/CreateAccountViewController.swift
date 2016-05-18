//
//  CreateAccountViewController.swift
//  Fantasy
//
//  Created by Javier Bustillo on 5/6/16.
//  Copyright © 2016 Javier Bustillo. All rights reserved.
//

import UIKit
import Parse


class CreateAccountViewController: UIViewController {
    @IBOutlet weak var userNameField: UITextField!

    @IBOutlet weak var teamField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func createAccount(sender: AnyObject) {
        
        let newUser = PFUser()
        newUser.username = userNameField.text
        newUser.password = passwordField.text
        newUser["team_name"] = teamField.text
        newUser["admin"] = 0
        newUser["credits"] = 1000
        
        
        newUser.signUpInBackgroundWithBlock { (success: Bool, error: NSError?)-> Void in
            if success{
                print("yay")
                self.performSegueWithIdentifier("teamSegue", sender: nil)
                
                
            }else{
                
            }
        }
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


