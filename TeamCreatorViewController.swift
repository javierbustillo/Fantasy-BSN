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

    
   
    
    var NewPlayer: String?
    var players: [PFObject]!
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //queries()
        tableView.delegate = self
        tableView.dataSource = self
       // queries()
        
        
        
        
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
       
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
       return 5
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell") as! PlayerListCell
     
        cell.players = PFUser.currentUser()?.objectForKey("name") as? PFObject
        
        cell.selectionStyle = .None
        return cell
    }
    
    func queries(){
        let query = PFQuery(className: "players")
        query.fromLocalDatastore()
        
        query.findObjectsInBackgroundWithBlock { (players: [PFObject]?, error: NSError?) -> Void in
            if let players = players {
                self.players = players
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
