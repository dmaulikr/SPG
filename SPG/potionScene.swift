//
//  potionScene.swift
//  SPG
//
//  Created by Student on 2016-12-08.
//  Copyright © 2016 WestNet. All rights reserved.
//

import Foundation
import SpriteKit

// This is the games scene and all that jazz
class potionScene : SKScene, SKPhysicsContactDelegate, UITextFieldDelegate
{
    // Font Sizes
    let sceneTitleSize = CGFloat(72)
    let informationTitleSize = CGFloat(32)
    let informationSize = CGFloat(24)
    
    
    var spaceBetweenInfo = CGFloat(0)
    var potionInfoBoxX = CGFloat(0)
    var potionInfoBoxY = CGFloat(0)
    var spaceBetweenPotionInfoY = CGFloat(0)
    var spaceBetweenPotionInfoX = CGFloat(0)
    
    let maxItemsOnPage = Int32(20)
    
    // The Background
    let bg = SKSpriteNode(imageNamed:"bg")
    
    // The hero / Square
    //let hero = SKSpriteNode(imageNamed:"square")
    
    // Title of the screen
    //let InventoryTl = SKLabelNode(fontNamed: "Chalkduster")
    
    // These are all the labels for the players Items and all the fun stuff WEEE
    var potionNameTl = [SKLabelNode(fontNamed: "Chalkduster")]
    var potionDescTl = [SKLabelNode(fontNamed: "Chalkduster")]
    var potionQuanTl = [SKLabelNode(fontNamed: "Chalkduster")]
    var potionEffNTl = [SKLabelNode(fontNamed: "Chalkduster")]
    var potionPriceTl = [SKLabelNode(fontNamed: "Chalkduster")]
        var goldTl = SKLabelNode(fontNamed: "Chalkduster")
    
    var sizeSelector = Int32(1)
    var buyNode = [SKShapeNode]()
    
    var sellNode = [SKShapeNode]()
    
    var incSizeNode = SKShapeNode()
    var decSizeNode = SKShapeNode()
    
    var buyNodeHeight = Double(0)
    var buyNodeWidth = Double(0)
    
    
    
    
    
    
    // Buttons on the bottom Like Adventure and leave and all that jazz
    let mainMenuButton = SKSpriteNode(imageNamed:"play")
    let backButton = SKSpriteNode(imageNamed:"about")
    
    var inven = Inventory.SIinven
    
    var baseItemPage = Int32(0)
    
    var heroInfo = HeroStats()
    
    var selectPotionBoxY = CGFloat(0)
    
    var potionInfoList = [Potion]()
    
