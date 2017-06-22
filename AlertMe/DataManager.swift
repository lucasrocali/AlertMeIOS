//
//  DataManaer.swift
//  AlertMe
//
//  Created by Lucas Rocali on 6/12/17.
//  Copyright © 2017 Lucas Rocali. All rights reserved.
//

import Foundation
import PromiseKit
import SwiftyJSON
import Alamofire

class DataManager {

    static let serverUrl = "http://localhost:3000/"

    static func load(fromPath path: String,auth: Bool = true) -> Promise<JSON> {

        let path = "\(serverUrl)\(path)"
        var headers = [String: String]()

        if auth, let token = User.sharedInstance.authToken {
            headers["Authorization"] = token
        }

        return Promise{ fulfill, reject in
            Alamofire.request(
                path,
                method: .get,
                encoding: JSONEncoding.default,
                headers: headers
                ).validate().responseJSON{ response in
                    switch response.result{
                    case .success:
                        if let value = response.result.value{
                            let json = JSON(value)
                            print (json)
                            fulfill(json)
                        }
                    case .failure(let error):
                        if let data = response.data, let errorMessage = String(data: data, encoding: String.Encoding.utf8) {
                            print (errorMessage)
                        }
                        reject(error)
                    }
            }
        }

    }

    static func post(toPath path: String, parameters: [String: Any], auth: Bool = true) -> Promise<JSON> {

        let path = "\(serverUrl)\(path)"
        var headers = [String: String]()

        if auth, let token = User.sharedInstance.authToken {
            headers["Authorization"] = token
        }
        return Promise { fulfill, reject in
            Alamofire.request(
                path,
                method: .post,
                parameters: parameters,
                encoding: JSONEncoding.default,
                headers: headers
                ).validate().responseJSON { response in
                    switch response.result {
                    case .success:
                        if let value = response.result.value {
                            let json = JSON(value)
                            fulfill(json)
                        }
                    case .failure(let error):
                        if let data = response.data {
                            let json = JSON(data: data)
                            //                            let err = BackendError(code: json["code"].intValue, message: json["message"].stringValue, status: json["status"].intValue, data: json["data"])
                            //                            print (json)
                            reject(error)
                        } else {
                            reject(error)
                        }
                    }
            }
        }
        
    }

}
