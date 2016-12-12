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
        
        itemShopList.append(shopItem1)
        
        itemShopList.append(shopItem2)
        
        itemShopList.append(shopItem3)
        
        itemShopList.append(shopItem4)
        
        itemShopList.append(shopItem5)
        
    }
}
