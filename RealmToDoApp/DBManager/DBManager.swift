//
//  DBManager.swift
//  RealmToDoApp
//
//  Created by GLB-311-PC on 23/08/18.
//  Copyright © 2018 Globussoft. All rights reserved.
//

import UIKit
import RealmSwift

class DBManager {
    
    private var database:Realm
    static let sharedInstance = DBManager()
    private init() {
       
        database = try! Realm()
        print(Realm.Configuration.defaultConfiguration.fileURL!)
    }
    
    //for route table
    func getDataFromRoute() -> Results<ItemRoute> {
        let results: Results<ItemRoute> =   database.objects(ItemRoute.self)
        return results
    }
    //for route table
    func addDataFromRoute(object: ItemRoute)   {
        try! database.write {
            database.add(object, update: true)
            print("Added new object")
        }
    }
    
      //Item is table entity
    func getDataFromDB() ->   Results<Item> {
        let results: Results<Item> =   database.objects(Item.self)
        return results
    }
    
    func addData(object: Item)   {
        try! database.write {
            database.add(object, update: true)
            print("Added new object")
        }
    }

    func deleteAllFromDatabase()  {
        try!   database.write {
            database.deleteAll()
        }
    }
    
    
    func deleteFromDb(object: Item)   {
        try!   database.write {
            database.delete(object)
        }
    }
}
