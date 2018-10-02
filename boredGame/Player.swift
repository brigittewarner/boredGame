//
//  Player.swift
//  boredGame
//
//  Created by Lahiru Tholka-Mudalige on 9/27/18.
//  Copyright © 2018 Brigitte Warner. All rights reserved.
//

import Foundation
import SpriteKit
import GameplayKit

enum playerDirection {
    case right
    case left
}

func movePlayer(_ player: SKSpriteNode, _ ground: Ground, _ direction: playerDirection) {
    let moveAmount: CGFloat = 15
    let moveDuration: TimeInterval = 0.1
    let movePlayerLeft: SKAction = SKAction.moveBy(x: -moveAmount, y: 0, duration: moveDuration)
    let movePlayerRight: SKAction = SKAction.moveBy(x: moveAmount, y: 0, duration: moveDuration)
    let moveGround: SKAction = SKAction.moveBy(x: -moveAmount, y: 0, duration: moveDuration)
    let rightMostX = UIScreen.main.bounds.midX
    let leftMostX: CGFloat = -rightMostX
    
    switch direction{
    case .right:
        if player.position.x > rightMostX {
            ground.bricks.forEach({ (brick) in
                brick.run(moveGround)
            })
            ground.pipeList.forEach({ (pipe) in
                pipe.run(moveGround)
            })
        } else {
            player.run(movePlayerRight)
        }
    case .left:
        if (player.position.x - moveAmount) < leftMostX {
            let movePlayerLess = SKAction.moveBy(x: -(player.position.x - leftMostX), y: 0, duration: moveDuration)
            player.run(movePlayerLess)
        }
        else {
            player.run(movePlayerLeft)
        }
    }
}
