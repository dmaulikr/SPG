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
    
    
    // These are for all the selected Item stats and all that Jazz
    let enemTl = SKLabelNode(fontNamed: "Chalkduster")
    let enemHPTl = SKLabelNode(fontNamed: "Chalkduster")
    
    
    // Buttons on the bottom Like Adventure and leave and all that jazz
    let attackButton = SKSpriteNode(imageNamed:"play")
    let runButton = SKSpriteNode(imageNamed:"about")
    
    var heroInfo = HeroStats.SIHero
    var adven = Adventure.sharedInst
    var currEnemy = enemy()
    var enemyCounter = 0
    
    var heroTHP = Double(0)
    
    var enemTHP = Double(0)
    override func didMove(to view: SKView) {
        heroTHP = heroInfo.currHealth
        
        bg.size.height = self.size.height
        bg.size.width = self.size.width
        self.bg.position = CGPoint(x: self.frame.midX,y: self.frame.midY)
        self.bg.zPosition = 0
        
        
        self.CharacterTl.text = "Hero"
        self.CharacterTl.fontSize = 24
        self.CharacterTl.fontColor  = UIColor.orange
        self.CharacterTl.position = CGPoint(x: self.frame.midX / 4, y: self.frame.midY + hero.size.height * 1.2)
        self.CharacterTl.zPosition = 1
        
        self.CharacterHPTl.text = "\(heroInfo.currHealth) / \(heroTHP)"
        self.CharacterHPTl.fontSize = 24
        self.CharacterHPTl.fontColor  = UIColor.orange
        self.CharacterHPTl.position = CGPoint(x: self.frame.midX / 4, y: self.frame.midY + hero.size.height * 0.8)
        self.CharacterHPTl.zPosition = 1
        
        self.hero.position = CGPoint(x: self.frame.midX / 4,y: self.frame.midY)
        self.hero.zPosition = 1
        
        currEnemy = adven.monsters[enemyCounter]
        currEnemy.setPositons(xP: Double(Double(self.frame.midX + self.frame.maxX) / 2), yP: Double(self.frame.midY))
        currEnemy.changeColor(nColor: UIColor.gray)
        enemTHP = currEnemy.currHealth
        
        
        self.enemTl.text = currEnemy.name
        self.enemTl.fontSize = 24
        self.enemTl.fontColor  = UIColor.orange
        self.enemTl.position = CGPoint(x: (self.frame.midX + self.frame.maxX) / 2, y: self.frame.midY + hero.size.height * 1.2)
        self.enemTl.zPosition = 1
        
        self.enemHPTl.text = "\(currEnemy.currHealth) / \(enemTHP)"
        self.enemHPTl.fontSize = 24
        self.enemHPTl.fontColor  = UIColor.orange
        self.enemHPTl.position = CGPoint(x: (self.frame.midX + self.frame.maxX) / 2, y: self.frame.midY + hero.size.height * 0.9)
        self.enemHPTl.zPosition = 1
        
        self.InventoryTl.text = "Adventure Time \(heroInfo.currHealth)"
        self.InventoryTl.fontSize = 72
        self.InventoryTl.fontColor  = UIColor.orange
        self.InventoryTl.position = CGPoint(x: self.frame.midX, y: (self.frame.maxY + self.frame.midY) / 2)
        self.InventoryTl.zPosition = 1
        
        
        
        //MARK: Button positions
        self.attackButton.position = CGPoint(x: self.frame.maxX - (attackButton.size.width / 2),y: self.frame.minY + attackButton.size.height / 2)
        attackButton.zPosition = 1
        
        self.runButton.position = CGPoint(x: self.frame.minX + (runButton.size.width / 2),y: self.frame.minY + runButton.size.height / 2)
        runButton.zPosition = 1
        
        self.addChild(enemHPTl)
        self.addChild(enemTl)
        self.addChild(currEnemy.enemyNode)
        self.addChild(self.InventoryTl)
        self.addChild(self.bg)
        self.addChild(self.hero)
        self.addChild(self.CharacterTl)
        self.addChild(self.CharacterHPTl)
        self.addChild(self.attackButton)
        self.addChild(self.runButton)
        
    }
    //MARK: Random Range and all that fun jazz
    func randomRange(min: UInt32,max: UInt32) -> UInt32{
        let range = min..<max
        return range.lowerBound + arc4random_uniform(range.upperBound - range.lowerBound + 1)
    }
    
    //MARK: Touches Began
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch : AnyObject in touches {
            let location = touch.location(in: self)
            // all the difrent buttons
            if self.atPoint(location) == self.runButton{
                
                if (randomRange(min: 0, max: 2) == 1)
                {
                    let scene = PlayScene(size: self.size)
                    let skView = self.view! as SKView
                    skView.ignoresSiblingOrder = true
                    scene.scaleMode = .resizeFill
                    scene.size = skView.bounds.size
                    skView.presentScene(scene)
                    Adventure.sharedInst = Adventure(lvl: Double(Adventure.levelCount))
                }
                else
                {
                    InventoryTl.text = "Could not run away \(heroInfo.currHealth)"
                    heroInfo.gotAttacked(incAttack: currEnemy.currAttack)
                    isHeroDead()
                }
                
            }
            
            if self.atPoint(location) == self.attackButton{
                
                //currEnemy.changeColor(nColor: UIColor.black)
                
                
                if (randomRange(min: 0, max: 1) == 1)
                {
                    heroInfo.gotAttacked(incAttack: currEnemy.currAttack)
                    currEnemy.gotAttacked(incAttack: heroInfo.currAttack)
                    
                    isHeroDead()
                    isEnemyDead()
                    
                    // InventoryTl.text = "HP \(Double(round(100 * heroInfo.currHealth)/100)) E: \(Double(round(100 * currEnemy.currHealth)/100)) "
                    
                }
                else
                {
                    currEnemy.gotAttacked(incAttack: heroInfo.currAttack)
                    isHeroDead()
                    heroInfo.gotAttacked(incAttack: currEnemy.currAttack)
                    isEnemyDead()
                    
                    //InventoryTl.text = "HP \(Double(round(100 * heroInfo.currHealth)/100)) E: \(Double(round(100 * currEnemy.currHealth)/100)) "
                }
            }
            
            
        }
    }
    
    
    func isHeroDead()
    {
        if (heroInfo.currHealth < 0)
        {
            heroInfo.currEXP = 0
            Adventure.sharedInst = Adventure(lvl: Double(Adventure.levelCount))
            let scene = PlayScene(size: self.size)
            let skView = self.view! as SKView
            skView.ignoresSiblingOrder = true
            scene.scaleMode = .resizeFill
            scene.size = skView.bounds.size
            skView.presentScene(scene)
        }
    }
    
    func isEnemyDead()
    {
        if (currEnemy.currHealth < 0)
        {
            heroInfo.gainEXP(EXPgained: Double(currEnemy.expValue))
            enemyCounter = enemyCounter + 1
            
            if (enemyCounter > 3)
            {
                Adventure.levelCount = Adventure.levelCount + 1
                Adventure.sharedInst = Adventure(lvl: Double(Adventure.levelCount))
                
                
                let rewardItem = Items()
                rewardItem.attack =  Double(randomRange(min: UInt32(Adventure.levelCount ), max: UInt32(Adventure.levelCount + 3)))
                rewardItem.defense =  Double(randomRange(min: UInt32(Adventure.levelCount ), max: UInt32(Adventure.levelCount + 5)))
                rewardItem.health =  Double(randomRange(min: UInt32(Adventure.levelCount ), max: UInt32(Adventure.levelCount + 8)))
                rewardItem.name = "The Corner of hope \(Adventure.levelCount)"
                
                Inventory.SIinven.addItem(nItem: rewardItem)
                self.InventoryTl.text = "You won\(heroInfo.currHealth)"
                let scene = PlayScene(size: self.size)
                let skView = self.view! as SKView
                skView.ignoresSiblingOrder = true
                scene.scaleMode = .resizeFill
                scene.size = skView.bounds.size
                skView.presentScene(scene)
            }
            else
            {
                adven.monsters[enemyCounter].changeColor(nColor: UIColor.brown)
                currEnemy = adven.monsters[enemyCounter]
                enemTHP = currEnemy.currHealth
                
                
                self.InventoryTl.text = "New Enemy\(currEnemy.name)"
            }
            
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
        self.CharacterHPTl.text = "\(Double(round(100 * heroInfo.currHealth)/100)) / \(heroTHP)"
        isHeroDead()
        
        self.enemHPTl.text = "\(Double(round(100 * currEnemy.currHealth)/100)) / \(enemTHP)"
        self.enemTl.text = "\(currEnemy.name)"
    }
    
}
