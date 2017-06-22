//
// Created by Lucas Rocali
// Copyright (c) 2017 Rocali. All rights reserved.
//

import Foundation
import PromiseKit
import SwiftyJSON
import RealmSwift

class LoginInteractor: LoginInteractorInputProtocol {

    weak var presenter: LoginInteractorOutputProtocol?

    let realm = try! Realm()

    var success : Bool
    init() {
        success = false
    }

    func login(name: String, email: String, password: String) {
        success = false
        firstly {
            User.sharedInstance.login(name: name, email: email, password: password)
            }.then { json -> Void in
                print(json)
                self.success = true
            }.always {
                self.presenter?.loginResponse(success: self.success, message: "")
            }.catch { error in
                print (error)
        }
    }

    func loadCategories() {
        firstly {
            User.sharedInstance.loadCategories()
            }.then { json -> Void in
                print(json)
                for obj in json.arrayValue {
                    print(obj)
                    let category = Category(obj: obj)
                    try! self.realm.write {
                        self.realm.create(Category.self, value: category, update: true)
                    }
                }
            }.always {
                print("categoriesLoaded")
            }.catch { error in
                print (error)
        }
        
    }
}
