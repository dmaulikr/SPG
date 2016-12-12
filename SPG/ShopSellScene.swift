//
//  MaterialScene.swift
//  SPG
//
//  Created by Student on 2016-12-09.
//  Copyright © 2016 WestNet. All rights reserved.
//

import Foundation
import SpriteKit


class ShopSellScene : SKScene, SKPhysicsContactDelegate, UITextFieldDelegate
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
    let ItemSellTl = SKLabelNode(fontNamed: "Chalkduster")
    let yGTL = SKLabelNode(fontNamed: "Chalkduster")
    

    var deconNode = SKShapeNode()
    
    
    var potionInfoBoxX = CGFloat(0)
    var potionInfoBoxY = CGFloat(0)
    var spaceBetweenPotionInfoY = CGFloat(0)
    var spaceBetweenPotionInfoX = CGFloat(0)
    var buyNodeHeight = Double(0)
    var buyNodeWidth = Double(0)
    var selectPotionBoxY = CGFloat(0)
    let mainMenuButton = SKSpriteNode(imageNamed:"play")
    
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
        
        
        self.ItemSellTl.text = "Sell Value: "
        self.ItemSellTl.fontSize = informationSize
        self.ItemSellTl.fontColor  = UIColor.orange
        self.ItemSellTl.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
        self.ItemSellTl.position = CGPoint(x: itemInfoBoxX + (spaceBetweenItemInfoX * 0), y: itemInfoBoxY + (spaceBetweenItemInfoY * 7))
        self.ItemSellTl.zPosition = 1
              self.yGTL.text = "Gold: \(inven.gold)"
        self.yGTL.fontSize = informationSize
        self.yGTL.fontColor  = UIColor.orange
        self.yGTL.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
        self.yGTL.position = CGPoint(x: itemInfoBoxX + (spaceBetweenItemInfoX * 0), y: itemInfoBoxY + (spaceBetweenItemInfoY * 21))
        self.yGTL.zPosition = 1
        

        
        //MARK: dec size button
        deconNode.name = "incSize"
        deconNode.fillColor = UIColor.black
        deconNode.position = CGPoint(x: potionInfoBoxX + (spaceBetweenPotionInfoX * CGFloat(1)) + CGFloat((buyNodeWidth / 2)), y:  (potionInfoBoxY) - (selectPotionBoxY * CGFloat(1)) + (spaceBetweenPotionInfoY * 5) - CGFloat(buyNodeHeight + 90))
        deconNode.zPosition = 1
        self.addChild(deconNode)
        

        self.addChild(self.yGTL)

        
        
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
        let scene = ShopSellScene(size: self.size)
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
            if self.atPoint(location) == self.deconNode{
                
                let newItem = inven.itemList[itemNum]
                inven.gold = inven.gold + newItem.sellPrice

                inven.itemList.remove(at: itemNum)

                resetScene()

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
        self.ItemHPTl.text = "Health: \(sItem.health) "
        self.ItemAttTl.text = "Attack: \(sItem.attack) "
        self.ItemDefTl.text = "Defense: \(sItem.defense) "
        self.ItemSpdTl.text = "Speed: \(sItem.speed) "
        self.ItemRarityTl.text = "Rarity: \(sItem.rarity!)"
        self.ItemLvlTl.text = "Item Level: \(sItem.itemLevel) "
        self.ItemSellTl.text = "SellValue: \(sItem.sellPrice)"
        

        
        updateMats()
        
    }
    func updateMats()
    {
        inven.countMats()
        
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
        

        
        
        
        
    }
    
    override func update(_ currentTime: TimeInterval) {
        
        
        
        
    }
    
}

