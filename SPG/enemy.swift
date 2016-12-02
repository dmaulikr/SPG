//
//  enemy.swift
//  SPG
//
//  Created by Student on 2016-11-24.
//  Copyright © 2016 WestNet. All rights reserved.
//

import Foundation
import SpriteKit
class enemy {
    
    var currHealth = Double(0)
    var currAttack = Double(0)
    var currDefense = Double(0)
    
    var baseHealth = Double(0)
    var baseAttack = Double(0)
    var baseDefense = Double(0)
    
    var level = Double(0)
    var currEXP = Double(0)
    var needEXP = Double(0)
    var expValue = Int32()
    
    var name = String()
    
    var xSize = Double(0)
    var ySize = Double(0)
    var xPos = Double(0)
    var yPos = Double(0)
    
    var enemyNode = SKShapeNode()
    var enemyPos = CGPoint()
    
    
    func changeColor (nColor: UIColor)
    {
        enemyNode.fillColor = nColor
    }
    
    func setPositons (xP: Double,yP: Double)
    {
        
        
        xPos = xP
        yPos = yP
        enemyNode = SKShapeNode(rectOf: CGSize(width: self.xSize, height: ySize))
        enemyPos = CGPoint(x: self.xPos, y: self.yPos)
        enemyNode.name = "enemyBlocks"
        //enemyNode.fillColor = UIColor.red
        enemyNode.position = CGPoint(x: xP,y: yP )
        enemyNode.zPosition = 100
        
    }
    
    init ()
    {
        baseHealth = 10
        baseAttack = 2
        baseDefense = 5
        xSize = Double(100)
        ySize = Double(100)
        level = 1
        expValue = Int32(randomRange(min: 10,max: 20))
        
        
        name = "Circle"
        
        currHealth = baseHealth
        currAttack = baseAttack
        currDefense = baseDefense
    }
    

    // get a random number in a range
    func randomRange(min: UInt32,max: UInt32) -> UInt32{
        let range = min..<max
        return range.lowerBound + arc4random_uniform(range.upperBound - range.lowerBound + 1)
    }

    
    func gotAttacked (incAttack:Double)
    {
        let attackMod = randomRange(min: 0, max: 200) // 0 to 200 mean that the attack could do double or nothing somewhere inbetween and all that jazz
        let dAttackMod = Double(attackMod) / 100
        let attack = incAttack * dAttackMod
        
        
        if ((currDefense * 0.1) < attack)
        {
            currHealth =  currHealth - ( attack - (currDefense * 0.1))
        }
        
    }
    
}
