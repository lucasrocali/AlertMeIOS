//
// Created by Lucas Rocali
// Copyright (c) 2017 Rocali. All rights reserved.
//

import Foundation
import UIKit

protocol LoginViewProtocol: class {

    var presenter: LoginPresenterProtocol? { get set }

    func setNavInfo(title:String?,leftBtnText:String?,rightBtnText:String?)
    func leftBtnClicked(_ sender:UIBarButtonItem)
    func rightBtnClicked(_ sender:UIBarButtonItem)

    // PRESENTER -> VIEW
}

protocol LoginWireframeProtocol: class {

    func installIntoWindow(window: UIWindow)

    //var somePopupWireframe : SomePopupWireframe? { get set }

    //func presentSomePopupView(fpresenter : LoginPresenter)

    // PRESENTER -> WIREFRAME
    func goToMap()

}

protocol LoginPresenterProtocol: class {
    var view: LoginViewProtocol? { get set }
    var interactor: LoginInteractorInputProtocol? { get set }
    var wireframe: LoginWireframeProtocol? { get set }

    func leftBtnClicked()
    func rightBtnClicked()

    // VIEW -> PRESENTER
    func loginClicked()
}

protocol LoginInteractorOutputProtocol: class {
    // INTERACTOR -> PRESENTER
    func loginResponse(success:Bool,message:String)
}

protocol LoginInteractorInputProtocol: class {

    var presenter: LoginInteractorOutputProtocol? { get set }

    //PRESENTER -> INTERACTOR
    func login(name: String, email: String, password: String)
    func loadCategories()
}
/*
protocol SomePopupDelegate {
    func someFunctionFromSomePopup()
}
*/
