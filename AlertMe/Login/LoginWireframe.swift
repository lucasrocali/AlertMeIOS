//
// Created by Lucas Rocali
// Copyright (c) 2017 Rocali. All rights reserved.
//

import Foundation
import UIKit

class LoginWireframe: LoginWireframeProtocol {

    let LoginViewControllerIdentifier = "LoginViewController"

    var rootWireframe : RootWireframe?

    //var somePopupWireframe : SomePopupWireframe?
    var navigationController : UINavigationController?

    var alertMapWireframe : AlertMapWireframe?
    
    func installIntoWindow(window: UIWindow) {
        //MODULE COMPONENTS
        let view: LoginViewProtocol = getLoginViewController()
        let presenter: LoginPresenterProtocol & LoginInteractorOutputProtocol = LoginPresenter()
        let interactor: LoginInteractorInputProtocol = LoginInteractor()

        //POPUPWIREFRAMES

        //let somePopupWireframe = SomePopupWireFrame()
        alertMapWireframe = AlertMapWireframe()

        //CONNECTING
        view.presenter = presenter
        presenter.view = view
        presenter.wireframe = self
        presenter.interactor = interactor
        interactor.presenter = presenter

        showRootViewController(view as! UIViewController, inWindow: window)
        
    }

    func getLoginViewController() -> LoginViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let LoginVC: LoginViewController = storyboard.instantiateViewController(withIdentifier: LoginViewControllerIdentifier) as! LoginViewController
        return LoginVC
    }

    func showRootViewController(_ viewController: UIViewController, inWindow: UIWindow) {
        navigationController = navigationControllerFromWindow(inWindow)
        navigationController?.viewControllers = [viewController]
    }

    func navigationControllerFromWindow(_ window: UIWindow) -> UINavigationController {
        let navigationController = window.rootViewController as! UINavigationController
        return navigationController
    }

    func goToMap() {
        let tabBarWireFrame = MainTabBarWireFrame()
        tabBarWireFrame.presentMainFromViewController(navigationController)
    }
    /*
     func presentSomePopupView(fpresenter : LoginPresenter) {
         somePopupWireframe?.presentSomePopupModule(fpresenter: fpresenter)
     }
     */


}
