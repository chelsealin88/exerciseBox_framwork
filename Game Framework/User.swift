//
//  User.swift
//  Game Framework
//
//  Created by Chelsea Lin on 2019/7/25.
//  Copyright © 2019 chelsea lin. All rights reserved.
//

import Foundation


class UserDefault {
    
    static let countKey = "countKey"
    static let playTimeKey = "playTimeKey"
    
    // score
    static func getScore() -> Int {
        
        if let count = UserDefaults.standard.value(forKey: countKey) as? Int {
            return count
        }
        return 0
    }
    
    static func saveScore(_ count: Int) {
        UserDefaults.standard.set(count, forKey: countKey)
    }
    
    
    // played time
    static func getPlayTime() -> Int {
        
        if  let playTime = UserDefaults.standard.value(forKey: playTimeKey) as? Int {
            return playTime
        }
        return 0
    }
    
    static func savePlayTime(_ played: Int) {
        UserDefaults.standard.set(played, forKey: playTimeKey)
    }
}
