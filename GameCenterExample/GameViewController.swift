//
//  GameViewController.swift
//  GameCenterExample
//
//  Created by Davi Rodrigues Chaves on 8/11/16.
//  Copyright (c) 2016 davichaves. All rights reserved.
//

import UIKit
import SpriteKit
import GameKit

class GameViewController: UIViewController {
    
    /* Short form access to singleton */
    let gameManager = GameManager.sharedInstance
    
    var _leaderboardID = "testLeaderboard"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        authenticateLocalPlayer()

        if let scene = GameScene(fileNamed:"GameScene") {
            // Configure the view.
            let skView = self.view as! SKView
            skView.showsFPS = true
            skView.showsNodeCount = true
            
            /* Sprite Kit applies additional optimizations to improve rendering performance */
            skView.ignoresSiblingOrder = true
            
            /* Set the scale mode to scale to fit the window */
            scene.scaleMode = .AspectFill
            
            skView.presentScene(scene)
        }
    }

    override func shouldAutorotate() -> Bool {
        return true
    }

    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        if UIDevice.currentDevice().userInterfaceIdiom == .Phone {
            return .AllButUpsideDown
        } else {
            return .All
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    func authenticateLocalPlayer() {
        let localPlayer = GKLocalPlayer.localPlayer()
        
        localPlayer.authenticateHandler = {
            viewController, error in
            if viewController != nil {
                self.presentViewController(viewController!, animated: true, completion: nil)
            } else {
                if GKLocalPlayer.localPlayer().authenticated {
                    self.gameManager.gameCenterEnabled = true
                    
                    GKLocalPlayer.localPlayer().loadDefaultLeaderboardIdentifierWithCompletionHandler({
                        leaderboardID, error in
                        if error != nil {
                            print("\(error!.localizedDescription)")
                        } else {
                            self._leaderboardID = leaderboardID!
                        }
                    })
                } else {
                    self.gameManager.gameCenterEnabled = false
                }
            }
        }
    }
    
}
