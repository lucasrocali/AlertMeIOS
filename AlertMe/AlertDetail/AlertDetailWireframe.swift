//
// Created by Lucas Rocali
// Copyright (c) 2017 Lucas Rocali. All rights reserved.
//

import Foundation
import UIKit

class AlertDetailWireframe: AlertDetailWireframeProtocol {

    let AlertDetailViewControllerIdentifier = "AlertDetailViewController"

    var navigationController : UINavigationController?
    
    func pushModule(fnavc:UINavigationController,event:Event) {
        //MODULE COMPONENTS
        let view: AlertDetailViewProtocol = getAlertDetailViewController()
        let presenter: AlertDetailPresenterProtocol & AlertDetailInteractorOutputProtocol = AlertDetailPresenter()
        let interactor: AlertDetailInteractorInputProtocol = AlertDetailInteractor()

        navigationController = fnavc

        //CONNECTING
        view.presenter = presenter
        view.event = event
        presenter.view = view
        presenter.wireframe = self
        presenter.interactor = interactor
        interactor.presenter = presenter

        let AlertDetailVC = view as! UIViewController
        fnavc.pushViewController(AlertDetailVC, animated: true)
        
    }

    func getAlertDetailViewController() -> AlertDetailViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let AlertDetailVC: AlertDetailViewController = storyboard.instantiateViewController(withIdentifier: AlertDetailViewControllerIdentifier) as! AlertDetailViewController
        return AlertDetailVC
    }

    func back() {
        if let navC = navigationController {
            navC.popViewController(animated: true)
        }

    }

    /*
     func presentSomePopupView(fpresenter : AlertDetailPresenter) {
         somePopupWireframe?.presentSomePopupModule(fpresenter: fpresenter)
     }
     */


}
