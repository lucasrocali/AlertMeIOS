//
// Created by Lucas Rocali
// Copyright (c) 2017 Lucas Rocali. All rights reserved.
//

import Foundation
import SwiftyJSON

class Location {
    var id : Int
    var userName : String
    var lat : Double
    var lon : Double

     init(obj: JSON) {
        self.id = obj["id"].intValue
        self.userName = obj["user"]["name"].stringValue
        self.lat = obj["lat"].doubleValue
        self.lon = obj["lon"].doubleValue
    }
}
