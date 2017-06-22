//
// Created by Lucas Rocali
// Copyright (c) 2017 Lucas Rocali. All rights reserved.
//

import Foundation
import PromiseKit
import SwiftyJSON

class AlertDetailInteractor: AlertDetailInteractorInputProtocol {

    weak var presenter: AlertDetailInteractorOutputProtocol?

    var locations : [Location]
    
    init() {
        locations = []
    }


    func loadLocationsForEventId(_ eventId:Int) {
        locations = []
        firstly {
            User.sharedInstance.loadLocationsForEventId(eventId)
            }.then { json -> Void in
                print(json)
                for obj in json.arrayValue {
                    print(obj)
                    let location = Location(obj: obj)
                    self.locations.append(location)

                }
            }.always {
                self.presenter?.locationsLoaded()
            }.catch { error in
                print (error)
        }
        
    }
}
