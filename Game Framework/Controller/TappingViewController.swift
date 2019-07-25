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
    
    var count = 0
    var played = 0
    var timer: Timer?
    var totalTime = 5
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "wooden")!)
        let singleTap = UITapGestureRecognizer(target: self, action: #selector(tapTime))
        pieImage.isUserInteractionEnabled = true
        pieImage.addGestureRecognizer(singleTap)
        
        startTime()
    }
    
    @objc func tapTime() {
        count = count + 1
        UserDefault.saveScore(count)
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
            // show alert
            let alert = UIAlertController(title: "時間到", message: "成功次數：\(count)", preferredStyle: UIAlertController.Style.alert)
            let backAction = UIAlertAction(title: "Play Later", style: .default) { (action) in
                //todo: push to home
                self.played += 1

                self.navigationController?.popViewController(animated: true)
            }
            
            let okAction = UIAlertAction(title: "Try Again", style: .default) { (action) in
                
                self.played += 1
                self.totalTime = 5
                self.startTime()
                
                // save played time
                
            }
            
            alert.addAction(okAction)
            alert.addAction(backAction)
            UserDefault.savePlayTime(played)
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


