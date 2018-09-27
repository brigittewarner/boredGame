//
//  GameScene.swift
//  boredGame
//
//  Created by Brigitte Warner on 9/26/18.
//  Copyright © 2018 Brigitte Warner. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    private var label : SKLabelNode?
    private var spinnyNode : SKShapeNode?
    
    let player = SKSpriteNode(imageNamed: "mario")
    let leftButton = SKSpriteNode(imageNamed: "leftArrow")
    let rightButton = SKSpriteNode(imageNamed: "rightArrow")
    let upButton = SKSpriteNode(imageNamed: "upArrow")
    let ground = Ground()
    
    override func didMove(to view: SKView) {
        
        backgroundColor = SKColor(red: 0.42, green: 0.55, blue: 1.0, alpha: 1.0)
        
        player.position = CGPoint(x: -200, y: -350)
        leftButton.position = CGPoint(x: -240, y: -570)
        rightButton.position = CGPoint(x: -100, y: -565)
        upButton.position = CGPoint(x: 200, y: -570)
        leftButton.name = "leftButton"
        rightButton.name = "rightButton"
        upButton.name = "upButton"
        
        for brick in ground.bricks {
            self.addChild(brick)
        }
        
        self.addChild(player)
        self.addChild(leftButton)
        self.addChild(rightButton)
        self.addChild(upButton)
        
        let moveDown = SKAction.moveBy(x: 0, y:-50, duration:1.0)

        player.run(moveDown)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in (touches) {
            let positionInScene = touch.location(in: self)
            let touchedNode = self.atPoint(positionInScene)
            if let name = touchedNode.name {
                if name == "leftButton" {
                    let moveAction: SKAction = SKAction.moveBy(x: -15, y: 0, duration: 0.1)
                    player.run(moveAction)
                }
                if name == "rightButton" {
                    let moveAction: SKAction = SKAction.moveBy(x: 15, y: 0, duration: 0.1)
                    player.run(moveAction)
                }
                if name == "upButton" {
                    let moveAction: SKAction = SKAction.moveBy(x: 0, y: 15, duration: 0.1)
                    player.run(moveAction)
                }
            }
        }
    }
}
