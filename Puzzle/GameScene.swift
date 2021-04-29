//
//  GameScene.swift
//  Puzzle
//
//  Created by Даниил  on 31.03.2021.
//

import SpriteKit
import SwiftUI


class GameScene: SKScene, SKPhysicsContactDelegate {
    
    private var currentNode: SKNode?
    private var currentOffSet: CGPoint?
    
    private let singleTapGestureRecognizer = UITapGestureRecognizer()
    private let doubleTapGestureRecognizer = UITapGestureRecognizer()
    private var panRec = UIPanGestureRecognizer()
    private var rotateRec = UIRotationGestureRecognizer()

    private var rotateGestureAnchorRotation: CGFloat?
    var panRecAnchorPoint: CGPoint?
    
    private var isPartMove: Bool = false
    
    
    var part1 = SKSpriteNode()
    var part2 = SKSpriteNode()
    var buttonRect = SKSpriteNode()
    var background = SKSpriteNode()
    

    override func didMove(to view: SKView) {
        makePart()
        
        rotateRec.addTarget(self, action: #selector(GameScene.rotatedView (_:)))

        
        self.view!.addGestureRecognizer(rotateRec)
        physicsWorld.contactDelegate = self
        
        
    }
    
    func makePart(){
        part1 = (self.childNode(withName: "Part") as? SKSpriteNode)!
        part2 = (self.childNode(withName: "Part") as? SKSpriteNode)!
      
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let location = touch.location(in: self)
            let touchedNodes = self.nodes(at: location)
            for node in touchedNodes.reversed() {
                if node.name == "Part" {
                    self.currentNode = node
                    self.currentOffSet = CGPoint(x: (currentNode?.position.x)! - location.x, y: (currentNode?.position.y)! - location.y)
                    print(location, currentNode?.position, currentOffSet)
                    
                    isPartMove = true
                }
            }
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if isPartMove {
            if let touch = touches.first, let node = self.currentNode {
                let touchLocation = touch.location(in: self)
                node.position = CGPoint(x: touchLocation.x + currentOffSet!.x, y: touchLocation.y + currentOffSet!.y)
                }
            }
        }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        isPartMove = false
       // self.currentNode = nil
    }
   
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        isPartMove = false
       // self.currentNode = nil
    }
    @objc func rotatedView(_ sender: UIRotationGestureRecognizer){
        let node = self.currentNode
        
        if (sender.state == .changed){
            node?.zRotation = -sender.rotation
        }
        if (sender.state == .ended){
            node?.zRotation = -sender.rotation
        }
        
    }
    
   
}


