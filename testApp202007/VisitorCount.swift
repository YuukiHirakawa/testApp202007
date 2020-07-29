//
//  VisitorCount.swift
//  testApp202007
//
//  Created by user1 on 2020/07/29.
//  Copyright © 2020 Yuki Hirakawa. All rights reserved.
//

import Foundation
import RealmSwift

class VisitorCount : Object {
    
    dynamic var date : Date = Date()
    dynamic var count : Int = Int(0)
    
    func save() {
        do {
            let realm = try Realm()
            try realm.write {
                realm.add(self)
            }
        } catch let error as NSError {
            fatalError(error.localizedDescription)
        }
    }
}
