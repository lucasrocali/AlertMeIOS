//
// Created by Lucas Rocali
// Copyright (c) 2017 Rocali. All rights reserved.
//

import Foundation
import PromiseKit
import SwiftyJSON
import RealmSwift

class AlertInteractor: AlertInteractorInputProtocol {

    weak var presenter: AlertInteractorOutputProtocol?

    let realm = try! Realm()

    func loadEvents() {
        firstly {
            User.sharedInstance.loadEvents()
            }.then { json -> Void in
                print(json)
                for obj in json.arrayValue {
                    print(obj)
                    let event = Event(obj: obj)
                    try! self.realm.write {
                        self.realm.create(Event.self, value: event, update: true)
                    }

                }
            }.always {
                self.presenter?.eventsLoaded()
            }.catch { error in
                print (error)
        }

    }

    func getEvents() -> [Event] {
        return User.sharedInstance.events
    }

}
