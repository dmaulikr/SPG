//
//  AdventureScene.swift
//  SPG
//
//  Created by Student on 2016-12-01.
//  Copyright © 2016 WestNet. All rights reserved.
//

import Foundation
//
//  PlayScene.swift
//  SPG
//
//  Created by Student on 2016-11-23.
//  Copyright © 2016 WestNet. All rights reserved.
//


import SpriteKit

// This is the games scene and all that jazz
class AdventureScene : SKScene, SKPhysicsContactDelegate, UITextFieldDelegate
{
    
    // The Background
    let bg = SKSpriteNode(imageNamed:"bg")
    
    // The hero / Square
    let hero = SKSpriteNode(imageNamed:"square")
    
    // Title of the screen
    let InventoryTl = SKLabelNode(fontNamed: "Chalkduster")
    
    // These are the character labels and all that
    let CharacterTl = SKLabelNode(fontNamed: "Chalkduster")
    let CharacterHPTl = SKLabelNode(fontNamed: "Chalkduster")
    let CharacterAttTl = SKLabelNode(fontNamed: "Chalkduster")
    let CharacterDefTl = SKLabelNode(fontNamed: "Chalkduster")
    
    // These are for all the selected Item stats and all that Jazz
    let ItemTl = SKLabelNode(fontNamed: "Chalkduster")
    let ItemHPTl = SKLabelNode(fontNamed: "Chalkduster")
    let ItemAttTl = SKLabelNode(fontNamed: "Chalkduster")
    let ItemDefTl = SKLabelNode(fontNamed: "Chalkduster")
    
    // Buttons on the bottom Like Adventure and leave and all that jazz
    let adventureButton = SKSpriteNode(imageNamed:"play")
    let backButton = SKSpriteNode(imageNamed:"about")
    
    var heroInfo = HeroStats()
    
    override func didMove(to view: SKView) {
        
        bg.size.height = self.size.height
        bg.size.width = self.size.width
        self.bg.position = CGPoint(x: self.frame.midX,y: self.frame.midY)
        self.bg.zPosition = 0
        
        self.hero.position = CGPoint(x: self.frame.midX / 4,y: self.frame.midY)
        self.hero.zPosition = 1
        
        self.InventoryTl.text = "Adventure Time"
        self.InventoryTl.fontSize = 72
        self.InventoryTl.fontColor  = UIColor.orange
        self.InventoryTl.position = CGPoint(x: self.frame.midX, y: (self.frame.maxY + self.frame.midY) / 2)
        self.InventoryTl.zPosition = 1
        
        self.CharacterTl.text = "Hero Stats"
        self.CharacterTl.fontSize = 32
        self.CharacterTl.fontColor  = UIColor.orange
        self.CharacterTl.position = CGPoint(x: self.frame.midX / 2, y: (self.frame.maxY + self.frame.midY) / 2.65)
        self.CharacterTl.zPosition = 1
        
        self.CharacterHPTl.text = "Health: \(heroInfo.currHealth)"
        self.CharacterHPTl.fontSize = 24
        self.CharacterHPTl.fontColor  = UIColor.orange
        self.CharacterHPTl.position = CGPoint(x: self.frame.midX / 2, y: (self.frame.maxY + self.frame.midY) / 2.95)
        self.CharacterHPTl.zPosition = 1
        
        self.CharacterAttTl.text = "Attack: \(heroInfo.currAttack)"
        self.CharacterAttTl.fontSize = 24
        self.CharacterAttTl.fontColor  = UIColor.orange
        self.CharacterAttTl.position = CGPoint(x: self.frame.midX / 2, y: (self.frame.maxY + self.frame.midY) / 3.25)
        self.CharacterAttTl.zPosition = 1
        
        self.CharacterDefTl.text = "Defense: \(heroInfo.currDefense)"
        self.CharacterDefTl.fontSize = 24
        self.CharacterDefTl.fontColor  = UIColor.orange
        self.CharacterDefTl.position = CGPoint(x: self.frame.midX / 2, y: (self.frame.maxY + self.frame.midY) / 3.55)
        self.CharacterDefTl.zPosition = 1
        
        self.ItemTl.text = "Selected Item Stats"
        self.ItemTl.fontSize = 32
        self.ItemTl.fontColor  = UIColor.orange
        self.ItemTl.position = CGPoint(x: self.frame.midX / 2, y: (self.frame.maxY + self.frame.midY) / 4)
        self.ItemTl.zPosition = 1
        
        self.ItemHPTl.text = "Health: \(heroInfo.currHealth)"
        self.ItemHPTl.fontSize = 24
        self.ItemHPTl.fontColor  = UIColor.orange
        self.ItemHPTl.position = CGPoint(x: self.frame.midX / 2, y: (self.frame.maxY + self.frame.midY) / 4.8)
        self.ItemHPTl.zPosition = 1
        
        self.ItemAttTl.text = "Attack: \(heroInfo.currAttack)"
        self.ItemAttTl.fontSize = 24
        self.ItemAttTl.fontColor  = UIColor.orange
        self.ItemAttTl.position = CGPoint(x: self.frame.midX / 2, y: (self.frame.maxY + self.frame.midY) / 5.6)
        self.ItemAttTl.zPosition = 1
        
        self.ItemDefTl.text = "Defense: \(heroInfo.currDefense)"
        self.ItemDefTl.fontSize = 24
        self.ItemDefTl.fontColor  = UIColor.orange
        self.ItemDefTl.position = CGPoint(x: self.frame.midX / 2, y: (self.frame.maxY + self.frame.midY) / 6.6)
        self.ItemDefTl.zPosition = 1
        
        self.adventureButton.position = CGPoint(x: self.frame.midX ,y: self.frame.midY)
        adventureButton.zPosition = 1
        
        self.backButton.position = CGPoint(x: self.frame.midX ,y: self.frame.minY / 3)
        backButton.zPosition = 1
        
        self.addChild(self.CharacterTl)
        self.addChild(self.CharacterHPTl)
        self.addChild(self.CharacterAttTl)
        self.addChild(self.CharacterDefTl)
        
        
        self.addChild(self.ItemTl)
        self.addChild(self.ItemHPTl)
        self.addChild(self.ItemAttTl)
        self.addChild(self.ItemDefTl)
        
        self.addChild(self.InventoryTl)
        self.addChild(self.bg)
        self.addChild(self.hero)
        
        self.addChild(self.adventureButton)
        self.addChild(self.backButton)
        
    }
    //MARK: Touches Began
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch : AnyObject in touches {
            let location = touch.location(in: self)
            // all the difrent buttons
            if self.atPoint(location) == self.backButton{
                let scene = GameScene(size: self.size)
                let skView = self.view! as SKView
                skView.ignoresSiblingOrder = true
                scene.scaleMode = .resizeFill
                scene.size = skView.bounds.size
                skView.presentScene(scene)
            }
            
            if self.atPoint(location) == self.adventureButton{
                let scene = GameScene(size: self.size)
                let skView = self.view! as SKView
                skView.ignoresSiblingOrder = true
                scene.scaleMode = .resizeFill
                scene.size = skView.bounds.size
                skView.presentScene(scene)
            }
            
            
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
        
        
        
        
    }
    
}
