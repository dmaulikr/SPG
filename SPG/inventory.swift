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
    
    func addItem (nItem: Items)
    {
        itemList.append(nItem)
        
    }
    init(){
        
        let tempItem = Items()
        let tempItem1 = Items()
        let tempItem2 = Items()
        let tempItem3 = Items()
        let tempItem4 = Items()
        let tempItem5 = Items()
        let tempItem6 = Items()
        let tempItem7 = Items()
        itemList.append(tempItem)
        itemList.append(tempItem1)
        itemList.append(tempItem2)
        itemList.append(tempItem3)
        itemList.append(tempItem4)
        itemList.append(tempItem5)
        itemList.append(tempItem6)
        itemList.append(tempItem7)
        



    }
    
    
}
