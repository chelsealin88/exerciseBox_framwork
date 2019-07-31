//
//  Game.swift
//  Game Framework
//
//  Created by Chelsea Lin on 2019/7/25.
//  Copyright © 2019 chelsea lin. All rights reserved.
//

import Foundation
import UIKit


protocol GameSystem: UIViewController {
    
    // 分數
    var score : Int  { get set }
    // 遊玩紀錄
    var played: Int  { get set }
    // 時間
    var timer: Timer? { get set }
    //遊戲設定
    func setGame()
    //時間設定
    func setTime()
    
}

struct GameCreater {
    
    var name : String
    var score: Int
    var playedTime: Int

}



//創建遊戲
class GameData {
    
    static func getGame(completion: @escaping () -> Void) -> [GameCreater] {
        
        var gameName : [GameCreater] = []
        
        //取得遊戲紀錄&最高分資料
        let score = UserDefault.getScore()
        let playtime = UserDefault.getPlayTime()
        
        //新增遊戲
        let game1 = GameCreater(name: "PIE Eater 🍕", score: score, playedTime: playtime)
        
        gameName.append(game1)
        
        completion()
        return gameName
    
    }
}



