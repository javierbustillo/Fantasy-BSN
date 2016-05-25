//
//  PlayerListViewController.swift
//  Fantasy
//
//  Created by Javier Bustillo on 5/8/16.
//  Copyright © 2016 Javier Bustillo. All rights reserved.
//

import UIKit
import Parse


class PlayerListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    var players: [PFObject]!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
        queries()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        if let players = players{
            print("this works")
            return players.count
            
        }
        else{
            print(":/")
            return 0
        }
        
    }
    
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier("playerCell") as! TeamListCell
        cell.players = players![indexPath.row]
        
        
        cell.selectionStyle = .None
        return cell
    }
    
    
    func queries(){
        
        let query = PFQuery(className: "players")
        query.orderByDescending("name")
        query.includeKey("author")
        query.limit = 20
        
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
        
    }
    
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "detail"{
            let cell = sender as! UITableViewCell
            let indexPath = tableView.indexPathForCell(cell)
            
            let index = indexPath!.row
            
            
            let playerDetailVC = segue.destinationViewController as! PlayerDetailViewController
            
            playerDetailVC.players = players
            playerDetailVC.index = index
            print("sending info!")
        
        }
    
    
    
    }
    
    

}
