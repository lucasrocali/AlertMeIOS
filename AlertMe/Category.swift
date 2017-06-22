//
//  Category.swift
//  AlertMe
//
//  Created by Lucas Rocali on 6/20/17.
//  Copyright © 2017 Lucas Rocali. All rights reserved.
//

import Foundation
import RealmSwift
import SwiftyJSON

class Category: Object {
    dynamic var id = 0
    dynamic var name = ""

    override static func primaryKey() -> String? {
        return "id"
    }

    convenience init(obj: JSON) {
        self.init()
        self.id = obj["id"].intValue
        self.name = obj["name"].stringValue
    }
    
}
