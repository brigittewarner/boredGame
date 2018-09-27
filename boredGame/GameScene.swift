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
    
    var leftButtonIsPressed = false
    var rightButtonIsPressed = false
    var upButtonIsPressed = false
    
    override func didMove(to view: SKView) {
        
        backgroundColor = SKColor(red: 0.42, green: 0.55, blue: 1.0, alpha: 1.0)
        physicsWorld.gravity = CGVector(dx: 0.0, dy: -2.0)
        
        player.position = CGPoint(x: -200, y: -350)
        player.physicsBody = SKPhysicsBody(circleOfRadius: player.size.width / 2 )
        player.physicsBody?.isDynamic = true
        player.physicsBody?.allowsRotation = false
        
        leftButton.position = CGPoint(x: -240, y: -570)
        rightButton.position = CGPoint(x: -100, y: -565)
        upButton.position = CGPoint(x: 200, y: -570)
        
        for brick in ground.bricks {
            self.addChild(brick)
        }
        
        self.addChild(player)
        self.addChild(leftButton)
        self.addChild(rightButton)
        self.addChild(upButton)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let pointTouched = touch.location(in: self)
            if leftButton.contains(pointTouched) {
                leftButtonIsPressed = true
            }
            if rightButton.contains(pointTouched) {
                rightButtonIsPressed = true
            }
            if upButton.contains(pointTouched) {
             upButtonIsPressed = true
            }
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
        if leftButtonIsPressed == true {
            player.texture = SKTexture(imageNamed: "marioLeft")
            movePlayer(player, ground, playerDirection.left)
        }
    
        if rightButtonIsPressed == true {
            player.texture = SKTexture(imageNamed: "mario")
            movePlayer(player, ground, playerDirection.right)
        }
        if upButtonIsPressed == true {
            let moveAction: SKAction = SKAction.moveBy(x: 0, y: 200, duration: 0.1)
            player.run(moveAction)
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let pointTouched = touch.location(in: self)
            if leftButton.contains(pointTouched) {
                leftButtonIsPressed = false
            }
            if rightButton.contains(pointTouched) {
                rightButtonIsPressed = false
            }
            if upButton.contains(pointTouched) {
                upButtonIsPressed = false
            }
        }
    }
}
