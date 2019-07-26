//
//  Game.swift
//  Game Framework
//
//  Created by Chelsea Lin on 2019/7/25.
//  Copyright © 2019 chelsea lin. All rights reserved.
//

import Foundation


struct GameCreater {
    
    var name : String
    var score: Int
    var playedTime: Int

}


class GameData {
    
    static func getGame(completion: @escaping () -> Void) -> [GameCreater] {
        
        var gameName : [GameCreater] = []
        
        let score = UserDefault.getScore()
        let playtime = UserDefault.getPlayTime()
        
        let game1 = GameCreater(name: "PIE Eater 噬派者🍕", score: score, playedTime: playtime)
        let game2 = GameCreater(name: "圈圈擦擦⭕️❌", score: 0, playedTime: 0)
        
        gameName.append(game1)
        gameName.append(game2)
        
        completion()
        return gameName
    
    }
}
