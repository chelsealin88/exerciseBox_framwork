//
//  User.swift
//  Game Framework
//
//  Created by Chelsea Lin on 2019/7/25.
//  Copyright © 2019 chelsea lin. All rights reserved.
//

import Foundation

// 用Userdefault存取遊戲紀錄&最高分
class UserDefault {
    
    static let countKey = "countKey"
    static let playTimeKey = "playTimeKey"
    
    // 取得最高分資料
    static func getScore() -> Int {
        
        if let count = UserDefaults.standard.value(forKey: countKey) as? Int {
            return count
        }
        return 0
    }
    
    // 儲存最高分資料
    static func saveScore(_ count: Int) {
        
        UserDefaults.standard.set(count, forKey: countKey) // 2
        
    }
    
 
    
    // 取得遊玩次數
    static func getPlayTime() -> Int {
        
        if  let playTime = UserDefaults.standard.value(forKey: playTimeKey) as? Int {
            return playTime
        }
        return 0
    }
    
    // 儲存遊玩次數
    static func savePlayTime(_ played: Int) {
        UserDefaults.standard.set(played, forKey: playTimeKey)
    }

}
