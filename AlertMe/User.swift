//
//  DataManager.swift
//  ViperDemoProject
//
//  Created by Lucas Rocali on 5/10/17.
//  Copyright © 2017 Lucas Rocali. All rights reserved.
//

import Foundation
import PromiseKit
import SwiftyJSON
import Alamofire
import RealmSwift

extension RealmSwift.Results {

    func toArray() -> [T] {
        return self.map{$0}
    }
}

extension RealmSwift.List {

    func toArray() -> [T] {
        return self.map{$0}
    }
}

extension RealmSwift.LinkingObjects {
    func toArray() -> [T] {
        return self.map{$0}
    }
}

protocol DataStore {
//    func loadPosts() -> Promise<JSON>
//    func loadUsers() -> Promise<JSON>
//    func loadComments() -> Promise<JSON>
}


class User : DataStore {

    static let sharedInstance = User()

    fileprivate let defaults = UserDefaults.standard

    var events : [Event] {
        get {
            return try! Realm().objects(Event.self).toArray()
        }
    }
    var categories : [Category] {
        get {
            return try! Realm().objects(Category.self).toArray()
        }
    }


    var name: String {
        get {
            return defaults.string(forKey: "userName")!
        }
        set {
            defaults.set(newValue, forKey: "userName")
        }
    }
    fileprivate(set) var email: String {
        get {
            return defaults.string(forKey: "userEmail")!
        }
        set {
            defaults.set(newValue, forKey: "userEmail")
        }
    }

    var password: String = ""

    var authToken: String? {
        get {
            return defaults.string(forKey: "MonetoAuthToken")
        }
        set {
            print ("Updating AuthToken! \(newValue)")
            defaults.set(newValue, forKey: "MonetoAuthToken")
        }
    }

    var isLoggedIn: Bool {
        get {
            return defaults.bool(forKey: "isLoggedIn")
        }
        set {
            defaults.set(newValue, forKey: "isLoggedIn")
        }
    }
    

    func login(name: String, email: String, password: String) -> Promise<JSON> {

        let parameters = [
            "user" : [
                "name": name,
                "email": email,
                "password": password,
                ]
        ]
        return Promise { fulfill, reject in
            firstly {
                DataManager.post(toPath: "/login", parameters: parameters)
                }.then { json -> Void in
                    print(json)
                    let authToken = json["auth_token"].stringValue
                    // Do not override authToken defaults if user has PJ/PF
                    if authToken.characters.count > 0 {
                        User.sharedInstance.authToken = authToken
                        self.isLoggedIn = true
                    }
                    User.sharedInstance.name = name
                    User.sharedInstance.email = email
                    User.sharedInstance.password = password

                    fulfill(json)
                }.catch { error in
                    reject(error)
            }
        }
    }

    func logout() {
        // self.authToken = nil
        self.isLoggedIn = false
        defaults.synchronize()
    }
    
    func createEvent(event:Event) -> Promise<JSON> {

        let parameters = event.getParameters()
        
        return Promise { fulfill, reject in
            firstly {
                DataManager.post(toPath: "/events", parameters: parameters)
                }.then { json -> Void in
                    print(json)
                    fulfill(json)
                }.catch { error in
                    reject(error)
            }
        }
    }

    func loadCategories() -> Promise<JSON> {
        return DataManager.load(fromPath: "categories")
    }

    func loadEvents() -> Promise<JSON> {
        return DataManager.load(fromPath: "events")
    }




}
