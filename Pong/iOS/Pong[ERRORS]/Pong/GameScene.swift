//
//  GameScene.swift
//  Pong
//
//  Created by Kunal Botla on 2/22/17.
//  Copyright © 2017 Kunal Botla. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var ball = SKSpriteNode()
    var enemy = SKSpriteNode()
    var main = SKSpriteNode()
    
    var score = [Int]()
    
    override func didMove(to view: SKView) {
        
        startGame()
     //set to SKSpritNode
        ball = self.childNode(withName: "ball") as! SKSpriteNode
        enemy = self.childNode(withName: "enemy") as! SKSpriteNode
        main = self.childNode(withName: "main") as! SKSpriteNode
        
        ball.physicsBody?.applyImpulse(CGVector(dx: 20, dy: 20 ))
        
        let border = SKPhysicsBody(edgeLoopFrom: self.frame)
        //border friction and restatution
        border.friction = 0
        border.restitution = 1
        
        self.physicsBody = border

    }
    
    func startGame() {
        score = [0,0]
    
        func addScore(PlayerWhoWon : SKSpriteNode){
            
            ball.position = CGPoint(x: 0, y: 0)
            ball.physicsBody?.velocity = CGVector(dx: 0, dy: 0)
         
            if PlayerWhoWon == main{
                score[0] += 1
                ball.physicsBody?.applyImpulse(CGVector(dx: 20, dy: 20 ))
            }
            else if PlayerWhoWon == enemy{
                score[1] += 1
                ball.physicsBody?.applyImpulse(CGVector(dx: -20, dy: -20 ))
            }
            print(score)
        }
        
    func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            
            let location = touch.location(in: self)
            
            main.run(SKAction.moveTo(x: location.x, duration: 0.2))
        }
    }
    func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            
            let location = touch.location(in: self)
            
            main.run(SKAction.moveTo(x: location.x, duration: 0.2))
        }

    }
    
    func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        
        enemy.run(SKAction.moveTo(x: ball.position.x, duration: 1.0))
        
        if ball.position.y <= main.position.y - 70 {
            addScore(PlayerWhoWon: enemy)
            
        }
        else if ball.position.y >= enemy.position.y + 70 {
             addScore(PlayerWhoWon: main )
            
        }

        }
    }
}
