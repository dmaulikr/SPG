//
//  enemy.swift
//  SPG
//
//  Created by Student on 2016-11-24.
//  Copyright © 2016 WestNet. All rights reserved.
//

import Foundation
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
    
    var name = String()
    

    
    init ()
    {
        baseHealth = 10
        baseAttack = 2
        baseDefense = 5
        
        level = 1
        currEXP = 0
        needEXP = 100
        
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
        currHealth =  currHealth - ( incAttack - (currDefense * 0.1))
    }
    
    
}