    override func didMove(to view: SKView) {
        //buyNode = rectOf: CGSize(width: buyNodeWidth, height: buyNodeHeight)
        // buyNode.name = "buyPotionBlocks"
        // buyNode.fillColor = UIColor.green
        // buyNode.position = CGPoint(x: xP,y: yP )
        // buyNode.zPosition = 100
        
        buyNodeWidth = Double(self.frame.size.width / 4) - 10
        buyNodeHeight = Double(60)
        
        incSizeNode = SKShapeNode(rectOf: CGSize(width: buyNodeWidth, height: buyNodeHeight + 30))
        decSizeNode = SKShapeNode(rectOf: CGSize(width: buyNodeWidth, height: buyNodeHeight + 30))
        // Making 5 potion labels for the different types of potions and all that jazz
        for _ in 0...3 {
            potionNameTl.append(SKLabelNode(fontNamed: "Chalkduster"))
            potionDescTl.append(SKLabelNode(fontNamed: "Chalkduster"))
            potionQuanTl.append(SKLabelNode(fontNamed: "Chalkduster"))
            potionEffNTl.append(SKLabelNode(fontNamed: "Chalkduster"))
            potionPriceTl.append(SKLabelNode(fontNamed: "Chalkduster"))
            buyNode.append(SKShapeNode(rectOf: CGSize(width: buyNodeWidth, height: buyNodeHeight)))
            sellNode.append(SKShapeNode(rectOf: CGSize(width: buyNodeWidth, height: buyNodeHeight)))
        }
        buyNode.append(SKShapeNode(rectOf: CGSize(width: buyNodeWidth, height: buyNodeHeight)))
        sellNode.append(SKShapeNode(rectOf: CGSize(width: buyNodeWidth, height: buyNodeHeight)))
        
        potionInfoList.append(Potion(potionType: potionTypes.reDraw,size: 1))
        potionInfoList.append(Potion(potionType: potionTypes.reSize,size: 1))
        potionInfoList.append(Potion(potionType: potionTypes.sharpness,size: 1))
        potionInfoList.append(Potion(potionType: potionTypes.boldness,size: 1))
        potionInfoList.append(Potion(potionType: potionTypes.quickDraw,size: 1))
        
        
        // Setting the Item info box postions and all that Zazz
        
        potionInfoBoxX = (self.frame.minX )
        potionInfoBoxY = (self.frame.maxY - 40)
        spaceBetweenPotionInfoY = -30
        spaceBetweenPotionInfoX = (self.frame.size.width / CGFloat(2))
        
        
        selectPotionBoxY = (self.frame.size.height / CGFloat(3))
        
        SoundPlayer.sharedHelper.playBackgroundMusic()
        heroInfo = HeroStats.SIHero
        heroInfo.updateStats()
        bg.size.height = self.size.height
        bg.size.width = self.size.width
        self.bg.position = CGPoint(x: self.frame.midX,y: self.frame.midY)
        self.bg.zPosition = 0
        
        
        
        // This is for the selected Items and all that Fun stuff
        var counter = Int32(0)
        var i: Double
        i = 0
        var j: Double
        j = 0
        //MARK: potion name
        for pot in potionNameTl
        {
            var tempPot = Potion(potionType: potionTypes.boldness, size: sizeSelector)
            switch counter {
            case 0:
                tempPot = potionInfoList[0]
            case 1:
                tempPot = potionInfoList[1]
            case 2:
                tempPot = potionInfoList[2]
            case 3:
                tempPot = potionInfoList[3]
            case 4:
                tempPot = potionInfoList[4]
            default:
                break
            }
            pot.text = tempPot.name
            pot.fontSize = 32
            pot.fontColor  = UIColor.orange
            pot.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
            pot.position = CGPoint(x: potionInfoBoxX + (spaceBetweenPotionInfoX * CGFloat(i)), y:  (potionInfoBoxY) - (selectPotionBoxY * CGFloat(j)))
            pot.zPosition = 1
            self.addChild(pot)
            counter = counter + 1
            i = i + 1
            if (i == 2)
            {
                j = j + 1
                i = 0
            }
        }
        //MARK: potion Desc
        i = 0
        j = 0
        counter = 0
        for pot in potionDescTl
        {
            var tempPot = Potion(potionType: potionTypes.boldness, size: sizeSelector)
            switch counter {
            case 0:
                tempPot = potionInfoList[0]
            case 1:
                tempPot = potionInfoList[1]
            case 2:
                tempPot = potionInfoList[2]
            case 3:
                tempPot = potionInfoList[3]
            case 4:
                tempPot = potionInfoList[4]
            default:
                break
            }
            pot.text = tempPot.description
            pot.fontSize = 24
            pot.fontColor  = UIColor.orange
            pot.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
            pot.position = CGPoint(x: potionInfoBoxX + (spaceBetweenPotionInfoX * CGFloat(i)), y:  (potionInfoBoxY) - (selectPotionBoxY * CGFloat(j)) + spaceBetweenPotionInfoY)
            pot.zPosition = 1
            self.addChild(pot)
            counter = counter + 1
            i = i + 1
            if (i == 2)
            {
                j = j + 1
                i = 0
            }
        }
        
        //MARK: potion quant
        i = 0
        j = 0
        counter = 0
        for pot in potionQuanTl
        {
            var tempPot = Potion(potionType: potionTypes.boldness, size: sizeSelector)
            switch counter {
            case 0:
                tempPot = potionInfoList[0]
            case 1:
                tempPot = potionInfoList[1]
            case 2:
                tempPot = potionInfoList[2]
            case 3:
                tempPot = potionInfoList[3]
            case 4:
                tempPot = potionInfoList[4]
            default:
                break
            }
            var quant = Int32(0)
            for sPot in inven.potionList
            {
                if (sPot.potionType == tempPot.potionType)
                {
                    quant = quant + 1
                }
            }
            pot.text = "Quantity: \(quant)"
            pot.fontSize = 24
            pot.fontColor  = UIColor.orange
            pot.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
            pot.position = CGPoint(x: potionInfoBoxX + (spaceBetweenPotionInfoX * CGFloat(i)), y:  (potionInfoBoxY) - (selectPotionBoxY * CGFloat(j)) + (spaceBetweenPotionInfoY * 2))
            pot.zPosition = 1
            self.addChild(pot)
            counter = counter + 1
            i = i + 1
            if (i == 2)
            {
                j = j + 1
                i = 0
            }
        }
        
        //MARK: potion Price
        i = 0
        j = 0
        counter = 0
        for pot in potionPriceTl
        {
            var tempPot = Potion(potionType: potionTypes.boldness, size: sizeSelector)
            switch counter {
            case 0:
                tempPot = potionInfoList[0]
            case 1:
                tempPot = potionInfoList[1]
            case 2:
                tempPot = potionInfoList[2]
            case 3:
                tempPot = potionInfoList[3]
            case 4:
                tempPot = potionInfoList[4]
            default:
                break
            }
            
            pot.text = "Buy: \(tempPot.buyPrice) Sell: \(tempPot.sellPrice)"
            pot.fontSize = 24
            pot.fontColor  = UIColor.orange
            pot.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
            pot.position = CGPoint(x: potionInfoBoxX + (spaceBetweenPotionInfoX * CGFloat(i)), y:  (potionInfoBoxY) - (selectPotionBoxY * CGFloat(j)) + (spaceBetweenPotionInfoY * 3))
            pot.zPosition = 1
            self.addChild(pot)
            counter = counter + 1
            i = i + 1
            if (i == 2)
            {
                j = j + 1
                i = 0
            }
        }
        
        //MARK: potion effective numbers
        i = 0
        j = 0
        counter = 0
        for pot in potionEffNTl
        {
            var tempPot = Potion(potionType: potionTypes.boldness, size: sizeSelector)
            switch counter {
            case 0:
                tempPot = potionInfoList[0]
                pot.text = "Revives once"
            case 1:
                tempPot = potionInfoList[1]
                pot.text = "Heals for \(tempPot.effectNum)"
            case 2:
                tempPot = potionInfoList[2]
                pot.text = "Increases attack by \(tempPot.effectNum)"
            case 3:
                tempPot = potionInfoList[3]
                pot.text = "Increases defense by \(tempPot.effectNum)"
            case 4:
                tempPot = potionInfoList[4]
                pot.text = "Increases speed by \(tempPot.effectNum)"
            default:
                break
            }
            
            
            pot.fontSize = 24
            pot.fontColor  = UIColor.orange
            pot.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
            pot.position = CGPoint(x: potionInfoBoxX + (spaceBetweenPotionInfoX * CGFloat(i)), y:  (potionInfoBoxY) - (selectPotionBoxY * CGFloat(j)) + (spaceBetweenPotionInfoY * 4) )
            pot.zPosition = 1
            self.addChild(pot)
            counter = counter + 1
            i = i + 1
            if (i == 2)
            {
                j = j + 1
                i = 0
            }
        }
        //MARK: Sell buttons
        i = 0
        j = 0
        counter = 0
        for sell in sellNode
        {
            sell.name = "buyPotionBlocks"
            sell.fillColor = UIColor.red
            sell.position = CGPoint(x: potionInfoBoxX + (spaceBetweenPotionInfoX * CGFloat(i)) + CGFloat((buyNodeWidth / 2)) + CGFloat(5), y:  (potionInfoBoxY) - (selectPotionBoxY * CGFloat(j)) + (spaceBetweenPotionInfoY * 5) - 10)
            sell.zPosition = 1
            self.addChild(sell)
            counter = counter + 1
            i = i + 1
            if (i == 2)
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
            var tempPot = Potion(potionType: potionTypes.boldness, size: sizeSelector)
            switch counter {
            case 0:
                tempPot = potionInfoList[0]
            case 1:
                tempPot = potionInfoList[1]
            case 2:
                tempPot = potionInfoList[2]
            case 3:
                tempPot = potionInfoList[3]
            case 4:
                tempPot = potionInfoList[4]
            default:
                break
            }
            buy.name = "buy\(tempPot.name)"
            buy.fillColor = UIColor.green
            buy.position = CGPoint(x: potionInfoBoxX + (spaceBetweenPotionInfoX * CGFloat(i)) + CGFloat((buyNodeWidth * 1.5)), y:  (potionInfoBoxY) - (selectPotionBoxY * CGFloat(j)) + (spaceBetweenPotionInfoY * 5) - 10)
            buy.zPosition = 1
            self.addChild(buy)
            counter = counter + 1
            i = i + 1
            if (i == 2)
            {
                j = j + 1
                i = 0
            }
        }
        
        //MARK: increas size button khjkhk
        incSizeNode.name = "incSize"
        incSizeNode.fillColor = UIColor.blue
        incSizeNode.position = CGPoint(x: potionInfoBoxX + (spaceBetweenPotionInfoX * CGFloat(1)) + CGFloat((buyNodeWidth * 1.5)), y:  (potionInfoBoxY) - (selectPotionBoxY * CGFloat(1)) + (spaceBetweenPotionInfoY * 5) - CGFloat(buyNodeHeight + 90))
        incSizeNode.zPosition = 1
        self.addChild(incSizeNode)
        
        //MARK: dec size button
        decSizeNode.name = "incSize"
        decSizeNode.fillColor = UIColor.black
        decSizeNode.position = CGPoint(x: potionInfoBoxX + (spaceBetweenPotionInfoX * CGFloat(1)) + CGFloat((buyNodeWidth / 2)), y:  (potionInfoBoxY) - (selectPotionBoxY * CGFloat(1)) + (spaceBetweenPotionInfoY * 5) - CGFloat(buyNodeHeight + 90))
        decSizeNode.zPosition = 1
        self.addChild(decSizeNode)
        
        //MARK: Button positions
        self.mainMenuButton.position = CGPoint(x: self.frame.maxX - (mainMenuButton.size.width / 2),y: self.frame.minY + mainMenuButton.size.height / 2)
        mainMenuButton.zPosition = 1
        
        self.backButton.position = CGPoint(x: self.frame.minX + (backButton.size.width / 2),y: self.frame.minY + backButton.size.height / 2)
        backButton.zPosition = 1
        
        goldTl.text = "Gold: \(inven.gold)"
        goldTl.fontSize = 32
        goldTl.fontColor  = UIColor.orange
        goldTl.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
        goldTl.position = CGPoint(x: potionInfoBoxX + (spaceBetweenPotionInfoX * CGFloat(1)), y:  (potionInfoBoxY) - (selectPotionBoxY * CGFloat(2)) + (spaceBetweenPotionInfoY * 4) )
        goldTl.zPosition = 1
        self.addChild(goldTl)
        
        
        
        
        
        
        //MARK: Adding player Items
        // The first Item and all that fun stuff
        heroInfo.item1.setPositons(xP: Double(self.frame.midX) + ((heroInfo.item1.xSize + 20) * (0)), yP: (Double(self.frame.midY) + (heroInfo.item1.xSize + 20)) - (heroInfo.item1.xSize + 20) * 3 )
        
        
        
        
        
        // self.addChild(self.InventoryTl)
        self.addChild(self.bg)
        self.addChild(self.mainMenuButton)
    }
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
            
