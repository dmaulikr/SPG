//
//  inventory.swift
//  SPG
//
//  Created by Student on 2016-12-01.
//  Copyright © 2016 WestNet. All rights reserved.
//

import Foundation
class Inventory {
    
    var itemList = [Items]()
    var potionList = [Potion]()
    var materialList = [Material]()
    
    var gold = Double(0)
    var LScount = Int32(0)
    var Bcount = Int32(0)
    var CPcount = Int32(0)
    
    
    static var SIinven = Inventory()
    
    func addItem (nItem: Items)
    {
        itemList.append(nItem)
    }
    func removeItem (rItem: Items)
    {
        
    }
    func removeItem(index: Int)
    {
    itemList.remove(at: index)
    }
    
    
    func addMats(maType: matTypes,amount: Int32)
    {
        let tempMat = Material(materialType: maType)
        var i = Int32(0)
        while (i < amount)
        {
            materialList.append(tempMat)
            i = i + 1
        }
            countMats()
    }
    func removeMat(maType: matTypes,amount: Int32)
    {
        var vounter = Int32(0)
        var counter = Int32(0)
        for mat in materialList
        {
            print(mat.materialType)
            print(maType)
            if (counter == amount)
            {
                break
            }
            else if (mat.materialType == maType)
            {
                materialList.remove(at: Int(vounter))
                counter = counter + 1
            }
            vounter = vounter + 1
        }
        countMats()
    }
    func countMats()
    {
        Bcount = 0
        LScount = 0
        CPcount = 0
        for mat in materialList
        {
            if (mat.materialType == matTypes.bolder)
            {
                Bcount = Bcount + 1
            }
            if (mat.materialType == matTypes.lineSeg)
            {
                LScount = LScount + 1
            }
            if (mat.materialType == matTypes.cornerP)
            {
                CPcount = CPcount + 1
            }
        }
        
    }
    
    init(){
        //MARK: Gold Stuff
        gold = 100
        
        //MARK: Potion Stuff
        let tempPotion = Potion(potionType: potionTypes.sharpness, size: 1)
        potionList.append(tempPotion)
        
        //MARK: Material Stuff
        let tempMaterial = Material(materialType: matTypes.bolder)
                let tempMaterial2 = Material(materialType: matTypes.lineSeg)
                let tempMaterial3 = Material(materialType: matTypes.cornerP)
        materialList.append(tempMaterial)
        materialList.append(tempMaterial)
        materialList.append(tempMaterial)
        materialList.append(tempMaterial)
        materialList.append(tempMaterial)
        materialList.append(tempMaterial)
        materialList.append(tempMaterial)
        
        materialList.append(tempMaterial2)
        materialList.append(tempMaterial2)
        materialList.append(tempMaterial2)
        materialList.append(tempMaterial2)
        materialList.append(tempMaterial2)
        materialList.append(tempMaterial2)
        materialList.append(tempMaterial2)
        
        materialList.append(tempMaterial3)
        materialList.append(tempMaterial3)
        materialList.append(tempMaterial3)
        materialList.append(tempMaterial3)
        materialList.append(tempMaterial3)
        materialList.append(tempMaterial3)
        materialList.append(tempMaterial3)
        
        //MARK: Item Stuff
        let tempItem = Items()
        let tempItem1 = Items()
        let tempItem2 = Items()
        let tempItem3 = Items()
        let tempItem4 = Items()
        let tempItem5 = Items()
        let tempItem6 = Items()
        let tempItem7 = Items()
        let tempItem8 = Items()
        let tempItem9 = Items()

        
        itemList.append(tempItem)
        itemList.append(tempItem1)
        itemList.append(tempItem2)
        itemList.append(tempItem3)
        itemList.append(tempItem4)
        itemList.append(tempItem5)
        itemList.append(tempItem6)
        itemList.append(tempItem7)
        itemList.append(tempItem8)
        itemList.append(tempItem9)

    }
    
    
}
