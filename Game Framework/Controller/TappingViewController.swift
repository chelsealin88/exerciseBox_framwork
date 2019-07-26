//
//  TappingViewController.swift
//  Game Framework
//
//  Created by Chelsea Lin on 2019/7/25.
//  Copyright © 2019 chelsea lin. All rights reserved.
//

import UIKit

class TappingViewController: UIViewController {

    @IBOutlet weak var pieImage: UIImageView!
    @IBOutlet weak var timeLabel: UILabel!
    
    var score = 0
    var played = UserDefault.getPlayTime()
    var timer: Timer?
    var totalTime = 5
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pieImage.image = UIImage(named: "pie")
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "wooden")!)
        let singleTap = UITapGestureRecognizer(target: self, action: #selector(tapTime))
        pieImage.isUserInteractionEnabled = true
        pieImage.addGestureRecognizer(singleTap)
        
        startTime()
    }
    
    @objc func tapTime() {
        
        score = score + 1
        
        if score >= 5 {
            pieImage.image = UIImage(named: "pie0")
        }; if score >= 10 {
            pieImage.image = UIImage(named: "pie2")
        }; if score >= 15 {
            pieImage.image = UIImage(named: "pie3")
        }; if score >= 20 {
            pieImage.image = UIImage(named: "pie4")
        }; if score >= 25 {
            pieImage.image = UIImage(named: "pie5")
        }; if score >= 30 {
            pieImage.image = UIImage(named: "pie6")
        }; if score >= 40 {
            pieImage.image = UIImage(named: "pie7")
        }
        
        let currentScore = UserDefault.getScore()
        if score > currentScore {
            UserDefault.saveScore(score)
        }
    }
    
    
    
    
    // MARK: - 倒數器
    func startTime(){
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
    }
    
    @objc func updateTime(){
        
        timeLabel.text = "剩餘時間: \(totalTime) 秒"
        if totalTime != 0 {
            totalTime -= 1
            
        } else {
            endTime()
            played += 1
            UserDefault.savePlayTime(played)
            // show alert
            let alert = UIAlertController(title: "時間到", message: "成功次數：\(score)", preferredStyle: UIAlertController.Style.alert)
            let backAction = UIAlertAction(title: "Play Later", style: .default) { (action) in
                //todo: push to home
                
                self.navigationController?.popViewController(animated: true)
                
            }
            
            let okAction = UIAlertAction(title: "Try Again", style: .default) { (action) in
                
                
                self.totalTime = 5
                self.startTime()
                
                // save played time
                
            }
            
            alert.addAction(okAction)
            alert.addAction(backAction)
           
            self.present(alert, animated: true, completion: nil)
            
        }
        
    }
    
    func endTime() {
        timer?.invalidate()
    }
    
}

    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


