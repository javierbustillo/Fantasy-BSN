//
//  HomeViewController.swift
//  Fantasy
//
//  Created by Javier Bustillo on 5/7/16.
//  Copyright © 2016 Javier Bustillo. All rights reserved.
//

import UIKit
import Parse


class HomeViewController: UIViewController {
    @IBOutlet weak var teamName: UILabel!

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let team = PFUser.currentUser()?.objectForKey("team_name") as! String
        
        teamName.text = team
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
