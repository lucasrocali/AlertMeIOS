//
// Created by Lucas Rocali
// Copyright (c) 2017 Lucas Rocali. All rights reserved.
//

import Foundation
import PromiseKit
import SwiftyJSON

class CreateEventInteractor: CreateEventInteractorInputProtocol {

    weak var presenter: CreateEventInteractorOutputProtocol?

    var success : Bool

    init() {
        success = false
    }

    func createEvent(event:Event) {
        success = false
        firstly {
            User.sharedInstance.createEvent(event:event)
            }.then { json -> Void in
                print(json)
                self.success = true
            }.always {
                print("eventCreated")
            }.catch { error in
                print (error)
        }
    }

    func getCategories() -> [Category] {
        return User.sharedInstance.categories
    }
}
