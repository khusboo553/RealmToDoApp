//
//  ItemRoute.swift
//  RealmToDoApp
//
//  Created by GLB-311-PC on 23/08/18.
//  Copyright © 2018 Globussoft. All rights reserved.
//

import RealmSwift

class ItemRoute:Object {
    
    dynamic var ID = 0
    dynamic var noteName = ""
    
    override static func primaryKey() -> String? {
        return "ID"
    }
}
