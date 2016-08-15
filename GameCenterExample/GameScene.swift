//
//  GameScene.swift
//  GameCenterExample
//
//  Created by Davi Rodrigues Chaves on 8/11/16.
//  Copyright (c) 2016 davichaves. All rights reserved.
//

import SpriteKit
import GameKit

class GameScene: SKScene, GKGameCenterControllerDelegate {
    
    var increaseButton: MSButtonNode!
    var decreaseButton: MSButtonNode!
    var submitButton: MSButtonNode!
    var gameCenterButtton: MSButtonNode!
    var score = 0
    var scoreLabel: SKLabelNode!
    
    /* Short form access to singleton */
    let gameManager = GameManager.sharedInstance
    
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
            self.reportScore(self.score)
        }
        
        gameCenterButtton = self.childNodeWithName("gameCenterButton") as! MSButtonNode
        
        gameCenterButtton.selectedHandler = {
            self.showLeader()
        }
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
       /* Called when a touch begins */
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
    
    //shows leaderboard screen
    func showLeader() {
        let viewControllerVar = self.view?.window?.rootViewController
        let gKGCViewController = GKGameCenterViewController()
        gKGCViewController.gameCenterDelegate = self
        viewControllerVar?.presentViewController(gKGCViewController, animated: true, completion: nil)
    }
    func gameCenterViewControllerDidFinish(gameCenterViewController: GKGameCenterViewController) {
        gameCenterViewController.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func reportScore(duration: Int) {
        if !gameManager.gameCenterEnabled {
            return
        }
        
        let score = GKScore(leaderboardIdentifier: "testLeaderboard")
        score.value = Int64(duration)
        
        GKScore.reportScores([score], withCompletionHandler: {
            error -> Void in
        })
    }
}
