//
//  Ground.swift
//  boredGame
//
//  Created by Lahiru Tholka-Mudalige on 9/27/18.
//  Copyright © 2018 Brigitte Warner. All rights reserved.
//
import SpriteKit
import Foundation

class Ground {
    var bricks: [Brick]
    var brickRows: Int
    var pipeList: [Pipe]
    
    init() {
        bricks = []
        brickRows = 8
        pipeList = []
        
        bricks = addBricks(numberOfBricks: 100)
        pipeList = addPipes(numberOfPipes: 5)
    }
    
    func addBricks(numberOfBricks num: Int) -> [Brick] {
        var bricks: [Brick] = []
        for r in 0..<brickRows {
            for i in 0..<num {
                let brick = Brick(imageNamed: "groundBrick")
                brick.position = CGPoint(x: -350 + (i * brick.width), y: -455 - (r * brick.height))
                brick.size = CGSize(width: brick.width, height: brick.height)
                brick.physicsBody = SKPhysicsBody(rectangleOf: brick.size)
                brick.physicsBody?.isDynamic = false
                
                bricks.append(brick)
            }
        }
        return bricks
    }
    
    func addPipes(numberOfPipes: Int) -> [Pipe] {
        var pipes: [Pipe] = []
        
        for i in 0..<numberOfPipes {
            let pipe = Pipe(imageNamed: "warp_pipe_small")
            pipe.size = CGSize(width: pipe.width, height: pipe.height)
            pipe.position = CGPoint(x: 100 + (i * 400), y: -390)
            pipe.physicsBody = SKPhysicsBody(rectangleOf: pipe.size)
            pipe.physicsBody?.isDynamic = false
            pipes.append(pipe)
        }
        
        return pipes
    }
}
