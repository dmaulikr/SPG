//
//  Adventure.swift
//  SPG
//
//  Created by Student on 2016-12-01.
//  Copyright © 2016 WestNet. All rights reserved.
//

import Foundation
import SpriteKit
class  Adventure {
    
    var monsters = [enemy]()
    static var sharedInst = Adventure(lvl: 1)
    static var levelCount = 1

    
    init(lvl: Double) {
        
        let monster1 = enemy()
        monster1.currAttack = monster1.currAttack + (lvl * 0.5)
        monster1.currDefense = monster1.currDefense + (lvl * 0.3)
        monster1.currHealth = monster1.currHealth + (lvl * 0.8)
        monster1.changeColor(nColor: UIColor.black)
        monster1.name = "Cardboard box"
        
        let monster2 = enemy()
        monster2.currAttack = monster2.currAttack + (lvl * 0.6)
        monster2.currDefense = monster2.currDefense + (lvl * 0.4)
        monster2.currHealth = monster2.currHealth + (lvl * 0.85)
        monster2.changeColor(nColor: UIColor.cyan)
        monster2.name = "Wooden box"
        
        let monster3 = enemy()
        monster3.currAttack = monster3.currAttack + (lvl * 0.7)
        monster3.currDefense = monster3.currDefense + (lvl * 0.45)
        monster3.currHealth = monster3.currHealth + (lvl * 0.93)
        monster3.changeColor(nColor: UIColor.brown)
        monster3.name = "Plastic box"
        
        let boss = enemy()
        boss.currAttack = boss.currAttack + (lvl * 2)
        boss.currDefense = boss.currDefense + (lvl * 3)
        boss.currHealth = boss.currHealth + (lvl * 5)
        boss.changeColor(nColor: UIColor.darkGray)
        boss.name = "Steel box"
        
        monsters.append(monster1)
        monsters.append(monster2)
        monsters.append(monster3)
        monsters.append(boss)
        

    }
    func randomRange(min: UInt32,max: UInt32) -> UInt32{
        let range = min..<max
        return range.lowerBound + arc4random_uniform(range.upperBound - range.lowerBound + 1)
    }
    
}
