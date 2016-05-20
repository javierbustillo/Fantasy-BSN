//
//  PlayerDetailViewController.swift
//  Fantasy
//
//  Created by Javier Bustillo on 5/18/16.
//  Copyright © 2016 Javier Bustillo. All rights reserved.
//

import UIKit
import Parse


class PlayerDetailViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var teamLabel: UILabel!
    @IBOutlet weak var positionLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    var players: [PFObject]!
    var index: Int?
    var PlayerName: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let player = players![index!]
        
        nameLabel.text = player["name"] as? String
        positionLabel.text = player["postion"] as? String
        
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addButton(sender: AnyObject) {
        let player = players![index!]
        
        let userCredits = PFUser.currentUser()?.objectForKey("credits") as? Int
        let playerCredits = player["credits"] as! Int
        
        if userCredits >= playerCredits {
            
            PFUser.currentUser()?.incrementKey("credits", byAmount: -playerCredits)
            
            let user = PFUser.currentUser()
            user!["player"] = player["name"]
            user!.saveInBackgroundWithBlock({ (success: Bool, error: NSError?) in
                if success{
                    print("yahoo!")
                    
                }else{
                    print("google")
                }
            })
            
            performSegueWithIdentifier("backtopick", sender: nil)
        }else{
            print("Not enough credits")
            //add alert
        }
        
        
    }

    
    // MARK: - Navigation
    /*
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "backtopick"{
            let teamCreatorVC = segue.destinationViewController as! TeamCreatorViewController
            teamCreatorVC.NewPlayer = PlayerName
            teamCreatorVC.tableView.reloadData()
            teamCreatorVC.queries()
            
        }
    }
    */

}
