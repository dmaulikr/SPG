//
//  ShopBuyScene.swift
//  SPG
//
//  Created by Student on 2016-12-10.
//  Copyright © 2016 WestNet. All rights reserved.
//
import SpriteKit

import Foundation
class ShopBuyScene : SKScene, SKPhysicsContactDelegate, UITextFieldDelegate
{
    // The data from other stuff and the shared data and all that fun stuff
    var shopKeep = Shop.SIShop
    var heroI = HeroStats.SIHero
    var invenI = Inventory.SIinven
    var itemNum = 0
    // Font Sizes
    let sceneTitleSize = CGFloat(72)
    let informationTitleSize = CGFloat(32)
    let informationSize = CGFloat(24)
        var goldTl = SKLabelNode(fontNamed: "Chalkduster")
    
        var buyNode = [SKShapeNode]()
    
    var ItemTl = [SKLabelNode(fontNamed: "Chalkduster")]
    var ItemHPTl = [SKLabelNode(fontNamed: "Chalkduster")]
    var ItemAttTl = [SKLabelNode(fontNamed: "Chalkduster")]
    var ItemDefTl = [SKLabelNode(fontNamed: "Chalkduster")]
    var ItemSpdTl = [SKLabelNode(fontNamed: "Chalkduster")]
    var ItemRarityTl = [SKLabelNode(fontNamed: "Chalkduster")]
    var ItemLvlTl = [SKLabelNode(fontNamed: "Chalkduster")]
    var ItemPrice = [SKLabelNode(fontNamed: "Chalkduster")]
    
        let mainMenuButton = SKSpriteNode(imageNamed:"play")
            let sellButton = SKSpriteNode(imageNamed:"play")
    
