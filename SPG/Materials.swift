//
//  Materials.swift
//  SPG
//
//  Created by Student on 2016-12-09.
//  Copyright © 2016 WestNet. All rights reserved.
//

import Foundation
import SpriteKit

enum matTypes{
    case lineSeg
    case bolder
    case cornerP
}

class Material {
    
    
    var name = String("")
    var buyPrice = Double(0)
    var sellPrice = Double(0)
    var materialType = matTypes.bolder
    var xSize = Double(0)
    var ySize = Double(0)
    var xPos = Double(0)
    var yPos = Double(0)
    var materialNode = SKShapeNode()
    var materialPos = CGPoint()
    var baseLineSegPrice = Int32(10)
    var materialColor = UIColor.clear
    var amount = Int32(0)
    
    init (materialType: matTypes)
    {
        xSize = 60
        ySize = 60
        switch materialType {
        case .lineSeg:
            self.createLineSegMat()
        case .bolder:
            self.createBolderMat()
        case .cornerP:
            self.createCornerPieceMat()
            
            
        }
    }
    
    func createLineSegMat()
    {
        self.name = "Line Segment"
        self.buyPrice = Double(baseLineSegPrice)
        self.sellPrice = Double(self.buyPrice * (0.5))
        self.materialColor = UIColor.brown
        self.materialType = matTypes.lineSeg
    }
    
    func createBolderMat()
    {
        self.name = "Bolder"
        self.buyPrice = Double(baseLineSegPrice)
        self.sellPrice = Double(self.buyPrice * (0.5))
        self.materialColor = UIColor.brown
        self.materialType = matTypes.bolder
    }
    
    func createCornerPieceMat()
    {
        self.name = "Corner Piece"
        self.buyPrice = Double(baseLineSegPrice)
        self.sellPrice = Double(self.buyPrice * (0.5))
        self.materialColor = UIColor.brown
        self.materialType = matTypes.cornerP
    }
    
    
    func setPositons (xP: Double,yP: Double)
    {
        
        
        xPos = xP
        yPos = yP
        materialNode = SKShapeNode(rectOf: CGSize(width: self.xSize, height: ySize))
        materialPos = CGPoint(x: self.xPos, y: self.yPos)
        materialNode.name = "materialBlocks"
        materialNode.fillColor = self.materialColor
        materialNode.position = CGPoint(x: xP,y: yP )
        materialNode.zPosition = 100
    }
}
