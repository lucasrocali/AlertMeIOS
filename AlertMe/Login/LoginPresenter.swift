//
// Created by Lucas Rocali
// Copyright (c) 2017 Rocali. All rights reserved.
//

import Foundation

class LoginPresenter: LoginPresenterProtocol, LoginInteractorOutputProtocol {
    
    weak var view: LoginViewProtocol? {
        didSet {
            if let view = view {
                view.setNavInfo(title: "Login", leftBtnText: "",rightBtnText: "login")

            }
        }
    }

    var interactor: LoginInteractorInputProtocol?
    var wireframe: LoginWireframeProtocol?

    init() {}

    func leftBtnClicked() {
        //navigationWireframe?.back()
    }

    func rightBtnClicked() {
        //print("")
    }

    func loginClicked() {
        interactor?.login(name: "Lucas Rocali", email: "rocalilucas@gmail.com", password: "1234")
    }

    //I -> P
    func loginResponse(success:Bool,message:String) {
        print("loginResponse")
        if success {
            interactor?.loadCategories()
            wireframe?.goToMap()
        }
    }

}
