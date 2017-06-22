//
// Created by Lucas Rocali
// Copyright (c) 2017 Rocali. All rights reserved.
//

import Foundation
import UIKit

class AlertListWireframe: AlertListWireframeProtocol,TabBarInterface {

    let AlertListViewControllerIdentifier = "AlertListViewController"

    var rootWireframe : MainTabBarWireFrame?

    //var somePopupWireframe : SomePopupWireframe?
    var navigationController : UINavigationController?
    
    func setModule() {
        //MODULE COMPONENTS
        let view: AlertListViewProtocol = getAlertListViewController()
        let presenter: AlertListPresenterProtocol & AlertInteractorOutputProtocol = AlertListPresenter()
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

    func getAlertListViewController() -> AlertListViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let AlertListVC: AlertListViewController = storyboard.instantiateViewController(withIdentifier: AlertListViewControllerIdentifier) as! AlertListViewController
        return AlertListVC
    }

    // MARK: TabBarInterface
    func configuredViewControllerFromRoot(_ root:MainTabBarWireFrame) -> UIViewController {

        setModule()

        rootWireframe = root

        return navigationController!
    }

    /*
     func presentSomePopupView(fpresenter : AlertListPresenter) {
         somePopupWireframe?.presentSomePopupModule(fpresenter: fpresenter)
     }
     */


}
