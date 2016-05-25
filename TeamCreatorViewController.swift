//
//  TeamCreatorViewController.swift
//  Fantasy
//
//  Created by Javier Bustillo on 5/8/16.
//  Copyright © 2016 Javier Bustillo. All rights reserved.
//

import UIKit
import Parse

class TeamCreatorViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    
    @IBOutlet weak var pickButton: UIButton!
   
    
    var NewPlayer: String?
    var team: [PFObject]?
    
    @IBOutlet weak var creditLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        tableView.delegate = self
        tableView.dataSource = self
        queries()
        count()
        
        let creditsInt = PFUser.currentUser()?.objectForKey("credits")
        let credits = String(creditsInt!)
        
        creditLabel.text = credits
        
        
        
        
        
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
       
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        if let team = team{
            
            return team.count
            
            
        }
        else{
            print("wow")
            return 0
        }
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell") as! PlayerListCell
     
        cell.Team = team![indexPath.row]
        
        cell.selectionStyle = .None
        return cell
    }
    
    
    func count(){
        let query = PFQuery(className: "Team")
        query.whereKey("user", equalTo: PFUser.currentUser()!)
        
        query.countObjectsInBackgroundWithBlock { (count: Int32, error: NSError?) in
            if count == 5{
                self.pickButton.hidden = true
            }else{
                print("pick ahead")
            }
        }
    }
   
    
    func queries(){
        let query = PFQuery(className: "Team")
        query.whereKey("user", equalTo: PFUser.currentUser()!)
        
        
        query.findObjectsInBackgroundWithBlock { (team: [PFObject]?, error: NSError?) -> Void in
            if let team = team {
                self.team = team
                self.tableView.reloadData()
                print("woo")
                
            } else {
                // handle error
                print(error?.localizedDescription)
                print(error?.code)
            }
        }
        
        

    
    //acuerdate añadir unpin cuando hagas el saveButton
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    }
}
