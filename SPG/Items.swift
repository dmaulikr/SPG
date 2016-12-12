//
//  Items.swift
//  SPG
//
//  Created by Student on 2016-11-24.
//  Copyright © 2016 WestNet. All rights reserved.
//

import Foundation
import SpriteKit
class Items {
    
    var attack = Double(0)
    var defense = Double(0)
    var health = Double(0)
    var speed = Double(0)
    var name = String()
    
    var rarity = String("Rare")
    var xSize = Double(0)
    var ySize = Double(0)
    var xPos = Double(0)
    var yPos = Double(0)
    
    var itemNode = SKShapeNode()
    var itemPos = CGPoint()
    var description : String
    
    var itemLevel : Int
    
    var buyPrice = Double(0)
    var sellPrice = Double(0)
    
    func setPositons (xP: Double,yP: Double)
    {
        
        
        xPos = xP
        yPos = yP
        itemNode = SKShapeNode(rectOf: CGSize(width: self.xSize, height: ySize))
        itemPos = CGPoint(x: self.xPos, y: self.yPos)
        itemNode.name = "itemBlocks"
        itemNode.fillColor = UIColor.orange
        itemNode.position = CGPoint(x: xP,y: yP )
        itemNode.zPosition = 100
        
    }
    
    func changeColor (nColor: UIColor)
    {
        itemNode.fillColor = nColor
    }
    
    func setStats(nName: String,nHealth:Double, nAttack: Double,nDefense: Double,nSpeed: Double)
    {
        self.name = nName
        self.attack = nAttack
        self.defense = nDefense
        self.health = nHealth
        self.speed = nSpeed
    }
    
    init()
    {
        
        xSize = Double(80)
        ySize = Double(80)
        self.name = "Sword"
        self.rarity = "Rare"
        self.itemLevel = 12
        self.attack = 69
        self.defense = 69
        self.health = 69
        self.speed = 69
        self.description = " "
        self.itemLevel = 1
        setBuyPrice()
        setSellPrice()
    }
    
    func setBuyPrice()
    {
        var rareDouble = Double (0)
        if (self.rarity == "Common")
        {
            rareDouble = 1
        }
        else if (self.rarity == "Uncommon")
        {
            rareDouble = 2
        }
        if (self.rarity == "Rare")
        {
            rareDouble = 3
        }
        else if (self.rarity == "Legendary")
        {
            rareDouble = 5
        }
    
        self.buyPrice = (self.health + self.speed + self.attack + self.defense) + (Double(self.itemLevel) * (rareDouble) )
    }
    func setSellPrice()
    {

        
        
        self.sellPrice = buyPrice / 2 
    }
    
}
