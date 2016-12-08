//
//  PlayScene.swift
//  SPG
//
//  Created by Student on 2016-11-23.
//  Copyright © 2016 WestNet. All rights reserved.
//


import SpriteKit

// This is the games scene and all that jazz
class InventoryScene : SKScene, SKPhysicsContactDelegate, UITextFieldDelegate
{
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
    
    let maxItemsOnPage = Int32(20)
    
    // The Background
    let bg = SKSpriteNode(imageNamed:"bg")
    
    // The hero / Square
    let hero = SKSpriteNode(imageNamed:"square")
    
    // Title of the screen
    let InventoryTl = SKLabelNode(fontNamed: "Chalkduster")
    
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
    
    // These are for all the selected Item stats and all that Jazz
    let ItemTl = SKLabelNode(fontNamed: "Chalkduster")
    let ItemHPTl = SKLabelNode(fontNamed: "Chalkduster")
    let ItemAttTl = SKLabelNode(fontNamed: "Chalkduster")
    let ItemDefTl = SKLabelNode(fontNamed: "Chalkduster")
    let ItemSpdTl = SKLabelNode(fontNamed: "Chalkduster")
    let ItemRarityTl = SKLabelNode(fontNamed: "Chalkduster")
    let ItemLvlTl = SKLabelNode(fontNamed: "Chalkduster")
    let ItemDescTl = SKLabelNode(fontNamed: "Chalkduster")
    let ItemNameTl = SKLabelNode(fontNamed: "Chalkduster")
    // Buttons on the bottom Like Adventure and leave and all that jazz
    let mainMenuButton = SKSpriteNode(imageNamed:"play")
    let backButton = SKSpriteNode(imageNamed:"about")
    
    var inven = Inventory.SIinven
    
    var baseItemPage = Int32(0)
    
    var heroInfo = HeroStats()
    
    var selectItemBoxY = CGFloat(0)
    
