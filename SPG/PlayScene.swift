//
//  PlayScene.swift
//  SPG
//
//  Created by Student on 2016-11-23.
//  Copyright © 2016 WestNet. All rights reserved.
//


import SpriteKit

// This is the games scene and all that jazz
class PlayScene : SKScene, SKPhysicsContactDelegate, UITextFieldDelegate
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
    let CharacterLvlTl = SKLabelNode(fontNamed: "Chalkduster")
    let CharacterExpTl = SKLabelNode(fontNamed: "Chalkduster")
    
    // These are for all the selected Item stats and all that Jazz
    let ItemTl = SKLabelNode(fontNamed: "Chalkduster")
    let ItemHPTl = SKLabelNode(fontNamed: "Chalkduster")
    let ItemAttTl = SKLabelNode(fontNamed: "Chalkduster")
    let ItemDefTl = SKLabelNode(fontNamed: "Chalkduster")
    let ItemNameTl = SKLabelNode(fontNamed: "Chalkduster")
    // Buttons on the bottom Like Adventure and leave and all that jazz
    let adventureButton = SKSpriteNode(imageNamed:"play")
    let backButton = SKSpriteNode(imageNamed:"about")
    
    var inven = Inventory.SIinven
    
    
    
    
    var heroInfo = HeroStats()
    
    override func didMove(to view: SKView) {
        heroInfo = HeroStats.SIHero
        heroInfo.updateStats()
        bg.size.height = self.size.height
        bg.size.width = self.size.width
        self.bg.position = CGPoint(x: self.frame.midX,y: self.frame.midY)
        self.bg.zPosition = 0
        
        self.hero.position = CGPoint(x: self.frame.midX / 4,y: self.frame.midY)
        self.hero.zPosition = 1
        
        self.InventoryTl.text = "Invertory"
        self.InventoryTl.fontSize = 72
        self.InventoryTl.fontColor  = UIColor.orange
        self.InventoryTl.position = CGPoint(x: self.frame.midX, y: (self.frame.maxY + self.frame.midY) / 2)
        self.InventoryTl.zPosition = 1
        
        self.CharacterTl.text = "Hero Stats"
        self.CharacterTl.fontSize = 32
        self.CharacterTl.fontColor  = UIColor.orange
        self.CharacterTl.position = CGPoint(x: self.frame.midX / 2, y: (self.frame.maxY + self.frame.midY) / 2.35)
        self.CharacterTl.zPosition = 1
        
        self.CharacterLvlTl.text = "Level: \(heroInfo.level)"
        self.CharacterLvlTl.fontSize = 24
        self.CharacterLvlTl.fontColor  = UIColor.orange
        self.CharacterLvlTl.position = CGPoint(x: self.frame.midX / 2, y: (self.frame.maxY + self.frame.midY) / 2.55)
        self.CharacterLvlTl.zPosition = 1
        
        self.CharacterExpTl.text = "EXP: \(heroInfo.currEXP) / \(heroInfo.needEXP)"
        self.CharacterExpTl.fontSize = 24
        self.CharacterExpTl.fontColor  = UIColor.orange
        self.CharacterExpTl.position = CGPoint(x: self.frame.midX / 2, y: (self.frame.maxY + self.frame.midY) / 2.75)
        self.CharacterExpTl.zPosition = 1
        
        self.CharacterHPTl.text = "Health: \(Double(round(100 * heroInfo.currHealth)/100))"
        self.CharacterHPTl.fontSize = 24
        self.CharacterHPTl.fontColor  = UIColor.orange
        self.CharacterHPTl.position = CGPoint(x: self.frame.midX / 2, y: (self.frame.maxY + self.frame.midY) / 2.95)
        self.CharacterHPTl.zPosition = 1
        
        self.CharacterAttTl.text = "Attack: \(Double(round(100 * heroInfo.currAttack)/100))"
        self.CharacterAttTl.fontSize = 24
        self.CharacterAttTl.fontColor  = UIColor.orange
        self.CharacterAttTl.position = CGPoint(x: self.frame.midX / 2, y: (self.frame.maxY + self.frame.midY) / 3.25)
        self.CharacterAttTl.zPosition = 1
        
        self.CharacterDefTl.text = "Defense: \(Double(round(100 * heroInfo.currDefense)/100))"
        self.CharacterDefTl.fontSize = 24
        self.CharacterDefTl.fontColor  = UIColor.orange
        self.CharacterDefTl.position = CGPoint(x: self.frame.midX / 2, y: (self.frame.maxY + self.frame.midY) / 3.55)
        self.CharacterDefTl.zPosition = 1
        
        self.ItemTl.text = "Selected Item Stats"
        self.ItemTl.fontSize = 32
        self.ItemTl.fontColor  = UIColor.orange
        self.ItemTl.position = CGPoint(x: self.frame.midX / 2, y: (self.frame.maxY + self.frame.midY) / 4)
        self.ItemTl.zPosition = 1
        
        self.ItemHPTl.text = "Health: 0"
        self.ItemHPTl.fontSize = 24
        self.ItemHPTl.fontColor  = UIColor.orange
        self.ItemHPTl.position = CGPoint(x: self.frame.midX / 2, y: (self.frame.maxY + self.frame.midY) / 4.8)
        self.ItemHPTl.zPosition = 1
        
        self.ItemAttTl.text = "Attack: 0"
        self.ItemAttTl.fontSize = 24
        self.ItemAttTl.fontColor  = UIColor.orange
        self.ItemAttTl.position = CGPoint(x: self.frame.midX / 2, y: (self.frame.maxY + self.frame.midY) / 5.6)
        self.ItemAttTl.zPosition = 1
        
        self.ItemDefTl.text = "Defense: 0"
        self.ItemDefTl.fontSize = 24
        self.ItemDefTl.fontColor  = UIColor.orange
        self.ItemDefTl.position = CGPoint(x: self.frame.midX / 2, y: (self.frame.maxY + self.frame.midY) / 6.6)
        self.ItemDefTl.zPosition = 1
        
        self.ItemNameTl.text = "Name: "
        self.ItemNameTl.fontSize = 24
        self.ItemNameTl.fontColor  = UIColor.orange
        self.ItemNameTl.position = CGPoint(x: self.frame.midX / 2, y: (self.frame.maxY + self.frame.midY) / 7.6)
        self.ItemNameTl.zPosition = 1
        
        
        //MARK: Button positions
        self.adventureButton.position = CGPoint(x: self.frame.maxX - (adventureButton.size.width / 2),y: self.frame.minY + adventureButton.size.height / 2)
        adventureButton.zPosition = 1
        
        self.backButton.position = CGPoint(x: self.frame.minX + (backButton.size.width / 2),y: self.frame.minY + backButton.size.height / 2)
        backButton.zPosition = 1
        
        //MARK: Drawing the inventory and all that jazz
        var i: Double
        i = 0
        var j: Double
        j = 0
        for item  in inven.itemList
        {
            item.setPositons(xP: Double(self.frame.midX) + ((item.xSize + 20) * (i)), yP: (Double(self.frame.midY) + (item.xSize + 20)) - (item.xSize + 20) * j )
            i = i + 1
            
            self.addChild(item.itemNode)
            if (i == 5)
            {
                j = j + 1
                i = 0
            }
            if (j == 3)
            {
                break
            }
        }
        
        
        //MARK: Adding player Items
        
        heroInfo.item1.setPositons(xP: Double(self.frame.midX) + ((heroInfo.item1.xSize + 20) * (0)), yP: (Double(self.frame.midY) + (heroInfo.item1.xSize + 20)) - (heroInfo.item1.xSize + 20) * 3 )
        heroInfo.item2.setPositons(xP: Double(self.frame.midX) + ((heroInfo.item2.xSize + 20) * (1)), yP: (Double(self.frame.midY) + (heroInfo.item3.xSize + 20)) - (heroInfo.item2.xSize + 20) * 3 )
        heroInfo.item3.setPositons(xP: Double(self.frame.midX) + ((heroInfo.item3.xSize + 20) * (2)), yP: (Double(self.frame.midY) + (heroInfo.item3.xSize + 20)) - (heroInfo.item3.xSize + 20) * 3 )
        heroInfo.item1.changeColor(nColor: UIColor.green)
        heroInfo.item2.changeColor(nColor: UIColor.green)
        
        heroInfo.item3.changeColor(nColor: UIColor.green)
        
        
        self.addChild(self.CharacterTl)
        self.addChild(self.CharacterHPTl)
        self.addChild(self.CharacterAttTl)
        self.addChild(self.CharacterDefTl)
        self.addChild(self.CharacterLvlTl)
        self.addChild(self.CharacterExpTl)
        
        self.addChild(self.heroInfo.item1.itemNode)
        self.addChild(self.heroInfo.item2.itemNode)
        self.addChild(self.heroInfo.item3.itemNode)
        
        self.addChild(self.ItemTl)
        self.addChild(self.ItemHPTl)
        self.addChild(self.ItemAttTl)
        self.addChild(self.ItemDefTl)
        self.addChild(self.ItemNameTl)
        
        self.addChild(self.InventoryTl)
        self.addChild(self.bg)
        self.addChild(self.hero)
        
        self.addChild(self.adventureButton)
        self.addChild(self.backButton)
        
    }
    //MARK: Touches Began
    var itemSwap = Items()
    var itemSwapper = false
    var itemNum = 0
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch : AnyObject in touches {
            let location = touch.location(in: self)
            // all the difrent buttons
            if self.atPoint(location) == self.backButton{
                let scene = AboutScene(size: self.size)
                let skView = self.view! as SKView
                skView.ignoresSiblingOrder = true
                scene.scaleMode = .resizeFill
                scene.size = skView.bounds.size
                skView.presentScene(scene)
            }
            
            //MARK: Adventure Button
            if self.atPoint(location) == self.adventureButton{
                let scene = AdventureScene(size: self.size)
                HeroStats.SIHero = heroInfo
                let skView = self.view! as SKView
                skView.ignoresSiblingOrder = true
                scene.scaleMode = .resizeFill
                scene.size = skView.bounds.size
                skView.presentScene(scene)
            }
            
            if self.atPoint(location) == self.heroInfo.item1.itemNode{
                heroInfo.item1.changeColor(nColor: UIColor.black)
                
                heroInfo.item3.changeColor(nColor: UIColor.green)
                heroInfo.item2.changeColor(nColor: UIColor.green)
                
                if (itemSwapper == true)
                {
                    inven.itemList[itemNum].name = heroInfo.item1.name
                    inven.itemList[itemNum].attack = heroInfo.item1.attack
                    inven.itemList[itemNum].defense = heroInfo.item1.defense
                    inven.itemList[itemNum].health = heroInfo.item1.health
                    itemSwapper = false
                    heroInfo.item1.name = itemSwap.name
                    heroInfo.item1.attack = itemSwap.attack
                    heroInfo.item1.defense = itemSwap.defense
                    heroInfo.item1.health = itemSwap.health
                    itemNum = -1
                    heroInfo.updateStats()
                    self.CharacterHPTl.text = "Health: \(heroInfo.currHealth)"
                    self.CharacterAttTl.text = "Attack: \(heroInfo.currAttack)"
                    self.CharacterDefTl.text = "Defense: \(heroInfo.currDefense)"
                    
                }
                self.ItemHPTl.text = "Health: \(heroInfo.item1.health)"
                self.ItemAttTl.text = "Attack: \(heroInfo.item1.attack)"
                self.ItemDefTl.text = "Defense: \(heroInfo.item1.defense)"
                self.ItemNameTl.text = "Name: \(heroInfo.item1.name)"
            }
            
            if self.atPoint(location) == self.heroInfo.item2.itemNode{
                heroInfo.item2.changeColor(nColor: UIColor.black)
                
                heroInfo.item1.changeColor(nColor: UIColor.green)
                heroInfo.item3.changeColor(nColor: UIColor.green)
                
                if (itemSwapper == true)
                {
                    inven.itemList[itemNum].name = heroInfo.item2.name
                    inven.itemList[itemNum].attack = heroInfo.item2.attack
                    inven.itemList[itemNum].defense = heroInfo.item2.defense
                    inven.itemList[itemNum].health = heroInfo.item2.health
                    itemSwapper = false
                    heroInfo.item2.name = itemSwap.name
                    heroInfo.item2.attack = itemSwap.attack
                    heroInfo.item2.defense = itemSwap.defense
                    heroInfo.item2.health = itemSwap.health
                    itemNum = -1
                    heroInfo.updateStats()
                    self.CharacterHPTl.text = "Health: \(heroInfo.currHealth)"
                    self.CharacterAttTl.text = "Attack: \(heroInfo.currAttack)"
                    self.CharacterDefTl.text = "Defense: \(heroInfo.currDefense)"
                }
                self.ItemHPTl.text = "Health: \(heroInfo.item2.health)"
                self.ItemAttTl.text = "Attack: \(heroInfo.item2.attack)"
                self.ItemDefTl.text = "Defense: \(heroInfo.item2.defense)"
                self.ItemNameTl.text = "Name: \(heroInfo.item2.name)"
            }
            
            if self.atPoint(location) == self.heroInfo.item3.itemNode{
                heroInfo.item3.changeColor(nColor: UIColor.black)
                
                heroInfo.item1.changeColor(nColor: UIColor.green)
                heroInfo.item2.changeColor(nColor: UIColor.green)
                
                if (itemSwapper == true)
                {
                    inven.itemList[itemNum].name = heroInfo.item3.name
                    inven.itemList[itemNum].attack = heroInfo.item3.attack
                    inven.itemList[itemNum].defense = heroInfo.item3.defense
                    inven.itemList[itemNum].health = heroInfo.item3.health
                    itemSwapper = false
                    heroInfo.item3.name = itemSwap.name
                    heroInfo.item3.attack = itemSwap.attack
                    heroInfo.item3.defense = itemSwap.defense
                    heroInfo.item3.health = itemSwap.health
                    itemNum = -1
                    heroInfo.updateStats()
                    self.CharacterHPTl.text = "Health: \(heroInfo.currHealth)"
                    self.CharacterAttTl.text = "Attack: \(heroInfo.currAttack)"
                    self.CharacterDefTl.text = "Defense: \(heroInfo.currDefense)"
                }
                self.ItemHPTl.text = "Health: \(heroInfo.item3.health)"
                self.ItemAttTl.text = "Attack: \(heroInfo.item3.attack)"
                self.ItemDefTl.text = "Defense: \(heroInfo.item3.defense)"
                self.ItemNameTl.text = "Name: \(heroInfo.item3.name)"
            }
            
            
            
            var k = 0
            for item  in inven.itemList
            {
                if self.atPoint(location) == item.itemNode {
                    item.changeColor(nColor: UIColor.black)
                    self.ItemHPTl.text = "Health: \(item.health)"
                    self.ItemAttTl.text = "Attack: \(item.attack)"
                    self.ItemDefTl.text = "Defense: \(item.defense)"
                    self.ItemNameTl.text = "Name: \(item.name)"
                    heroInfo.item1.changeColor(nColor: UIColor.green)
                    heroInfo.item2.changeColor(nColor: UIColor.green)
                    heroInfo.item3.changeColor(nColor: UIColor.green)
                    
                    itemSwap.name = item.name
                    itemSwap.attack = item.attack
                    itemSwap.defense = item.defense
                    itemSwap.health = item.health
                    itemSwapper = true
                    itemNum = k
                    
                }
                else
                {
                    item.changeColor(nColor: UIColor.orange)
                    
                }
                k = k + 1
                
            }
            
            
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
        
        
        
        
    }
    
}
