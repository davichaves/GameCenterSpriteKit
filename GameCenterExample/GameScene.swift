//
//  GameScene.swift
//  GameCenterExample
//
//  Created by Davi Rodrigues Chaves on 8/11/16.
//  Copyright (c) 2016 davichaves. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    /* UI Connections */
    var increaseButton: MSButtonNode!
    var decreaseButton: MSButtonNode!
    var submitButton: MSButtonNode!
    
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        
        /* Set UI connections */
        increaseButton = self.childNodeWithName("backButton") as! MSButtonNode
        
        /* Setup restart button selection handler */
        increaseButton.selectedHandler = {
            
        }
        
        /* Set UI connections */
        decreaseButton = self.childNodeWithName("backButton") as! MSButtonNode
        
        /* Setup restart button selection handler */
        decreaseButton.selectedHandler = {
            
        }
        
        submitButton = self.childNodeWithName("backButton") as! MSButtonNode
        
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
