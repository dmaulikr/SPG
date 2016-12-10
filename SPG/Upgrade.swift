//
//  Upgrade.swift
//  SPG
//
//  Created by Student on 2016-12-09.
//  Copyright © 2016 WestNet. All rights reserved.
//

import Foundation

class Upgrade
{
    var attackU = Double(0)
    var defenseU = Double(0)
    var healthU = Double(0)
    var speedU = Double(0)
    var name = String("")
    var rarity = String("")
    var itemLevel = Int32(1)
    
    var lineSegCost = Int32(0)
    var BolderCost = Int32(0)
    var CornPiCost = Int32(0)
    var goldCost = Double(0)
    
    var lineSegV = Int32(0)
    var BolderV = Int32(0)
    var CornPiV = Int32(0)
    var goldV = Double(0)
    
    var upgradeItem : Items
    var lameItem = Items()
    
    var uInven = Inventory.SIinven
    
    init(item: Items)
    {
        upgradeItem = Items()
        lameItem = item
        uItemCost()
        dItemValue()
        upgradeAtt(cAtt: lameItem.attack)
        upgradeDef(cDef: lameItem.attack)
        upgradeSpd(cSpd: lameItem.speed)
        upgradeHP(cHP: lameItem.health)
    }
    var itemsEqual = false
    //MARK: Deconstruction
    func decon()
    {
        var found = false
        var counter = 0
        for temp in uInven.itemList
        {
            itemsEq(comItem: temp)
            if (itemsEqual == true)
            {
                itemsEqual = false
                found = true
                break
                
            }
            counter = counter + 1
        }
        if (found == true)
        {
            uInven.materialList.remove(at: counter)
            uInven.gold = uInven.gold + goldV
            for tempMat in uInven.materialList
            {
                
                if (tempMat.materialType == matTypes.lineSeg)
                {
                    tempMat.amount = tempMat.amount + lineSegV
                }
                if (tempMat.materialType == matTypes.bolder)
                {
                    tempMat.amount = tempMat.amount + BolderV
                }
                if (tempMat.materialType == matTypes.cornerP)
                {
                    tempMat.amount = tempMat.amount + CornPiV
                }
            }
        }
    }
    func itemsEq(comItem:Items)
    {
        var count = Int32(0)
        if (comItem.name == lameItem.name)
        {
            count = count + 1
        }
        if (comItem.health == lameItem.health)
        {
            count = count + 1
        }
        if (comItem.attack == lameItem.attack)
        {
            count = count + 1
        }
        if (comItem.defense == lameItem.defense)
        {
            count = count + 1
        }
        if (comItem.speed == lameItem.speed)
        {
            count = count + 1
        }
        if (comItem.rarity == lameItem.rarity)
        {
            count = count + 1
        }
        if (comItem.itemLevel == lameItem.itemLevel)
        {
            count = count + 1
        }
        if (comItem.description == lameItem.description)
        {
            count = count + 1
        }
        if (count == 8)
        {
            itemsEqual = true
        }
    }
    func dItemValue ()
    {
        let statPool = lameItem.attack + lameItem.defense + lameItem.speed + lameItem.health
        if (statPool <= 10)
        {
            
            lineSegV = 1
            BolderV = 0
            CornPiV = 2
            goldV = 3
        }
        else if (statPool >= 11 && statPool < 20)
        {
            
            lineSegV = 3
            BolderV = 1
            CornPiV = 2
            goldV = 9
        }
        else {
            
            lineSegV = 6
            BolderV = 5
            CornPiV = 7
            goldV = 21
        }
    }
    
    //MARK: UPGRADING
    func uItemCost()
    {
        let statPool = lameItem.attack + lameItem.defense + lameItem.speed + lameItem.health
        if (statPool <= 10)
        {
            lineSegCost = 1
            BolderCost = 2
            CornPiCost = 1
            goldCost = 10
        }
        else if (statPool >= 11 && statPool < 20)
        {
            lineSegCost = 5
            BolderCost = 8
            CornPiCost = 6
            goldCost = 30
        }
        else {
            lineSegCost = 6
            BolderCost = 4
            CornPiCost = 11
            goldCost = 100
        }
        
    }
    
    func uItem()
    {
        upgradeAtt(cAtt: lameItem.attack)
        upgradeDef(cDef: lameItem.attack)
        upgradeSpd(cSpd: lameItem.speed)
        upgradeHP(cHP: lameItem.health)
        upgradeItem.itemLevel = upgradeItem.itemLevel + 1
    }
    
    func upgradeAtt(cAtt: Double)
    {
        var newStat = Double(0)
        newStat = lameItem.attack + ((Double(lameItem.itemLevel) + 1) * 0.3)
        upgradeItem.attack = newStat
    }
    func upgradeDef(cDef: Double)
    {
        var newStat = Double(0)
        newStat = lameItem.defense + ((Double(lameItem.itemLevel) + 1) * 0.4)
        upgradeItem.defense = newStat
    }
    func upgradeSpd(cSpd: Double)
    {
        var newStat = Double(0)
        newStat = lameItem.speed + ((Double(lameItem.itemLevel) + 1) * 0.6)
        upgradeItem.speed = newStat
    }
    func upgradeHP(cHP: Double)
    {
        var newStat = Double(0)
        newStat = lameItem.health + ((Double(lameItem.itemLevel) + 1) * 0.2)
        upgradeItem.health = newStat
    }
    
    
    
    
}