    var itemInfoBoxX = CGFloat(0)
    var itemInfoBoxY = CGFloat(0)
    var spaceBetweenitemInfoY = CGFloat(0)
    var spaceBetweenitemInfoX = CGFloat(0)
    var buyNodeHeight = Double(0)
    var buyNodeWidth = Double(0)
    var selectitemBoxY = CGFloat(0)
    
let numberXInfos = Double(4)
    
    
    override func didMove(to view: SKView) {
        
        itemInfoBoxX = (self.frame.minX )
        itemInfoBoxY = (self.frame.maxY - 40)
        
        buyNodeWidth = Double(self.frame.size.width / 4) - 10
        buyNodeHeight = Double(60)

        spaceBetweenitemInfoY = -30
        spaceBetweenitemInfoX = (self.frame.size.width / CGFloat(2))
        selectitemBoxY = (self.frame.size.height / CGFloat(3))
        
        spaceBetweenitemInfoY = -30
        spaceBetweenitemInfoX = (self.frame.midX / 2)
        
        selectitemBoxY = (self.frame.maxY - 40)
        
        
        // The labels and all that
        
        for _ in 0...3 {
            ItemTl.append(SKLabelNode(fontNamed: "Chalkduster"))
            ItemHPTl.append(SKLabelNode(fontNamed: "Chalkduster"))
            ItemAttTl.append(SKLabelNode(fontNamed: "Chalkduster"))
            ItemDefTl.append(SKLabelNode(fontNamed: "Chalkduster"))
            ItemSpdTl.append(SKLabelNode(fontNamed: "Chalkduster"))
            ItemRarityTl.append(SKLabelNode(fontNamed: "Chalkduster"))
            ItemLvlTl.append(SKLabelNode(fontNamed: "Chalkduster"))
            ItemPrice.append(SKLabelNode(fontNamed: "Chalkduster"))

            buyNode.append(SKShapeNode(rectOf: CGSize(width: buyNodeWidth, height: buyNodeHeight)))
        }
        
        
        // This is for the selected Items and all that Fun stuff
        var counter : Int
        var i: Double
        i = 0
        var j: Double
        j = 0
        counter = 0
        //MARK: potion name
        for name in ItemTl
        {


            name.text = shopKeep.itemShopList[counter].name
            name.fontSize = 32
            name.fontColor  = UIColor.orange
            name.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
            name.position = CGPoint(x: itemInfoBoxX + (spaceBetweenitemInfoX * CGFloat(i)), y:  (itemInfoBoxY) - (selectitemBoxY * CGFloat(j)))
            name.zPosition = 1
            self.addChild(name)
            counter = counter + 1
            i = i + 1
            if (i == numberXInfos)
            {
                j = j + 1
                i = 0
            }
        }
        //MARK: potion Desc
        i = 0
        j = 0
        counter = 0
        for hp in ItemHPTl
        {
            
            
            hp.text = "Health \(shopKeep.itemShopList[counter].health)"
            hp.fontSize = 32
            hp.fontColor  = UIColor.orange
            hp.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
            hp.position = CGPoint(x: itemInfoBoxX + (spaceBetweenitemInfoX * CGFloat(i)), y:  (itemInfoBoxY) - (selectitemBoxY * CGFloat(j)) + (spaceBetweenitemInfoY * 1))
            hp.zPosition = 1
            self.addChild(hp)
            counter = counter + 1
            i = i + 1
            if (i == numberXInfos)
            {
                j = j + 1
                i = 0
            }
        }
        
        //MARK: potion quant
        //MARK: potion Desc
        i = 0
        j = 0
        counter = 0
        for att in ItemAttTl
        {
            
            
            att.text = "Attack \(shopKeep.itemShopList[counter].attack)"
            att.fontSize = 32
            att.fontColor  = UIColor.orange
            att.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
            att.position = CGPoint(x: itemInfoBoxX + (spaceBetweenitemInfoX * CGFloat(i)), y:  (itemInfoBoxY) - (selectitemBoxY * CGFloat(j)) + (spaceBetweenitemInfoY * 2))
            att.zPosition = 1
            self.addChild(att)
            counter = counter + 1
            i = i + 1
            if (i == numberXInfos)
            {
                j = j + 1
                i = 0
            }
        }
        //MARK: potion Price
        i = 0
        j = 0
        counter = 0
        for def in ItemDefTl
        {
            
            
            def.text = "Defense \(shopKeep.itemShopList[counter].defense)"
            def.fontSize = 32
            def.fontColor  = UIColor.orange
            def.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
            def.position = CGPoint(x: itemInfoBoxX + (spaceBetweenitemInfoX * CGFloat(i)), y:  (itemInfoBoxY) - (selectitemBoxY * CGFloat(j)) + (spaceBetweenitemInfoY * 3))
            def.zPosition = 1
            self.addChild(def)
            counter = counter + 1
            i = i + 1
            if (i == numberXInfos)
            {
                j = j + 1
                i = 0
            }
        }
        
        //MARK: potion effective numbers
        //MARK: potion Price
        i = 0
        j = 0
        counter = 0
        for spd in ItemSpdTl
        {
            
            
            spd.text = "Speed \(shopKeep.itemShopList[counter].speed)"
            spd.fontSize = 32
            spd.fontColor  = UIColor.orange
            spd.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
            spd.position = CGPoint(x: itemInfoBoxX + (spaceBetweenitemInfoX * CGFloat(i)), y:  (itemInfoBoxY) - (selectitemBoxY * CGFloat(j)) + (spaceBetweenitemInfoY * 4))
            spd.zPosition = 1
            self.addChild(spd)
            counter = counter + 1
            i = i + 1
            if (i == numberXInfos)
            {
                j = j + 1
                i = 0
            }
        }
        
        //MARK: potion effective numbers
        //MARK: potion Price
        i = 0
        j = 0
        counter = 0
        for rarity in ItemRarityTl
        {
            
            
            rarity.text = "Rarity \(shopKeep.itemShopList[counter].rarity!)"
            rarity.fontSize = 32
            rarity.fontColor  = UIColor.orange
            rarity.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
            rarity.position = CGPoint(x: itemInfoBoxX + (spaceBetweenitemInfoX * CGFloat(i)), y:  (itemInfoBoxY) - (selectitemBoxY * CGFloat(j)) + (spaceBetweenitemInfoY * 5))
            rarity.zPosition = 1
            self.addChild(rarity)
            counter = counter + 1
            i = i + 1
            if (i == numberXInfos)
            {
                j = j + 1
                i = 0
            }
        }
        
        //MARK: potion effective numbers
        //MARK: potion Price
        i = 0
        j = 0
        counter = 0
        for iLvl in ItemLvlTl
        {
            
            
            iLvl.text = "Item Level \(shopKeep.itemShopList[counter].itemLevel)"
            iLvl.fontSize = 32
            iLvl.fontColor  = UIColor.orange
            iLvl.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
            iLvl.position = CGPoint(x: itemInfoBoxX + (spaceBetweenitemInfoX * CGFloat(i)), y:  (itemInfoBoxY) - (selectitemBoxY * CGFloat(j)) + (spaceBetweenitemInfoY * 6))
            iLvl.zPosition = 1
            self.addChild(iLvl)
            counter = counter + 1
            i = i + 1
            if (i == numberXInfos)
            {
                j = j + 1
                i = 0
            }
        }
        //MARK: potion Price
        i = 0
        j = 0
        counter = 0
        for price in ItemPrice
        {
            
            
            price.text = "Buy for  \(shopKeep.itemShopList[counter].buyPrice)"
            price.fontSize = 32
            price.fontColor  = UIColor.orange
            price.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
            price.position = CGPoint(x: itemInfoBoxX + (spaceBetweenitemInfoX * CGFloat(i)), y:  (itemInfoBoxY) - (selectitemBoxY * CGFloat(j)) + (spaceBetweenitemInfoY * 7))
            price.zPosition = 1
            self.addChild(price)
            counter = counter + 1
            i = i + 1
            if (i == numberXInfos)
            {
                j = j + 1
                i = 0
            }
        }

        //MARK: Buy Buttons
        i = 0
        j = 0
        counter = 0
        for buy in buyNode
        {

            buy.name = "buy\(counter)"
            buy.fillColor = UIColor.green
            buy.position = CGPoint(x: itemInfoBoxX + (spaceBetweenitemInfoX * CGFloat(i)) + CGFloat((buyNodeWidth * 0.5)), y:  (itemInfoBoxY) - (selectitemBoxY * CGFloat(j)) + (spaceBetweenitemInfoY * 5) - 100)
            buy.zPosition = 1
            self.addChild(buy)
            counter = counter + 1
            i = i + 1
            if (i == numberXInfos)
            {
                j = j + 1
                i = 0
            }
        }
        

        //MARK: Button positions
        self.mainMenuButton.position = CGPoint(x: self.frame.maxX - (mainMenuButton.size.width / 2),y: self.frame.minY + mainMenuButton.size.height / 2)
        mainMenuButton.zPosition = 1
self.addChild(mainMenuButton)
        self.sellButton.position = CGPoint(x: self.frame.maxX - (sellButton.size.width * 1.5),y: self.frame.minY + sellButton.size.height / 2)
        sellButton.zPosition = 1
        self.addChild(sellButton)
        
        goldTl.text = "Gold: \(invenI.gold)"
        goldTl.fontSize = 32
        goldTl.fontColor  = UIColor.orange
        goldTl.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
        goldTl.position = CGPoint(x: self.frame.maxX - (sellButton.size.width * 1.5),y: self.frame.minY + sellButton.size.height * 2)
        goldTl.zPosition = 1
        self.addChild(goldTl)
        
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch : AnyObject in touches {
            let location = touch.location(in: self)
            
            
            //MARK: Main Menu Button
            if self.atPoint(location) == self.mainMenuButton{
                let scene = MainMenuScene(size: self.size)
                let skView = self.view! as SKView
                skView.ignoresSiblingOrder = true
                scene.scaleMode = .resizeFill
                scene.size = skView.bounds.size
                skView.presentScene(scene)
            }
            
                        var k = 0
            for buyItem  in buyNode
            {
                if self.atPoint(location) == buyItem {

                    if (invenI.gold > shopKeep.itemShopList[k].buyPrice)
                    {
                        invenI.addItem(nItem: shopKeep.itemShopList[k])
        goldTl.text = "Gold: \(invenI.gold)"
                    }
                    
                }
                else
                {

                    
                }
                k = k + 1
                
            }
            
        }
    }
}