            //MARK: inc size
            if self.atPoint(location) == self.incSizeNode{
                if (sizeSelector < 5)
                {
                    sizeSelector = sizeSelector + 1
updateText()
                }
                
            }
            
            //MARK: desc size
            if self.atPoint(location) == self.decSizeNode{
                if (sizeSelector > 1)
                {
                    sizeSelector = sizeSelector - 1
                   updateText()
                }
            }
            
            //MARK: buy button selection
            var k = 0
            for buyButton  in buyNode
            {
  
                if self.atPoint(location) == buyButton {
                    switch k {
                    case 0:
                        buyPot(pot: Potion(potionType: potionTypes.reDraw, size: sizeSelector))
    updateText()
                    case 1:
                        buyPot(pot: Potion(potionType: potionTypes.reSize, size: sizeSelector))
    updateText()
                    case 2:
                        buyPot(pot: Potion(potionType: potionTypes.sharpness, size: sizeSelector))
    updateText()
                    case 3:
                        buyPot(pot: Potion(potionType: potionTypes.boldness, size: sizeSelector))
    updateText()
                    case 4:
                        buyPot(pot: Potion(potionType: potionTypes.quickDraw, size: sizeSelector))
    updateText()
                    default:
                        break
                    }
                    
                }
                else
                {
                    
                    
                }
                k = k + 1
                
            }
            k = 0
            for sellButton  in sellNode
            {
                var q = 0
                if self.atPoint(location) == sellButton {
                    switch k {
                    case 0:
                        sellPot(pot: Potion(potionType: potionTypes.reDraw, size: sizeSelector))
    updateText()
                    case 1:
                        sellPot(pot: Potion(potionType: potionTypes.reSize, size: sizeSelector))
    updateText()
                    case 2:
                        sellPot(pot: Potion(potionType: potionTypes.sharpness, size: sizeSelector))
    updateText()
                    case 3:
                        sellPot(pot: Potion(potionType: potionTypes.boldness, size: sizeSelector))
    updateText()
                    case 4:
                        sellPot(pot: Potion(potionType: potionTypes.quickDraw, size: sizeSelector))
    updateText()
                    default:
                        break
                    }
                    
                }
                else
                {
                    
                    
                }
                k = k + 1
                
            }
            
            
        }
    }
    //MARK: buy potion Func
    func buyPot(pot: Potion)
    {
        if (pot.buyPrice <= inven.gold)
        {
            inven.potionList.append(pot)
            inven.gold = inven.gold - pot.buyPrice
            print("Gold: \(inven.gold)")
            print("Potion list count: \(inven.potionList.count)")
        }
        else
        {
            print("not enough money")
        }
    }
    //MARK: sell potion Func
    func sellPot(pot: Potion)
    {
        var found = false
        var counter = 0
        for temp in inven.potionList
        {
            if (temp.name == pot.name)
            {
                if (temp.size == pot.size)
                {
                    found = true
                    break
                }
            }
            counter = counter + 1
        }
        if (found == true)
        {
            inven.potionList.remove(at: counter)
            inven.gold = inven.gold + pot.sellPrice
        }
        print("Gold: \(inven.gold)")
        print("Potion list count: \(inven.potionList.count)")
        
    }
    
    func updateText ()
    {
           goldTl.text = "Gold: \(inven.gold)"
        var counter = 0
        for potName in potionNameTl
        {
            var tempPot = Potion(potionType: potionTypes.boldness, size: sizeSelector)
            switch counter {
            case 0:
                tempPot = Potion(potionType: potionTypes.reDraw, size: sizeSelector)
            case 1:
                tempPot = Potion(potionType: potionTypes.reSize, size: sizeSelector)
            case 2:
                tempPot = Potion(potionType: potionTypes.sharpness, size: sizeSelector)
            case 3:
                tempPot = Potion(potionType: potionTypes.boldness, size: sizeSelector)
            case 4:
                tempPot = Potion(potionType: potionTypes.quickDraw, size: sizeSelector)
            default:
                break
            }
            potName.text = tempPot.name
            counter = counter + 1
        }
        var counter2 = 0
        for potEffN in potionEffNTl
        {
            var tempPot = Potion(potionType: potionTypes.boldness, size: sizeSelector)
            switch counter2 {
            case 0:
                tempPot = Potion(potionType: potionTypes.reDraw, size: sizeSelector)
                potEffN.text = "Revives once"
            case 1:
                tempPot = Potion(potionType: potionTypes.reSize, size: sizeSelector)
                potEffN.text = "Heals for \(tempPot.effectNum)"
            case 2:
                tempPot = Potion(potionType: potionTypes.sharpness, size: sizeSelector)
                potEffN.text = "Increases attack by \(tempPot.effectNum)"
            case 3:
                tempPot = Potion(potionType: potionTypes.boldness, size: sizeSelector)
                potEffN.text = "Increases defense by \(tempPot.effectNum)"
            case 4:
                tempPot = Potion(potionType: potionTypes.quickDraw, size: sizeSelector)
                potEffN.text = "Increases speed by \(tempPot.effectNum)"
            default:
                break
            }
            counter2 = counter2 + 1
        }
        var counter1 = 0
        for potPrice in potionPriceTl
        {
            var tempPot = Potion(potionType: potionTypes.boldness, size: sizeSelector)
            switch counter1 {
            case 0:
                tempPot = Potion(potionType: potionTypes.reDraw, size: sizeSelector)
            case 1:
                tempPot = Potion(potionType: potionTypes.reSize, size: sizeSelector)
            case 2:
                tempPot = Potion(potionType: potionTypes.sharpness, size: sizeSelector)
            case 3:
                tempPot = Potion(potionType: potionTypes.boldness, size: sizeSelector)
            case 4:
                tempPot = Potion(potionType: potionTypes.quickDraw, size: sizeSelector)
            default:
                break
            }
            potPrice.text = "Buy: \(tempPot.buyPrice) Sell: \(tempPot.sellPrice)"
            counter1 = counter1 + 1
        }
        counter = 0
        for pot in potionQuanTl
        {
            var tempPot = Potion(potionType: potionTypes.boldness, size: sizeSelector)
            switch counter {
            case 0:
                tempPot = Potion(potionType: potionTypes.reDraw, size: sizeSelector)
            case 1:
                tempPot = Potion(potionType: potionTypes.reSize, size: sizeSelector)
            case 2:
                tempPot = Potion(potionType: potionTypes.sharpness, size: sizeSelector)
            case 3:
                tempPot = Potion(potionType: potionTypes.boldness, size: sizeSelector)
            case 4:
                tempPot = Potion(potionType: potionTypes.quickDraw, size: sizeSelector)
            default:
                break
            }
            var quant = Int32(0)
            for sPot in inven.potionList
            {
                if (sPot.potionType == tempPot.potionType)
                {
                    if (sPot.size == tempPot.size)
                    {
                    quant = quant + 1
                    }
                }
            }
            pot.text = "Quantity: \(quant)"
            counter = counter + 1
        }
    }
    
    
}
