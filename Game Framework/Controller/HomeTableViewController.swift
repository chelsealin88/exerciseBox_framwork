//
//  HomeTableViewController.swift
//  Game Framework
//
//  Created by Chelsea Lin on 2019/7/25.
//  Copyright © 2019 chelsea lin. All rights reserved.
//

import UIKit

class HomeTableViewController: UITableViewController {
    
    var gameCreater : [GameCreater] = [GameCreater]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        gameCreater = GameData.getGame {
            self.tableView.reloadData()
        }
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return gameCreater.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! HomeTableViewCell
        let game = gameCreater[indexPath.row]
       
        cell.updateCell(game)
    
        return cell
    }
    
    
    
    // 判斷Cell並推到各自遊戲頁面
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            let vc = storyboard?.instantiateViewController(withIdentifier: "TappingViewController") as! TappingViewController
            navigationController?.pushViewController(vc, animated: true)
        default:
            break
        }
       
       
    }

}
