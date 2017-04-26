//
//  MenuVC.swift
//  Pong
//
//  Created by Kunal Botla on 2/22/17.
//  Copyright © 2017 Kunal Botla. All rights reserved.
//

import Foundation
import UIKit

enum gameType {
    case easy
    case medium
    case hard
    case extraHard
    case udb
    case audb
    case player2
}

class MenuVC : UIViewController {
    
    
    @IBAction func Player2(_ sender: Any) {
        moveToGame(game: .player2)
    }
    
    @IBAction func Easy(_ sender: Any) {
        moveToGame(game: .easy)
    }
    @IBAction func Medium(_ sender: Any) {
        moveToGame(game: .medium)
        
    }
    @IBAction func Hard(_ sender: Any) {
        moveToGame(game: .hard)
    }
    
    @IBAction func ExtraHard(_ sender: Any) {
        moveToGame(game: .extraHard)
    }
    
    @IBAction func audb(_ sender: Any) {
        moveToGame(game: .udb)
    }

    
    @IBAction func udb(_ sender: Any) {
        moveToGame(game: .audb)
    }

    
    func moveToGame(game : gameType) {
        let gameVC = self.storyboard?.instantiateViewController(withIdentifier: "gameVC") as! GameViewController
        
        currentGameType = game

        self.navigationController?.pushViewController(gameVC, animated: true)
    }
}
