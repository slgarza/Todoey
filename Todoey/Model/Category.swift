//
//  Category.swift
//  Todoey
//
//  Created by Sergio Lozano Garza on 10/18/18.
//  Copyright © 2018 Sergio Lozano Garza. All rights reserved.
//

import Foundation
import RealmSwift

class Category:Object{
    
    @objc dynamic var name:String = ""
    let items = List<Item>()
    
}
