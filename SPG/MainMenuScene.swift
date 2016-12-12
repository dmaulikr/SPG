//
//  MainMenuScene.swift
//  SPG
//
//  Created by Student on 2016-12-07.
//  Copyright © 2016 WestNet. All rights reserved.
//

import Foundation
import SpriteKit
class MainMenuScene : SKScene {
    
    // Font Sizes
    let sceneTitleSize = CGFloat(72)
    let informationTitleSize = CGFloat(32)
    let informationSize = CGFloat(24)
    
    var heroInfoBoxX = CGFloat(0)
    var heroInfoBoxY = CGFloat(0)
    var spaceBetweenInfo = CGFloat(0)
    
    var itemInfoBoxX = CGFloat(0)
    var itemInfoBoxY = CGFloat(0)
    var spaceBetweenItemInfoY = CGFloat(0)
    var spaceBetweenItemInfoX = CGFloat(0)
    
    // Background images and all that
    let bg = SKSpriteNode(imageNamed:"bg")
    
    // Buttons and all that fun stuff
    let inventoryButton = SKSpriteNode(imageNamed:"play")
    let shopButton = SKSpriteNode(imageNamed:"about")
    let reagantButton = SKSpriteNode(imageNamed:"tutoriel")
    let upgradeButton = SKSpriteNode(imageNamed:"leaderboard")
    let trainButton = SKSpriteNode(imageNamed:"tutoriel")
    let adventureButton = SKSpriteNode(imageNamed:"leaderboard")
    
    // Labels and all that fun stuff
    let Title = SKLabelNode(fontNamed: "Chalkduster")
    let goldTl = SKLabelNode(fontNamed: "Chalkduster")
    // These are the character labels and all that
    let CharacterTl = SKLabelNode(fontNamed: "Chalkduster")
    let CharacterHPTl = SKLabelNode(fontNamed: "Chalkduster")
    let CharacterAttTl = SKLabelNode(fontNamed: "Chalkduster")
    let CharacterDefTl = SKLabelNode(fontNamed: "Chalkduster")
    let CharacterSpdTl = SKLabelNode(fontNamed: "Chalkduster")
    let CharacterLvlTl = SKLabelNode(fontNamed: "Chalkduster")
    let CharacterExpTl = SKLabelNode(fontNamed: "Chalkduster")
    
    // These are all the labels for the players Items and all the fun stuff WEEE
    let Item1Tl = SKLabelNode(fontNamed: "Chalkduster")
    let Item1HPTl = SKLabelNode(fontNamed: "Chalkduster")
    let Item1AttTl = SKLabelNode(fontNamed: "Chalkduster")
    let Item1DefTl = SKLabelNode(fontNamed: "Chalkduster")
    let Item1SpdTl = SKLabelNode(fontNamed: "Chalkduster")
    let Item1RarityTl = SKLabelNode(fontNamed: "Chalkduster")
    let Item1LvlTl = SKLabelNode(fontNamed: "Chalkduster")
    let Item1DescTl = SKLabelNode(fontNamed: "Chalkduster")
    
    
    // These are for all the selected Item stats and all that Jazz
    let Item2Tl = SKLabelNode(fontNamed: "Chalkduster")
    let Item2HPTl = SKLabelNode(fontNamed: "Chalkduster")
    let Item2AttTl = SKLabelNode(fontNamed: "Chalkduster")
    let Item2DefTl = SKLabelNode(fontNamed: "Chalkduster")
    let Item2SpdTl = SKLabelNode(fontNamed: "Chalkduster")
    let Item2RarityTl = SKLabelNode(fontNamed: "Chalkduster")
    let Item2LvlTl = SKLabelNode(fontNamed: "Chalkduster")
    let Item2DescTl = SKLabelNode(fontNamed: "Chalkduster")
    
    
    // These are for all the selected Item stats and all that Jazz
    let Item3Tl = SKLabelNode(fontNamed: "Chalkduster")
    let Item3HPTl = SKLabelNode(fontNamed: "Chalkduster")
    let Item3AttTl = SKLabelNode(fontNamed: "Chalkduster")
    let Item3DefTl = SKLabelNode(fontNamed: "Chalkduster")
    let Item3SpdTl = SKLabelNode(fontNamed: "Chalkduster")
    let Item3RarityTl = SKLabelNode(fontNamed: "Chalkduster")
    let Item3LvlTl = SKLabelNode(fontNamed: "Chalkduster")
    let Item3DescTl = SKLabelNode(fontNamed: "Chalkduster")
    
