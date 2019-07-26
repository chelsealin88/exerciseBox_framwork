//
//  XXOOViewController.swift
//  Game Framework
//
//  Created by Chelsea Lin on 2019/7/26.
//  Copyright © 2019 chelsea lin. All rights reserved.
//

import UIKit

class XXOOViewController: UIViewController {
    
    var activityPlayer = 1 //cross
    var gameState = [0,0,0,0,0,0,0,0,0]

    @IBAction func action(_ sender: AnyObject) {
        
        if gameState[sender.tag-1] == 0 {
            
            gameState[sender.tag-1] = activityPlayer
            
            if (activityPlayer == 1) {
                sender.setImage(UIImage(named: "X"), for: UIControl.State())
                activityPlayer = 2
            } else {
                sender.setImage(UIImage(named: "O"), for: UIControl.State())
                activityPlayer = 1
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
