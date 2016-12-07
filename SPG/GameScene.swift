//
//  GameScene.swift
//  SPG
//
//  Created by Student on 2016-11-23.
//  Copyright © 2016 WestNet. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    let bg = SKSpriteNode(imageNamed:"bg")
    let playButton = SKSpriteNode(imageNamed:"play")
    let aboutButton = SKSpriteNode(imageNamed:"about")
    let instructionButton = SKSpriteNode(imageNamed:"tutoriel")
    let leaderboardButton = SKSpriteNode(imageNamed:"leaderboard")
    let Title = SKLabelNode(fontNamed: "Chalkduster")
    
    override func didMove(to view: SKView) {
        SoundPlayer.sharedHelper.playBackgroundMusic()
        //Mark: setting up the ground stuff
        //self.bg.anchorPoint = CGPoint(x: 0.5,y: 0.5)
        bg.size.height = self.size.height
        bg.size.width = self.size.width
        self.bg.position = CGPoint(x: self.frame.midX,y: self.frame.midY)
        self.bg.zPosition = 0
        
        self.playButton.position = CGPoint(x: self.frame.midX ,y: self.frame.midY)
        playButton.zPosition = 1
        
        self.aboutButton.position = CGPoint(x: self.frame.midX ,y: self.frame.minY / 3)
        aboutButton.zPosition = 1
        
        self.instructionButton.position = CGPoint(x: self.frame.midX ,y: self.frame.minY / 1.5)
        instructionButton.zPosition = 1
        
        self.Title.text = "Shape Playing Game"
        self.Title.fontSize = 72
        self.Title.fontColor  = UIColor.orange
        self.Title.position = CGPoint(x: self.frame.midX, y: self.frame.maxY / 2)
        self.Title.zPosition = 1
        
        self.addChild(Title)
        self.addChild(self.bg)
        self.addChild(self.aboutButton)
        self.addChild(self.playButton)
        self.addChild(self.instructionButton)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch : AnyObject in touches {
            let location = touch.location(in: self)
            // all the difrent buttons
            if self.atPoint(location) == self.playButton{
                let scene = MainMenuScene(size: self.size)
                let skView = self.view! as SKView
                skView.ignoresSiblingOrder = true
                scene.scaleMode = .resizeFill
                scene.size = skView.bounds.size
                skView.presentScene(scene)
            }
            if self.atPoint(location) == self.aboutButton{
                let scene = AboutScene(size: self.size)
                let skView = self.view! as SKView
                skView.ignoresSiblingOrder = true
                scene.scaleMode = .resizeFill
                scene.size = skView.bounds.size
                skView.presentScene(scene)
            }
            if self.atPoint(location) == self.instructionButton{
                let scene = InstructionScene(size: self.size)
                let skView = self.view! as SKView
                skView.ignoresSiblingOrder = true
                scene.scaleMode = .resizeFill
                scene.size = skView.bounds.size
                skView.presentScene(scene)
            }

        }
    }

    
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
