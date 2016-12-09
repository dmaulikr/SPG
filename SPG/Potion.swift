//
//  Potion.swift
//  SPG
//
//  Created by Student on 2016-12-08.
//  Copyright © 2016 WestNet. All rights reserved.
//

import Foundation
import SpriteKit

enum potionTypes{
    case reDraw
    case reSize
    case sharpness
    case boldness
    case quickDraw
    
}

class Potion {
    
    var potionType = (potionTypes.reDraw)
    var name = String("")
    var description = String("")
    var effectNum = Double(0)
    var size = Int32(1)
    var buyPrice = Double(0)
    var sellPrice = Double(0)
    
    var xSize = Double(0)
    var ySize = Double(0)
    var xPos = Double(0)
    var yPos = Double(0)
    
    var potionNode = SKShapeNode()
    var potionPos = CGPoint()
    
    var potionColor = UIColor.clear
    
    init (potionType: potionTypes, size: Int32)
    {
        xSize = 60
        ySize = 60
        switch potionType {
        case .reDraw:
            self.createReDrawPot(nSize: size)
        case .reSize:
            createReSizePot(nSize: size)
        case .sharpness:
            createSharpnessPot(nSize: size)
        case .boldness:
            createBoldnessPot(nSize: size)
        case .quickDraw:
            createQuickDrawPot(nSize: size)
        }
    }
    
    func createReDrawPot(nSize: Int32)
    {
        self.name = "Redraw Potion \(nSize)"
        self.description = "Revives you after death."
        self.effectNum = 0
        self.size = nSize
        self.buyPrice = Double((10 * nSize) + (nSize * 6))
        self.sellPrice = Double(self.buyPrice * (0.5))
        self.potionColor = UIColor.brown
        self.potionType = potionTypes.reDraw
    }
    func createReSizePot(nSize: Int32)
    {
        self.name = "Resize Potion \(nSize)"
        self.description = "Restores health to the player."
        self.effectNum = Double(10 * nSize)
        self.size = nSize
        self.buyPrice = Double((10 * nSize) + (nSize * 2))
        self.sellPrice = Double(self.buyPrice * (0.5))
        self.potionColor = UIColor.red
        self.potionType = potionTypes.reSize
    }
    func createSharpnessPot(nSize: Int32)
    {
        self.name = "Sharpness Potion \(nSize)"
        self.description = "Increases the attack of the player."
        self.effectNum = Double(10 * nSize)
        self.size = nSize
        self.buyPrice = Double((10 * nSize) + (nSize * 2))
        self.sellPrice = Double(self.buyPrice * (0.5))
        self.potionColor = UIColor.blue
        self.potionType = potionTypes.sharpness
    }
    func createBoldnessPot(nSize: Int32)
    {
        self.name = "Boldness Potion \(nSize)"
        self.description = "Increases the defense of the player."
        self.effectNum = Double(10 * nSize)
        self.size = nSize
        self.buyPrice = Double((10 * nSize) + (nSize * 2))
        self.sellPrice = Double(self.buyPrice * (0.5))
        self.potionColor = UIColor.blue
        self.potionType = potionTypes.boldness
    }
    func createQuickDrawPot(nSize: Int32)
    {
        self.name = "Quick Draw Potion \(nSize)"
        self.description = "Increases the speed of the player."
        self.effectNum = Double(10 * nSize)
        self.size = nSize
        self.buyPrice = Double((10 * nSize) + (nSize * 2))
        self.sellPrice = Double(self.buyPrice * (0.5))
        self.potionColor = UIColor.black
        self.potionType = potionTypes.quickDraw
    }
    func setPositons (xP: Double,yP: Double)
    {
        
        
        xPos = xP
        yPos = yP
        potionNode = SKShapeNode(rectOf: CGSize(width: self.xSize, height: ySize))
        potionPos = CGPoint(x: self.xPos, y: self.yPos)
        potionNode.name = "potionBlocks"
        potionNode.fillColor = self.potionColor
        potionNode.position = CGPoint(x: xP,y: yP )
        potionNode.zPosition = 100
        
    }
    
    
    
}
