//
//  Shop.swift
//  SPG
//
//  Created by Student on 2016-12-10.
//  Copyright © 2016 WestNet. All rights reserved.
//

import Foundation
class Shop
{
    var itemShopList = [Items]()
    
    var gold = Double(0)
    
    
    
    static var SIShop = Shop()
    
    func addItem (nItem: Items)
    {
        itemShopList.append(nItem)
    }
    func removeItem(index: Int)
    {
        itemShopList.remove(at: index)
    }
    
    init() {
        let shopItem1 = Items()
        let shopItem2 = Items()
        let shopItem3 = Items()
        let shopItem4 = Items()
        let shopItem5 = Items()
        
        
        
        shopItem1.name = "Fance Line"
        shopItem1.attack = 12
        shopItem1.defense = 18
        shopItem1.speed = 11
        shopItem1.setBuyPrice()
        shopItem1.setSellPrice()
        
        itemShopList.append(shopItem1)
        
        
        shopItem2.name = "Italic Line"
        shopItem2.attack = 18
        shopItem2.defense = 12
        shopItem2.speed = 11
        shopItem2.setBuyPrice()
        shopItem2.setSellPrice()
        itemShopList.append(shopItem2)
        
        shopItem3.name = "Bold Line"
        shopItem3.attack = 14
        shopItem3.defense = 22
        shopItem3.speed = 3
        shopItem3.setBuyPrice()
        shopItem3.setSellPrice()
        itemShopList.append(shopItem3)
        
        shopItem4.name = "Pythago Line"
        shopItem4.attack = 45
        shopItem4.defense = 62
        shopItem4.speed = 76
        shopItem4.rarity = "Legendary"
        shopItem4.setBuyPrice()
        shopItem4.setSellPrice()
        itemShopList.append(shopItem4)
        
        shopItem5.name = "Eulers Corner"
        shopItem5.attack = 68
        shopItem5.defense = 39
        shopItem5.speed = 54
        shopItem5.rarity = "Legendary"
        shopItem5.setBuyPrice()
        shopItem5.setSellPrice()
        itemShopList.append(shopItem5)
        
    }
}
