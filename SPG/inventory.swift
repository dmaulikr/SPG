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
    static var SIinven = Inventory()
    func addItem (nItem: Items)
    {
        itemList.append(nItem)
        
    }
    init(){
        
        let tempItem = Items()
        let tempItem1 = Items()
        let tempItem2 = Items()

        itemList.append(tempItem)
        itemList.append(tempItem1)
        itemList.append(tempItem2)
   
        



    }
    
    
}
