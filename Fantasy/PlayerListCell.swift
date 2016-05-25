//
//  PlayerListCell.swift
//  Fantasy
//
//  Created by Javier Bustillo on 5/20/16.
//  Copyright © 2016 Javier Bustillo. All rights reserved.
//

import UIKit
import Parse


class PlayerListCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
   
    var Team: PFObject!{
        didSet{
            nameLabel.text = Team["player0"] as? String
           // nameLabel1.text = Team["player1"] as? String
            
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
