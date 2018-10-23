//
//  Item.swift
//  Todoey
//
//  Created by Sergio Lozano Garza on 10/18/18.
//  Copyright © 2018 Sergio Lozano Garza. All rights reserved.
//

import Foundation
import RealmSwift

class Item:Object{
    
    @objc dynamic var title:String = ""
    @objc dynamic var done:Bool = false
    var parentCategory = LinkingObjects(fromType: Category.self, property: "items")
    
}
