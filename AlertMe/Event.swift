//
//  Event.swift
//  AlertMe
//
//  Created by Lucas Rocali on 6/13/17.
//  Copyright © 2017 Lucas Rocali. All rights reserved.
//

import Foundation
import RealmSwift
import SwiftyJSON

class Event: Object {
    dynamic var id = 0
    dynamic var userName = ""
    dynamic var categoryId = 0
    dynamic var category = ""
    dynamic var importance = 0
    dynamic var lat = 0.0
    dynamic var lon = 0.0
    dynamic var comment = ""
    dynamic var date = ""

    override static func primaryKey() -> String? {
        return "id"
    }

    convenience init(obj: JSON) {
        self.init()
        self.id = obj["id"].intValue
        self.userName = obj["location"]["user"]["name"].stringValue
        self.categoryId = obj["category"]["id"].intValue
        self.category = obj["category"]["name"].stringValue
        self.importance = obj["importance"].intValue
        self.lat = obj["location"]["lat"].doubleValue
        self.lon = obj["location"]["lon"].doubleValue
        self.comment = obj["comment"].stringValue
        self.date = obj["created_at"].stringValue
    }

    convenience init(categoryId:Int, lat:Double, lon:Double, importance:Int,comment:String) {
        self.init()
        self.categoryId = categoryId
        self.lat = lat
        self.lon = lon
        self.importance = importance
        self.comment = comment
    }

    func getParameters() -> [String:Any] {
        return [
            "category_id": categoryId,
            "lat": lat,
            "lon": lon,
            "importance": importance,
            "comment": comment

            ] as [String : Any]
    }
    
}
