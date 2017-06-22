//
// Created by Lucas Rocali
// Copyright (c) 2017 Rocali. All rights reserved.
//

import Foundation
import UIKit

class AlertMapWireframe: AlertMapWireframeProtocol,TabBarInterface {

    let AlertMapViewControllerIdentifier = "AlertMapViewController"

    var rootWireframe : MainTabBarWireFrame?

    var navigationController : UINavigationController?
    //var somePopupWireframe : SomePopupWireframe?
    
    func setModule() {
        //MODULE COMPONENTS
        let view: AlertMapViewProtocol = getAlertMapViewController()
        let presenter: AlertMapPresenterProtocol & AlertInteractorOutputProtocol = AlertMapPresenter()
        let interactor: AlertInteractorInputProtocol = AlertInteractor()

        navigationController = UINavigationController()

        //POPUPWIREFRAMES

        //let somePopupWireframe = SomePopupWireFrame()

        //CONNECTING
        view.presenter = presenter
        presenter.view = view
        presenter.wireframe = self
        presenter.interactor = interactor
        interactor.presenter = presenter

        navigationController?.pushViewController(view as! UIViewController, animated: false)

    }

    func getAlertMapViewController() -> AlertMapViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let AlertMapVC: AlertMapViewController = storyboard.instantiateViewController(withIdentifier: AlertMapViewControllerIdentifier) as! AlertMapViewController
        return AlertMapVC
    }


    // MARK: TabBarInterface
    func configuredViewControllerFromRoot(_ root:MainTabBarWireFrame) -> UIViewController {
        setModule()
        rootWireframe = root

        return navigationController!
    }

    func logout() {
        rootWireframe?.logout()
    }
    /*
     func presentSomePopupView(fpresenter : AlertMapPresenter) {
         somePopupWireframe?.presentSomePopupModule(fpresenter: fpresenter)
     }
     */


}
