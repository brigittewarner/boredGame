//
//  Ground.swift
//  boredGame
//
//  Created by Lahiru Tholka-Mudalige on 9/27/18.
//  Copyright © 2018 Brigitte Warner. All rights reserved.
//
import SpriteKit
import Foundation

class Brick: SKSpriteNode {
    let width = 30
    let height = 30
}

class Ground {
    var bricks: [Brick]
    var rows: Int
    
    init() {
        bricks = []
        rows = 8
        
        bricks = addBricks(numberOfBricks: 100)
    }
    
    func addBricks(numberOfBricks num: Int) -> [Brick] {
        var bricks: [Brick] = []
        for r in 0..<rows {
            for i in 0..<num {
                let brick = Brick(imageNamed: "groundBrick")
                brick.position = CGPoint(x: -350 + (i * brick.width), y: -455 - (r * brick.height))
                brick.size = CGSize(width: brick.width, height: brick.height)
                bricks.append(brick)
            }
        }
        return bricks
    }
}
