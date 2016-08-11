//
//  GameScene.swift
//  GameCenterExample
//
//  Created by Davi Rodrigues Chaves on 8/11/16.
//  Copyright (c) 2016 davichaves. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    var increaseButton: MSButtonNode!
    var decreaseButton: MSButtonNode!
    var submitButton: MSButtonNode!
    var score = 0
    var scoreLabel: SKLabelNode!
    
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        
        scoreLabel = self.childNodeWithName("scoreLabel") as! SKLabelNode
        self.scoreLabel.text = "Score: \(self.score)"
        
        /* Set UI connections */
        increaseButton = self.childNodeWithName("increaseButton") as! MSButtonNode
        
        /* Setup restart button selection handler */
        increaseButton.selectedHandler = {
            self.score+=1
            self.scoreLabel.text = "Score: \(self.score)"
        }
        
        /* Set UI connections */
        decreaseButton = self.childNodeWithName("decreaseButton") as! MSButtonNode
        
        /* Setup restart button selection handler */
        decreaseButton.selectedHandler = {
            self.score-=1
            self.scoreLabel.text = "Score: \(self.score)"
        }
        
        submitButton = self.childNodeWithName("submitButton") as! MSButtonNode
        
        submitButton.selectedHandler = {
            
        }
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
       /* Called when a touch begins */
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
