//
//  MaterialScene.swift
//  SPG
//
//  Created by Student on 2016-12-09.
//  Copyright © 2016 WestNet. All rights reserved.
//

import Foundation
import SpriteKit


class MaterialScene : SKScene, SKPhysicsContactDelegate, UITextFieldDelegate
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
    let ItemTl = SKLabelNode(fontNamed: "Chalkduster")
    let ItemHPTl = SKLabelNode(fontNamed: "Chalkduster")
    let ItemAttTl = SKLabelNode(fontNamed: "Chalkduster")
    let ItemDefTl = SKLabelNode(fontNamed: "Chalkduster")
    let ItemSpdTl = SKLabelNode(fontNamed: "Chalkduster")
    let ItemRarityTl = SKLabelNode(fontNamed: "Chalkduster")
    let ItemLvlTl = SKLabelNode(fontNamed: "Chalkduster")
    
    let upgradeTl = SKLabelNode(fontNamed: "Chalkduster")
    let uLSTL = SKLabelNode(fontNamed: "Chalkduster")
    let uBTL = SKLabelNode(fontNamed: "Chalkduster")
    let uCPTL = SKLabelNode(fontNamed: "Chalkduster")
    let uGTL = SKLabelNode(fontNamed: "Chalkduster")
    
    let deconTl = SKLabelNode(fontNamed: "Chalkduster")
    let dLSTL = SKLabelNode(fontNamed: "Chalkduster")
    let dBTL = SKLabelNode(fontNamed: "Chalkduster")
    let dCPTL = SKLabelNode(fontNamed: "Chalkduster")
    let dGTL = SKLabelNode(fontNamed: "Chalkduster")
    
    let yTl = SKLabelNode(fontNamed: "Chalkduster")
    let yLSTL = SKLabelNode(fontNamed: "Chalkduster")
    let yBTL = SKLabelNode(fontNamed: "Chalkduster")
    let yCPTL = SKLabelNode(fontNamed: "Chalkduster")
    let yGTL = SKLabelNode(fontNamed: "Chalkduster")
    
    var upgradeNode = SKShapeNode()
    var deconNode = SKShapeNode()
    
    
    var potionInfoBoxX = CGFloat(0)
    var potionInfoBoxY = CGFloat(0)
    var spaceBetweenPotionInfoY = CGFloat(0)
    var spaceBetweenPotionInfoX = CGFloat(0)
    var buyNodeHeight = Double(0)
    var buyNodeWidth = Double(0)
    var selectPotionBoxY = CGFloat(0)
    let mainMenuButton = SKSpriteNode(imageNamed:"back")
    
    let upgradeButton = SKSpriteNode(imageNamed:"upgradeButton")
    let deconButton = SKSpriteNode(imageNamed:"deconButton")
    
    var baseItemPage = Int32(0)
    var heroInfo = HeroStats()
    var inven = Inventory.SIinven
    var selectItemBoxY = CGFloat(0)
    
    var upgradeItem = Upgrade(item: Items())
    
    override func didMove(to view: SKView) {
        buyNodeWidth = Double(self.frame.size.width / 4) - 10
        buyNodeHeight = Double(60)
        inven.countMats()
        potionInfoBoxX = (self.frame.minX )
        potionInfoBoxY = (self.frame.maxY - 40)
        spaceBetweenPotionInfoY = -30
        spaceBetweenPotionInfoX = (self.frame.size.width / CGFloat(2))
        selectPotionBoxY = (self.frame.size.height / CGFloat(3))
        
        upgradeNode = SKShapeNode(rectOf: CGSize(width: buyNodeWidth, height: buyNodeHeight + 30))
        deconNode = SKShapeNode(rectOf: CGSize(width: buyNodeWidth, height: buyNodeHeight + 30))
        // Setting the Item info box postions and all that Zazz
        
        itemInfoBoxX = (self.frame.minX )
        itemInfoBoxY = (self.frame.maxY - 40)
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
        
        
        
        //MARK: Button positions
        self.mainMenuButton.position = CGPoint(x: self.frame.maxX - (mainMenuButton.size.width / 2),y: self.frame.minY + mainMenuButton.size.height / 2)
        mainMenuButton.zPosition = 1
        
        
        drawInven()
        
        
        //MARK: Adding player Items
        // The first Item and all that fun stuff
        heroInfo.item1.setPositons(xP: Double(self.frame.midX) + ((heroInfo.item1.xSize + 20) * (0)), yP: (Double(self.frame.midY) + (heroInfo.item1.xSize + 20)) - (heroInfo.item1.xSize + 20) * 3 )
        
        //MARK: Player Items Positions
        // Item 1
        heroInfo.item1.setPositons(xP: Double(itemInfoBoxX) + ((heroInfo.item1.xSize + 20) * (0)), yP: (Double(itemInfoBoxY) + heroInfo.item1.ySize) )
        // The labels and all that
        self.ItemTl.text = heroInfo.item1.name
        self.ItemTl.fontSize = informationTitleSize
        self.ItemTl.fontColor  = UIColor.orange
        self.ItemTl.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
        self.ItemTl.position = CGPoint(x: itemInfoBoxX + (spaceBetweenItemInfoX * 0), y: itemInfoBoxY)
        self.ItemTl.zPosition = 1
        
        self.ItemHPTl.text = "Health: 0"
        self.ItemHPTl.fontSize = informationSize
        self.ItemHPTl.fontColor  = UIColor.orange
        self.ItemHPTl.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
        self.ItemHPTl.position = CGPoint(x: itemInfoBoxX + (spaceBetweenItemInfoX * 0), y:  itemInfoBoxY + (spaceBetweenItemInfoY * 1))
        self.ItemHPTl.zPosition = 1
        
        self.ItemAttTl.text = "Attack: 0"
        self.ItemAttTl.fontSize = informationSize
        self.ItemAttTl.fontColor  = UIColor.orange
        self.ItemAttTl.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
        self.ItemAttTl.position = CGPoint(x: itemInfoBoxX + (spaceBetweenItemInfoX * 0), y: itemInfoBoxY + (spaceBetweenItemInfoY * 2))
        self.ItemAttTl.zPosition = 1
        
        self.ItemDefTl.text = "Defense: 0"
        self.ItemDefTl.fontSize = informationSize
        self.ItemDefTl.fontColor  = UIColor.orange
        self.ItemDefTl.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
        self.ItemDefTl.position = CGPoint(x: itemInfoBoxX + (spaceBetweenItemInfoX * 0), y: itemInfoBoxY + (spaceBetweenItemInfoY * 3))
        self.ItemDefTl.zPosition = 1
        
        self.ItemSpdTl.text = "Speed: 0"
        self.ItemSpdTl.fontSize = informationSize
        self.ItemSpdTl.fontColor  = UIColor.orange
        self.ItemSpdTl.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
        self.ItemSpdTl.position = CGPoint(x: itemInfoBoxX + (spaceBetweenItemInfoX * 0), y: itemInfoBoxY + (spaceBetweenItemInfoY * 4))
        self.ItemSpdTl.zPosition = 1
        
        self.ItemRarityTl.text = "Rarity: 0"
        self.ItemRarityTl.fontSize = informationSize
        self.ItemRarityTl.fontColor  = UIColor.orange
        self.ItemRarityTl.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
        self.ItemRarityTl.position = CGPoint(x: itemInfoBoxX + (spaceBetweenItemInfoX * 0), y: itemInfoBoxY + (spaceBetweenItemInfoY * 5))
        self.ItemRarityTl.zPosition = 1
        
        self.ItemLvlTl.text = "Item Level: 0"
        self.ItemLvlTl.fontSize = informationSize
        self.ItemLvlTl.fontColor  = UIColor.orange
        self.ItemLvlTl.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
        self.ItemLvlTl.position = CGPoint(x: itemInfoBoxX + (spaceBetweenItemInfoX * 0), y: itemInfoBoxY + (spaceBetweenItemInfoY * 6))
        self.ItemLvlTl.zPosition = 1
        
        self.upgradeTl.text = "Upgrade Cost"
        self.upgradeTl.fontSize = informationTitleSize
        self.upgradeTl.fontColor  = UIColor.orange
        self.upgradeTl.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
        self.upgradeTl.position = CGPoint(x: itemInfoBoxX + (spaceBetweenItemInfoX * 0), y: itemInfoBoxY + (spaceBetweenItemInfoY * 7))
        self.upgradeTl.zPosition = 1
        
        self.uLSTL.text = "Line Segments: 0"
        self.uLSTL.fontSize = informationSize
        self.uLSTL.fontColor  = UIColor.orange
        self.uLSTL.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
        self.uLSTL.position = CGPoint(x: itemInfoBoxX + (spaceBetweenItemInfoX * 0), y: itemInfoBoxY + (spaceBetweenItemInfoY * 8))
        self.uLSTL.zPosition = 1
        
        self.uBTL.text = "Bolders: 0"
        self.uBTL.fontSize = informationSize
        self.uBTL.fontColor  = UIColor.orange
        self.uBTL.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
        self.uBTL.position = CGPoint(x: itemInfoBoxX + (spaceBetweenItemInfoX * 0), y: itemInfoBoxY + (spaceBetweenItemInfoY * 9))
        self.uBTL.zPosition = 1
        
        self.uCPTL.text = "Corner Pieces: 0"
        self.uCPTL.fontSize = informationSize
        self.uCPTL.fontColor  = UIColor.orange
        self.uCPTL.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
        self.uCPTL.position = CGPoint(x: itemInfoBoxX + (spaceBetweenItemInfoX * 0), y: itemInfoBoxY + (spaceBetweenItemInfoY * 10))
        self.uCPTL.zPosition = 1
        
        self.uGTL.text = "Gold: 0"
        self.uGTL.fontSize = informationSize
        self.uGTL.fontColor  = UIColor.orange
        self.uGTL.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
        self.uGTL.position = CGPoint(x: itemInfoBoxX + (spaceBetweenItemInfoX * 0), y: itemInfoBoxY + (spaceBetweenItemInfoY * 11))
        self.uGTL.zPosition = 1
        //MARK: Decon labels
        self.deconTl.text = "Deconstruction Values"
        self.deconTl.fontSize = informationTitleSize
        self.deconTl.fontColor  = UIColor.orange
        self.deconTl.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
        self.deconTl.position = CGPoint(x: itemInfoBoxX + (spaceBetweenItemInfoX * 0), y: itemInfoBoxY + (spaceBetweenItemInfoY * 12))
        self.deconTl.zPosition = 1
        
        self.dLSTL.text = "Line Segments: 0"
        self.dLSTL.fontSize = informationSize
        self.dLSTL.fontColor  = UIColor.orange
        self.dLSTL.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
        self.dLSTL.position = CGPoint(x: itemInfoBoxX + (spaceBetweenItemInfoX * 0), y: itemInfoBoxY + (spaceBetweenItemInfoY * 13))
        self.dLSTL.zPosition = 1
        
        self.dBTL.text = "Bolders: 0"
        self.dBTL.fontSize = informationSize
        self.dBTL.fontColor  = UIColor.orange
        self.dBTL.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
        self.dBTL.position = CGPoint(x: itemInfoBoxX + (spaceBetweenItemInfoX * 0), y: itemInfoBoxY + (spaceBetweenItemInfoY * 14))
        self.dBTL.zPosition = 1
        
        self.dCPTL.text = "Corner Pieces: 0"
        self.dCPTL.fontSize = informationSize
        self.dCPTL.fontColor  = UIColor.orange
        self.dCPTL.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
        self.dCPTL.position = CGPoint(x: itemInfoBoxX + (spaceBetweenItemInfoX * 0), y: itemInfoBoxY + (spaceBetweenItemInfoY * 15))
        self.dCPTL.zPosition = 1
        
        self.dGTL.text = "Gold: 0"
        self.dGTL.fontSize = informationSize
        self.dGTL.fontColor  = UIColor.orange
        self.dGTL.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
        self.dGTL.position = CGPoint(x: itemInfoBoxX + (spaceBetweenItemInfoX * 0), y: itemInfoBoxY + (spaceBetweenItemInfoY * 16))
        self.dGTL.zPosition = 1
        //MARK: Your mats labels
        self.yTl.text = "Your Materials"
        self.yTl.fontSize = informationTitleSize
        self.yTl.fontColor  = UIColor.orange
        self.yTl.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
        self.yTl.position = CGPoint(x: itemInfoBoxX + (spaceBetweenItemInfoX * 0), y: itemInfoBoxY + (spaceBetweenItemInfoY * 17))
        self.yTl.zPosition = 1
        
        self.yLSTL.text = "Line Segments: \(inven.LScount)"
        self.yLSTL.fontSize = informationSize
        self.yLSTL.fontColor  = UIColor.orange
        self.yLSTL.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
        self.yLSTL.position = CGPoint(x: itemInfoBoxX + (spaceBetweenItemInfoX * 0), y: itemInfoBoxY + (spaceBetweenItemInfoY * 18))
        self.yLSTL.zPosition = 1
        
        self.yBTL.text = "Bolders: \(inven.Bcount)"
        self.yBTL.fontSize = informationSize
        self.yBTL.fontColor  = UIColor.orange
        self.yBTL.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
        self.yBTL.position = CGPoint(x: itemInfoBoxX + (spaceBetweenItemInfoX * 0), y: itemInfoBoxY + (spaceBetweenItemInfoY * 19))
        self.yBTL.zPosition = 1
        
        self.yCPTL.text = "Corner Pieces: \(inven.CPcount)"
        self.yCPTL.fontSize = informationSize
        self.yCPTL.fontColor  = UIColor.orange
        self.yCPTL.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
        self.yCPTL.position = CGPoint(x: itemInfoBoxX + (spaceBetweenItemInfoX * 0), y: itemInfoBoxY + (spaceBetweenItemInfoY * 20))
        self.yCPTL.zPosition = 1
        
        self.yGTL.text = "Gold: \(inven.gold)"
        self.yGTL.fontSize = informationSize
        self.yGTL.fontColor  = UIColor.orange
        self.yGTL.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
        self.yGTL.position = CGPoint(x: itemInfoBoxX + (spaceBetweenItemInfoX * 0), y: itemInfoBoxY + (spaceBetweenItemInfoY * 21))
        self.yGTL.zPosition = 1
        
        //MARK: increas size button khjkhk
        upgradeButton.name = "incSize"
        
        upgradeButton.position = CGPoint(x: potionInfoBoxX + (spaceBetweenPotionInfoX * CGFloat(1)) + CGFloat((buyNodeWidth * 1.5)), y:  (potionInfoBoxY) - (selectPotionBoxY * CGFloat(1)) + (spaceBetweenPotionInfoY * 5) - CGFloat(buyNodeHeight + 90))
        upgradeButton.zPosition = 1
        self.addChild(upgradeButton)
        
        //MARK: dec size button
        deconButton.name = "incSize"
        deconNode.fillColor = UIColor.black
        deconButton.position = CGPoint(x: potionInfoBoxX + (spaceBetweenPotionInfoX * CGFloat(1)) + CGFloat((buyNodeWidth / 2)) - CGFloat(40), y:  (potionInfoBoxY) - (selectPotionBoxY * CGFloat(1)) + (spaceBetweenPotionInfoY * 5) - CGFloat(buyNodeHeight + 90))
        deconButton.zPosition = 1
        self.addChild(deconButton)
        
        self.addChild(self.yTl)
        self.addChild(self.yLSTL)
        self.addChild(self.yBTL)
        self.addChild(self.yCPTL)
        self.addChild(self.yGTL)
        
        self.addChild(self.upgradeTl)
        self.addChild(self.uLSTL)
        self.addChild(self.uBTL)
        self.addChild(self.uCPTL)
        self.addChild(self.uGTL)
        
        self.addChild(self.deconTl)
        self.addChild(self.dLSTL)
        self.addChild(self.dBTL)
        self.addChild(self.dCPTL)
        self.addChild(self.dGTL)
        
        // The Heros Items Stats and all thatjazz
        
        
        // Items 1
        self.addChild(self.ItemTl)
        self.addChild(self.ItemHPTl)
        self.addChild(self.ItemAttTl)
        self.addChild(self.ItemDefTl)
        self.addChild(self.ItemSpdTl)
        self.addChild(self.ItemRarityTl)
        self.addChild(self.ItemLvlTl)
        
        
        // self.addChild(self.InventoryTl)
        self.addChild(self.bg)
        
        
        self.addChild(self.mainMenuButton)
        
        
    }
    
    func drawInven ()
    {
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
    }
    
    func resetScene ()
    {
        let scene = MaterialScene(size: self.size)
        HeroStats.SIHero = heroInfo
        let skView = self.view! as SKView
        skView.ignoresSiblingOrder = true
        scene.scaleMode = .resizeFill
        scene.size = skView.bounds.size
        skView.presentScene(scene)
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
                let scene = MainMenuScene(size: self.size)
                HeroStats.SIHero = heroInfo
                let skView = self.view! as SKView
                skView.ignoresSiblingOrder = true
                scene.scaleMode = .resizeFill
                scene.size = skView.bounds.size
                skView.presentScene(scene)
            }
            
            //MARK: Decon button
            if self.atPoint(location) == self.deconButton{
                
                let newItem = inven.itemList[itemNum]
                upgradeItem = Upgrade(item: newItem)
                inven.addMats(maType: .lineSeg, amount: upgradeItem.lineSegV)
                inven.addMats(maType: .bolder, amount: upgradeItem.BolderV)
                inven.addMats(maType: .cornerP, amount: upgradeItem.CornPiV)
                inven.gold = inven.gold + upgradeItem.goldV
                
                inven.itemList.remove(at: itemNum)
                
                
                inven.countMats()
                
                resetScene()
                
            }
            //MARK: upgrade button
            if self.atPoint(location) == self.upgradeButton{
                inven.countMats()
                let newItem = inven.itemList[itemNum]
                upgradeItem = Upgrade(item: newItem)
                
                if (upgradeItem.BolderCost >= inven.Bcount)
                {
                    print("ERROR bolder")
                    
                }
                else if (upgradeItem.lineSegCost >= inven.LScount)
                {
                    print("ERROR LS ")
                }
                else if (upgradeItem.CornPiCost >= inven.CPcount)
                {
                    print("ERROR CP")
                }
                else if (upgradeItem.goldCost >= inven.gold)
                {
                    print("ERROR GOLD")
                    print(upgradeItem.goldCost)
                    print(inven.gold)
                }
                else
                {
                    inven.removeMat(maType: .lineSeg, amount: upgradeItem.lineSegCost)
                    inven.removeMat(maType: .bolder, amount: upgradeItem.BolderCost)
                    inven.removeMat(maType: .cornerP, amount: upgradeItem.CornPiCost)
                    inven.gold = inven.gold - upgradeItem.goldCost
                    inven.itemList[itemNum] = upgradeItem.upgradeItem
                    updateSelectedWords(sItem: inven.itemList[itemNum])
                    resetScene()
                }
                
                
            }
            
            //MARK: Inventory Item selection and all that
            var k = 0
            for item  in inven.itemList
            {
                if self.atPoint(location) == item.itemNode {
                    item.changeColor(nColor: UIColor.black)
                    upgradeItem = Upgrade(item: item)
                    updateSelectedWords(sItem: item)
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
    
    func updateSelectedWords (sItem: Items)
    {
        self.ItemTl.text = sItem.name
        self.ItemHPTl.text = "Health: \(sItem.health) UPGRADE \(upgradeItem.upgradeItem.health)"
        self.ItemAttTl.text = "Attack: \(sItem.attack) UPGRADE \(upgradeItem.upgradeItem.attack)"
        self.ItemDefTl.text = "Defense: \(sItem.defense) UPGRADE \(upgradeItem.upgradeItem.defense)"
        self.ItemSpdTl.text = "Speed: \(sItem.speed) UPGRADE \(upgradeItem.upgradeItem.speed)"
        self.ItemRarityTl.text = "Rarity: \(sItem.rarity!)"
        self.ItemLvlTl.text = "Item Level: \(sItem.itemLevel) UPGRADE +1"
        
        self.uLSTL.text = "Line Segments: \(upgradeItem.lineSegCost)"
        self.uBTL.text = "Bolders: \(upgradeItem.BolderCost)"
        self.uCPTL.text = "Corner Pieces: \(upgradeItem.CornPiCost)"
        self.uGTL.text = "Gold: \(upgradeItem.goldCost)"
        
        self.dLSTL.text = "Line Segments: \(upgradeItem.lineSegV)"
        self.dBTL.text = "Bolders: \(upgradeItem.BolderV)"
        self.dCPTL.text = "Corner Pieces: \(upgradeItem.CornPiV)"
        self.dGTL.text = "Gold: \(upgradeItem.goldV)"
        
        updateMats()
        
    }
    func updateMats()
    {
        inven.countMats()
        
        self.yLSTL.text = "Line segments: \(inven.LScount)"
        self.yBTL.text = "Bolders: \(inven.Bcount)"
        self.yCPTL.text = "Corner Pieces: \(inven.CPcount)"
        self.yGTL.text = "Gold: \(inven.gold)"
    }
    func clearTB()
    {
        self.ItemTl.text = ""
        self.ItemHPTl.text = ""
        self.ItemAttTl.text = ""
        self.ItemDefTl.text = ""
        self.ItemSpdTl.text = ""
        self.ItemRarityTl.text = ""
        self.ItemLvlTl.text = ""
        
        self.uLSTL.text = ""
        self.uBTL.text = ""
        self.uCPTL.text = ""
        self.uGTL.text = ""
        
        self.dLSTL.text = ""
        self.dBTL.text = ""
        self.dCPTL.text = ""
        self.dGTL.text = ""
        
        
        
        
    }
    
    override func update(_ currentTime: TimeInterval) {
        
        
        
        
    }
    
}

