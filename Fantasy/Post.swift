//
//  Post.swift
//  Fantasy
//
//  Created by Javier Bustillo on 5/18/16.
//  Copyright © 2016 Javier Bustillo. All rights reserved.
//

import UIKit
import Parse


class Post: NSObject {
    var Player1: String?
    var Player2: String?
    var Player3: String?
    var Player4: String?
    var Player5: String?
    var user: String?
    
    
    init(Player1: String, Player2: String, Player3: String, Player4: String, Player5: String, user: String){
        self.Player1 = Player1
        self.Player2 = Player2
        self.Player3 = Player3
        self.Player4 = Player4
        self.Player5 = Player5
        self.user = user
    }
    
    func post(){
        let post = PFObject(className: "teams")
        
        post.setObject(Player1!, forKey: "Player1")
        post.setObject(Player2!, forKey: "Player2")
        post.setObject(Player3!, forKey: "Player1")
        post.setObject(Player4!, forKey: "Player1")
        post.setObject(Player5!, forKey: "Player1")
        post.setObject(user!, forKey: "user")
        
        
        
        
        
        post.saveInBackgroundWithBlock {
            
            (success: Bool, error: NSError?) -> Void in
            
            if(success){
                print("cool")
            }else{
                print(error?.code)
                
            }
        }
    }
    

}