    override func didMove(to view: SKView) {
        
        
        // Setting the Item info box postions and all that Zazz
        
        itemInfoBoxX = (self.frame.midX / 4)
        itemInfoBoxY = (self.frame.midY - 160)
        spaceBetweenItemInfoY = -30
        spaceBetweenItemInfoX = (self.frame.midX / 2)
        
        selectItemBoxY = (self.frame.maxY - 40)
        
        SoundPlayer.sharedHelper.playBackgroundMusic()
        heroInfo = HeroStats.SIHero
        heroInfo.updateStats()
        bg.size.height = self.size.height
        bg.size.width = self.size.width
        self.bg.position = CGPoint(x: self.frame.midX,y: self.frame.midY)
        self.bg.zPosition = 0
        
        self.hero.position = CGPoint(x: self.frame.midX / 4,y: self.frame.midY)
        self.hero.zPosition = 1
        
        
        // This is for the selected Items and all that Fun stuff
        self.ItemTl.text = "Selected Item Stats"
        self.ItemTl.fontSize = 32
        self.ItemTl.fontColor  = UIColor.orange
        self.ItemTl.position = CGPoint(x: itemInfoBoxX + 50, y:  (selectItemBoxY) + (spaceBetweenItemInfoY * 0))
        self.ItemTl.zPosition = 1
        
        self.ItemNameTl.text = "Name: "
        self.ItemNameTl.fontSize = 24
        self.ItemNameTl.fontColor  = UIColor.orange
        self.ItemNameTl.position = CGPoint(x: itemInfoBoxX + (spaceBetweenItemInfoX * 0), y:  (selectItemBoxY) + (spaceBetweenItemInfoY * 1))
        self.ItemNameTl.zPosition = 1
        
        self.ItemHPTl.text = "Health: 0"
        self.ItemHPTl.fontSize = 24
        self.ItemHPTl.fontColor  = UIColor.orange
        self.ItemHPTl.position = CGPoint(x: itemInfoBoxX + (spaceBetweenItemInfoX * 0), y:  (selectItemBoxY) + (spaceBetweenItemInfoY * 2))
        self.ItemHPTl.zPosition = 1
        
        self.ItemAttTl.text = "Attack: 0"
        self.ItemAttTl.fontSize = 24
        self.ItemAttTl.fontColor  = UIColor.orange
        self.ItemAttTl.position = CGPoint(x: itemInfoBoxX + (spaceBetweenItemInfoX * 0), y:  (selectItemBoxY) + (spaceBetweenItemInfoY * 3))
        self.ItemAttTl.zPosition = 1
        
        self.ItemDefTl.text = "Defense: 0"
        self.ItemDefTl.fontSize = 24
        self.ItemDefTl.fontColor  = UIColor.orange
        self.ItemDefTl.position = CGPoint(x: itemInfoBoxX + (spaceBetweenItemInfoX * 0), y:  (selectItemBoxY) + (spaceBetweenItemInfoY * 4))
        self.ItemDefTl.zPosition = 1
        
        self.ItemRarityTl.text = "Rarity: "
        self.ItemRarityTl.fontSize = 24
        self.ItemRarityTl.fontColor  = UIColor.orange
        self.ItemRarityTl.position = CGPoint(x: itemInfoBoxX + (spaceBetweenItemInfoX * 0), y:  (selectItemBoxY) + (spaceBetweenItemInfoY * 5))
        self.ItemRarityTl.zPosition = 1
        
        self.ItemLvlTl.text = "Item Level: "
        self.ItemLvlTl.fontSize = 24
        self.ItemLvlTl.fontColor  = UIColor.orange
        self.ItemLvlTl.position = CGPoint(x: itemInfoBoxX + (spaceBetweenItemInfoX * 0), y:  (selectItemBoxY) + (spaceBetweenItemInfoY * 6))
        self.ItemLvlTl.zPosition = 1
        
        self.ItemDescTl.text = "Description: "
        self.ItemDescTl.fontSize = 24
        self.ItemDescTl.fontColor  = UIColor.orange
        self.ItemDescTl.position = CGPoint(x: itemInfoBoxX + (spaceBetweenItemInfoX * 0), y:  (selectItemBoxY) + (spaceBetweenItemInfoY * 7))
        self.ItemDescTl.zPosition = 1
        
        
        //MARK: Button positions
        self.mainMenuButton.position = CGPoint(x: self.frame.maxX - (mainMenuButton.size.width / 2),y: self.frame.minY + mainMenuButton.size.height / 2)
        mainMenuButton.zPosition = 1
        
        self.backButton.position = CGPoint(x: self.frame.minX + (backButton.size.width / 2),y: self.frame.minY + backButton.size.height / 2)
        backButton.zPosition = 1
        
        //MARK: Drawing the inventory and all that jazz
        var i: Double
        i = 0
        var j: Double
        j = 0
        var totalCounter: Int32
        totalCounter = 0
        
        
        for item  in inven.itemList
        {
            if ((baseItemPage * 20) < totalCounter)
            {
                item.setPositons(xP: Double(self.frame.midX) + ((item.xSize + 20) * (i)), yP: ((Double(self.frame.maxY) - item.xSize * 2) + (item.xSize + 20)) - (item.xSize + 20) * j )
                i = i + 1
                self.addChild(item.itemNode)
            }
            totalCounter = totalCounter + 1
            
            if (i == 5)
            {
                j = j + 1
                i = 0
            }
            if (j == 4)
            {
                break
            }
        }
        self.re
        
        //MARK: Adding player Items
        // The first Item and all that fun stuff
        heroInfo.item1.setPositons(xP: Double(self.frame.midX) + ((heroInfo.item1.xSize + 20) * (0)), yP: (Double(self.frame.midY) + (heroInfo.item1.xSize + 20)) - (heroInfo.item1.xSize + 20) * 3 )
        
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
        
        // ITem 2
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
        
        
        heroInfo.item1.changeColor(nColor: UIColor.green)
        heroInfo.item2.changeColor(nColor: UIColor.green)
        
        heroInfo.item3.changeColor(nColor: UIColor.green)
        
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
        
        self.addChild(self.heroInfo.item1.itemNode)
        self.addChild(self.heroInfo.item2.itemNode)
        self.addChild(self.heroInfo.item3.itemNode)
        
        self.addChild(self.ItemTl)
        self.addChild(self.ItemNameTl)
        self.addChild(self.ItemHPTl)
        self.addChild(self.ItemAttTl)
        self.addChild(self.ItemDefTl)
        self.addChild(self.ItemSpdTl)
        self.addChild(self.ItemRarityTl)
        self.addChild(self.ItemLvlTl)
        self.addChild(self.ItemDescTl)
        
        
        // self.addChild(self.InventoryTl)
        self.addChild(self.bg)
        self.addChild(self.hero)
        
        self.addChild(self.mainMenuButton)
        
        
    }
    //MARK: Touches Began
    var itemSwap = Items()
    var itemSwapper = false
    var itemNum = 0
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch : AnyObject in touches {
            let location = touch.location(in: self)
            
            
            //MARK: Main Menu Button
            if self.atPoint(location) == self.mainMenuButton{
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
                    //self.CharacterHPTl.text = "Health: \(heroInfo.currHealth)"
                    //self.CharacterAttTl.text = "Attack: \(heroInfo.currAttack)"
                    // self.CharacterDefTl.text = "Defense: \(heroInfo.currDefense)"
                    
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
                    //self.CharacterHPTl.text = "Health: \(heroInfo.currHealth)"
                    //self.CharacterAttTl.text = "Attack: \(heroInfo.currAttack)"
                    // self.CharacterDefTl.text = "Defense: \(heroInfo.currDefense)"
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
                    //self.CharacterHPTl.text = "Health: \(heroInfo.currHealth)"
                    // self.CharacterAttTl.text = "Attack: \(heroInfo.currAttack)"
                    // self.CharacterDefTl.text = "Defense: \(heroInfo.currDefense)"
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