    // The hero / Square
    let hero = SKSpriteNode(imageNamed:"square")
    
    
    var inven = Inventory.SIinven
    var heroInfo = HeroStats()
    
    
    override func didMove(to view: SKView) {
        //MARK: this si setting the predetermined postion for the herobox
        
        // Setting the info hero box positions and all that
        heroInfoBoxX = (self.frame.midX )
        heroInfoBoxY = (self.frame.maxY - inventoryButton.size.height)
        spaceBetweenInfo = -30
        
        // Setting the Item info box postions and all that Zazz
        
        itemInfoBoxX = (self.frame.midX / 4)
        itemInfoBoxY = (self.frame.midY - 100)
        spaceBetweenItemInfoY = -30
        spaceBetweenItemInfoX = (self.frame.midX / 2)
        
        
        //Setting up the Hero
        heroInfo = HeroStats.SIHero
        heroInfo.updateStats()
        SoundPlayer.sharedHelper.playBackgroundMusic()
        //Mark: setting up the ground stuff
        //self.bg.anchorPoint = CGPoint(x: 0.5,y: 0.5)
        bg.size.height = self.size.height
        bg.size.width = self.size.width
        self.bg.position = CGPoint(x: self.frame.midX,y: self.frame.midY)
        self.bg.zPosition = 0
        
        
        //MARK: Button positions
        self.inventoryButton.position = CGPoint(x: self.frame.maxX - (inventoryButton.size.width / 2) ,y: self.frame.maxY - (inventoryButton.size.height * 1))
        inventoryButton.zPosition = 1
        
        self.shopButton.position = CGPoint(x: self.frame.maxX - (shopButton.size.width / 2) ,y: self.frame.maxY - (shopButton.size.height * 2))
        shopButton.zPosition = 1
        
        self.reagantButton.position = CGPoint(x: self.frame.maxX - (reagantButton.size.width / 2) ,y: self.frame.maxY - (reagantButton.size.height * 3))
        reagantButton.zPosition = 1
        
        self.upgradeButton.position = CGPoint(x: self.frame.maxX - (upgradeButton.size.width / 2) ,y: self.frame.maxY - (upgradeButton.size.height * 4))
        upgradeButton.zPosition = 1
        
        self.trainButton.position = CGPoint(x: self.frame.maxX - (trainButton.size.width / 2) ,y: self.frame.maxY - (trainButton.size.height * 5))
        trainButton.zPosition = 1
        
        self.adventureButton.position = CGPoint(x: self.frame.maxX - (adventureButton.size.width / 2),y: self.frame.maxY - adventureButton.size.height * 6)
        adventureButton.zPosition = 1
        
        
        //MARK: Label positions
        self.Title.text = "Your Shape"
        self.Title.fontSize = sceneTitleSize
        self.Title.fontColor  = UIColor.orange
        self.Title.position = CGPoint(x: heroInfoBoxX, y: self.frame.maxY + self.Title.fontSize)
        self.Title.zPosition = 1
        
        self.CharacterTl.text = "Hero Stats"
        self.CharacterTl.fontSize = informationTitleSize
        self.CharacterTl.fontColor  = UIColor.orange
        self.CharacterTl.position = CGPoint(x: heroInfoBoxX, y:  heroInfoBoxY )
        self.CharacterTl.zPosition = 1
        
        self.CharacterLvlTl.text = "Level: \(heroInfo.level)"
        self.CharacterLvlTl.fontSize = informationSize
        self.CharacterLvlTl.fontColor  = UIColor.orange
        self.CharacterLvlTl.position = CGPoint(x: heroInfoBoxX, y: heroInfoBoxY + (spaceBetweenInfo * 1))
        self.CharacterLvlTl.zPosition = 1
        
        self.CharacterExpTl.text = "EXP: \(heroInfo.currEXP) / \(heroInfo.needEXP)"
        self.CharacterExpTl.fontSize = informationSize
        self.CharacterExpTl.fontColor  = UIColor.orange
        self.CharacterExpTl.position = CGPoint(x: heroInfoBoxX, y: heroInfoBoxY + (spaceBetweenInfo * 2))
        self.CharacterExpTl.zPosition = 1
        
        self.CharacterHPTl.text = "Health: \(Double(round(100 * heroInfo.currHealth)/100))"
        self.CharacterHPTl.fontSize = informationSize
        self.CharacterHPTl.fontColor  = UIColor.orange
        self.CharacterHPTl.position = CGPoint(x: heroInfoBoxX, y: heroInfoBoxY + (spaceBetweenInfo * 3))
        self.CharacterHPTl.zPosition = 1
        
        self.CharacterAttTl.text = "Attack: \(Double(round(100 * heroInfo.currAttack)/100))"
        self.CharacterAttTl.fontSize = informationSize
        self.CharacterAttTl.fontColor  = UIColor.orange
        self.CharacterAttTl.position = CGPoint(x: heroInfoBoxX, y: heroInfoBoxY + (spaceBetweenInfo * 4))
        self.CharacterAttTl.zPosition = 1
        
        self.CharacterDefTl.text = "Defense: \(Double(round(100 * heroInfo.currDefense)/100))"
        self.CharacterDefTl.fontSize = informationSize
        self.CharacterDefTl.fontColor  = UIColor.orange
        self.CharacterDefTl.position = CGPoint(x: heroInfoBoxX, y: heroInfoBoxY + (spaceBetweenInfo * 5))
        self.CharacterDefTl.zPosition = 1
        
        self.CharacterSpdTl.text = "Speed: \(Double(round(100 * heroInfo.currSpeed)/100))"
        self.CharacterSpdTl.fontSize = informationSize
        self.CharacterSpdTl.fontColor  = UIColor.orange
        self.CharacterSpdTl.position = CGPoint(x: heroInfoBoxX, y: heroInfoBoxY + (spaceBetweenInfo * 6))
        self.CharacterSpdTl.zPosition = 1
        
        //MARK: Hero postion
        self.hero.position = CGPoint(x: self.frame.midX / 2,y: heroInfoBoxY + (spaceBetweenInfo * 2))
        self.hero.zPosition = 1
        
        //MARK: Player Items Positions
        // Item 1
        heroInfo.item1.setPositons(xP: Double(itemInfoBoxX) + ((heroInfo.item1.xSize + 20) * (0)), yP: (Double(itemInfoBoxY) + heroInfo.item1.ySize) )
        // The labels and all that
        self.Item1Tl.text = heroInfo.item1.name
        self.Item1Tl.fontSize = informationTitleSize
        self.Item1Tl.fontColor  = UIColor.orange
        self.Item1Tl.position = CGPoint(x: itemInfoBoxX + (spaceBetweenItemInfoX * 0), y: itemInfoBoxY)
        self.Item1Tl.zPosition = 1
        
        self.Item1HPTl.text = "Health: \(heroInfo.item1.health)"
        self.Item1HPTl.fontSize = informationSize
        self.Item1HPTl.fontColor  = UIColor.orange
        self.Item1HPTl.position = CGPoint(x: itemInfoBoxX + (spaceBetweenItemInfoX * 0), y:  itemInfoBoxY + (spaceBetweenItemInfoY * 1))
        self.Item1HPTl.zPosition = 1
        
        self.Item1AttTl.text = "Attack: \(heroInfo.item1.attack)"
        self.Item1AttTl.fontSize = informationSize
        self.Item1AttTl.fontColor  = UIColor.orange
        self.Item1AttTl.position = CGPoint(x: itemInfoBoxX + (spaceBetweenItemInfoX * 0), y: itemInfoBoxY + (spaceBetweenItemInfoY * 2))
        self.Item1AttTl.zPosition = 1
        
        self.Item1DefTl.text = "Defense: \(heroInfo.item1.defense)"
        self.Item1DefTl.fontSize = informationSize
        self.Item1DefTl.fontColor  = UIColor.orange
        self.Item1DefTl.position = CGPoint(x: itemInfoBoxX + (spaceBetweenItemInfoX * 0), y: itemInfoBoxY + (spaceBetweenItemInfoY * 3))
        self.Item1DefTl.zPosition = 1
        
        self.Item1SpdTl.text = "Speed: \(heroInfo.item1.speed)"
        self.Item1SpdTl.fontSize = informationSize
        self.Item1SpdTl.fontColor  = UIColor.orange
        self.Item1SpdTl.position = CGPoint(x: itemInfoBoxX + (spaceBetweenItemInfoX * 0), y: itemInfoBoxY + (spaceBetweenItemInfoY * 4))
        self.Item1SpdTl.zPosition = 1
        
        self.Item1RarityTl.text = "Rarity: \(heroInfo.item1.rarity!)"
        self.Item1RarityTl.fontSize = informationSize
        self.Item1RarityTl.fontColor  = UIColor.orange
        self.Item1RarityTl.position = CGPoint(x: itemInfoBoxX + (spaceBetweenItemInfoX * 0), y: itemInfoBoxY + (spaceBetweenItemInfoY * 5))
        self.Item1RarityTl.zPosition = 1
        
        self.Item1LvlTl.text = "Item Level: \(heroInfo.item1.itemLevel)"
        self.Item1LvlTl.fontSize = informationSize
        self.Item1LvlTl.fontColor  = UIColor.orange
        self.Item1LvlTl.position = CGPoint(x: itemInfoBoxX + (spaceBetweenItemInfoX * 0), y: itemInfoBoxY + (spaceBetweenItemInfoY * 6))
        self.Item1LvlTl.zPosition = 1
        
        self.Item1DescTl.text = "Description: \(heroInfo.item1.description)"
        self.Item1DescTl.fontSize = informationSize
        self.Item1DescTl.fontColor  = UIColor.orange
        self.Item1DescTl.position = CGPoint(x: itemInfoBoxX + (spaceBetweenItemInfoX * 0), y: itemInfoBoxY + (spaceBetweenItemInfoY * 7))
        self.Item1DescTl.zPosition = 1
        
        heroInfo.item2.setPositons(xP: Double(itemInfoBoxX  +   (spaceBetweenItemInfoX * 1)) , yP: (Double(itemInfoBoxY) + heroInfo.item2.ySize) )
        
        // The labels and all that
        self.Item2Tl.text = heroInfo.item2.name
        self.Item2Tl.fontSize = informationTitleSize
        self.Item2Tl.fontColor  = UIColor.orange
        self.Item2Tl.position = CGPoint(x: itemInfoBoxX + (spaceBetweenItemInfoX * 1), y: itemInfoBoxY)
        self.Item2Tl.zPosition = 1
        
        self.Item2HPTl.text = "Health: \(heroInfo.item2.health)"
        self.Item2HPTl.fontSize = informationSize
        self.Item2HPTl.fontColor  = UIColor.orange
        self.Item2HPTl.position = CGPoint(x: itemInfoBoxX + (spaceBetweenItemInfoX * 1), y:  itemInfoBoxY + (spaceBetweenItemInfoY * 1))
        self.Item2HPTl.zPosition = 1
        
        self.Item2AttTl.text = "Attack: \(heroInfo.item2.attack)"
        self.Item2AttTl.fontSize = informationSize
        self.Item2AttTl.fontColor  = UIColor.orange
        self.Item2AttTl.position = CGPoint(x: itemInfoBoxX + (spaceBetweenItemInfoX * 1), y: itemInfoBoxY + (spaceBetweenItemInfoY * 2))
        self.Item2AttTl.zPosition = 1
        
        self.Item2DefTl.text = "Defense: \(heroInfo.item2.defense)"
        self.Item2DefTl.fontSize = informationSize
        self.Item2DefTl.fontColor  = UIColor.orange
        self.Item2DefTl.position = CGPoint(x: itemInfoBoxX + (spaceBetweenItemInfoX * 1), y: itemInfoBoxY + (spaceBetweenItemInfoY * 3))
        self.Item2DefTl.zPosition = 1
        
        self.Item2SpdTl.text = "Speed: \(heroInfo.item2.speed)"
        self.Item2SpdTl.fontSize = informationSize
        self.Item2SpdTl.fontColor  = UIColor.orange
        self.Item2SpdTl.position = CGPoint(x: itemInfoBoxX + (spaceBetweenItemInfoX * 1), y: itemInfoBoxY + (spaceBetweenItemInfoY * 4))
        self.Item2SpdTl.zPosition = 1
        
        self.Item2RarityTl.text = "Rarity: \(heroInfo.item2.rarity!)"
        self.Item2RarityTl.fontSize = informationSize
        self.Item2RarityTl.fontColor  = UIColor.orange
        self.Item2RarityTl.position = CGPoint(x: itemInfoBoxX + (spaceBetweenItemInfoX * 1), y: itemInfoBoxY + (spaceBetweenItemInfoY * 5))
        self.Item2RarityTl.zPosition = 1
        
        self.Item2LvlTl.text = "Item Level: \(heroInfo.item2.itemLevel)"
        self.Item2LvlTl.fontSize = informationSize
        self.Item2LvlTl.fontColor  = UIColor.orange
        self.Item2LvlTl.position = CGPoint(x: itemInfoBoxX + (spaceBetweenItemInfoX * 1), y: itemInfoBoxY + (spaceBetweenItemInfoY * 6))
        self.Item2LvlTl.zPosition = 1
        
        self.Item2DescTl.text = "Description: \(heroInfo.item2.description)"
        self.Item2DescTl.fontSize = informationSize
        self.Item2DescTl.fontColor  = UIColor.orange
        self.Item2DescTl.position = CGPoint(x: itemInfoBoxX + (spaceBetweenItemInfoX * 1), y: itemInfoBoxY + (spaceBetweenItemInfoY * 7))
        self.Item2DescTl.zPosition = 1
        
        
        heroInfo.item3.setPositons(xP: Double(itemInfoBoxX  + (spaceBetweenItemInfoX * 2)), yP: (Double(itemInfoBoxY) + heroInfo.item3.ySize) )
        // The labels and all that
        self.Item3Tl.text = heroInfo.item3.name
        self.Item3Tl.fontSize = informationTitleSize
        self.Item3Tl.fontColor  = UIColor.orange
        self.Item3Tl.position = CGPoint(x: itemInfoBoxX + (spaceBetweenItemInfoX * 2), y: itemInfoBoxY)
        self.Item3Tl.zPosition = 1
        
        self.Item3HPTl.text = "Health: \(heroInfo.item3.health)"
        self.Item3HPTl.fontSize = informationSize
        self.Item3HPTl.fontColor  = UIColor.orange
        self.Item3HPTl.position = CGPoint(x: itemInfoBoxX + (spaceBetweenItemInfoX * 2), y:  itemInfoBoxY + (spaceBetweenItemInfoY * 1))
        self.Item3HPTl.zPosition = 1
        
        self.Item3AttTl.text = "Attack: \(heroInfo.item3.attack)"
        self.Item3AttTl.fontSize = informationSize
        self.Item3AttTl.fontColor  = UIColor.orange
        self.Item3AttTl.position = CGPoint(x: itemInfoBoxX + (spaceBetweenItemInfoX * 2), y: itemInfoBoxY + (spaceBetweenItemInfoY * 2))
        self.Item3AttTl.zPosition = 1
        
        self.Item3DefTl.text = "Defense: \(heroInfo.item3.defense)"
        self.Item3DefTl.fontSize = informationSize
        self.Item3DefTl.fontColor  = UIColor.orange
        self.Item3DefTl.position = CGPoint(x: itemInfoBoxX + (spaceBetweenItemInfoX * 2), y: itemInfoBoxY + (spaceBetweenItemInfoY * 3))
        self.Item3DefTl.zPosition = 1
        
        self.Item3SpdTl.text = "Speed: \(heroInfo.item3.speed)"
        self.Item3SpdTl.fontSize = informationSize
        self.Item3SpdTl.fontColor  = UIColor.orange
        self.Item3SpdTl.position = CGPoint(x: itemInfoBoxX + (spaceBetweenItemInfoX * 2), y: itemInfoBoxY + (spaceBetweenItemInfoY * 4))
        self.Item3SpdTl.zPosition = 1
        
        self.Item3RarityTl.text = "Rarity: \(heroInfo.item3.rarity!)"
        self.Item3RarityTl.fontSize = informationSize
        self.Item3RarityTl.fontColor  = UIColor.orange
        self.Item3RarityTl.position = CGPoint(x: itemInfoBoxX + (spaceBetweenItemInfoX * 2), y: itemInfoBoxY + (spaceBetweenItemInfoY * 5))
        self.Item3RarityTl.zPosition = 1
        
        self.Item3LvlTl.text = "Item Level: \(heroInfo.item3.itemLevel)"
        self.Item3LvlTl.fontSize = informationSize
        self.Item3LvlTl.fontColor  = UIColor.orange
        self.Item3LvlTl.position = CGPoint(x: itemInfoBoxX + (spaceBetweenItemInfoX * 2), y: itemInfoBoxY + (spaceBetweenItemInfoY * 6))
        self.Item3LvlTl.zPosition = 1
        
        self.Item3DescTl.text = "Description: \(heroInfo.item3.description)"
        self.Item3DescTl.fontSize = informationSize
        self.Item3DescTl.fontColor  = UIColor.orange
        self.Item3DescTl.position = CGPoint(x: itemInfoBoxX + (spaceBetweenItemInfoX * 2), y: itemInfoBoxY + (spaceBetweenItemInfoY * 7))
        self.Item3DescTl.zPosition = 1
        
        
        
        //MARK: adding Children
        self.addChild(self.bg)
        
        // Adding the hero
        self.addChild(self.hero)
        
        // All the hero information and all that jazz
        self.addChild(self.CharacterTl)
        self.addChild(self.CharacterHPTl)
        self.addChild(self.CharacterAttTl)
        self.addChild(self.CharacterDefTl)
        self.addChild(self.CharacterLvlTl)
        self.addChild(self.CharacterExpTl)
        self.addChild(self.CharacterSpdTl)
        
        // The heros items and all that
        self.addChild(self.heroInfo.item1.itemNode)
        self.addChild(self.heroInfo.item2.itemNode)
        self.addChild(self.heroInfo.item3.itemNode)
        // The Heros Items Stats and all thatjazz
        // Items 1
        self.addChild(self.Item1Tl)
        self.addChild(self.Item1HPTl)
        self.addChild(self.Item1AttTl)
        self.addChild(self.Item1DefTl)
        self.addChild(self.Item1SpdTl)
        self.addChild(self.Item1RarityTl)
        self.addChild(self.Item1LvlTl)
        self.addChild(self.Item1DescTl)
        // Item 2
        self.addChild(self.Item2Tl)
        self.addChild(self.Item2HPTl)
        self.addChild(self.Item2AttTl)
        self.addChild(self.Item2DefTl)
        self.addChild(self.Item2SpdTl)
        self.addChild(self.Item2RarityTl)
        self.addChild(self.Item2LvlTl)
        self.addChild(self.Item2DescTl)
        // Item 3
        self.addChild(self.Item3Tl)
        self.addChild(self.Item3HPTl)
        self.addChild(self.Item3AttTl)
        self.addChild(self.Item3DefTl)
        self.addChild(self.Item3SpdTl)
        self.addChild(self.Item3RarityTl)
        self.addChild(self.Item3LvlTl)
        self.addChild(self.Item3DescTl)
        
        // The buttons
        self.addChild(self.inventoryButton)
        self.addChild(self.shopButton)
        self.addChild(self.reagantButton)
        self.addChild(self.upgradeButton)
        self.addChild(self.trainButton)
        self.addChild(self.adventureButton)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch : AnyObject in touches {
            let location = touch.location(in: self)
            // all the difrent buttons
            if self.atPoint(location) == self.inventoryButton{
                let scene = InventoryScene(size: self.size)
                let skView = self.view! as SKView
                skView.ignoresSiblingOrder = true
                scene.scaleMode = .resizeFill
                scene.size = skView.bounds.size
                skView.presentScene(scene)
            }
            if self.atPoint(location) == self.shopButton{
                let scene = ShopBuyScene(size: self.size)
                let skView = self.view! as SKView
                skView.ignoresSiblingOrder = true
                scene.scaleMode = .resizeFill
                scene.size = skView.bounds.size
                skView.presentScene(scene)
            }
            if self.atPoint(location) == self.reagantButton{
                let scene = potionScene(size: self.size)
                let skView = self.view! as SKView
                skView.ignoresSiblingOrder = true
                scene.scaleMode = .resizeFill
                scene.size = skView.bounds.size
                skView.presentScene(scene)
            }
            if self.atPoint(location) == self.upgradeButton{
                let scene = MaterialScene(size: self.size)
                let skView = self.view! as SKView
                skView.ignoresSiblingOrder = true
                scene.scaleMode = .resizeFill
                scene.size = skView.bounds.size
                skView.presentScene(scene)
            }
            if self.atPoint(location) == self.trainButton{
                let scene = AdventureScene(size: self.size)
                let skView = self.view! as SKView
                skView.ignoresSiblingOrder = true
                scene.scaleMode = .resizeFill
                scene.size = skView.bounds.size
                skView.presentScene(scene)
            }
            if self.atPoint(location) == self.adventureButton{
                let scene = AdventureScene(size: self.size)
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
