//
// Created by Lucas Rocali
// Copyright (c) 2017 Lucas Rocali. All rights reserved.
//

import Foundation
import UIKit

class CreateEventWireframe: CreateEventWireframeProtocol,TabBarInterface {

    let CreateEventViewControllerIdentifier = "CreateEventViewController"

    var rootWireframe : MainTabBarWireFrame?

    var navigationController : UINavigationController?
    
    func setModule() {
        //MODULE COMPONENTS
        let view: CreateEventViewProtocol = getCreateEventViewController()
        let presenter: CreateEventPresenterProtocol & CreateEventInteractorOutputProtocol = CreateEventPresenter()
        let interactor: CreateEventInteractorInputProtocol = CreateEventInteractor()

        navigationController = UINavigationController()

        //CONNECTING
        view.presenter = presenter
        presenter.view = view
        presenter.wireframe = self
        presenter.interactor = interactor
        interactor.presenter = presenter

        navigationController?.pushViewController(view as! UIViewController, animated: false)        
    }

    func getCreateEventViewController() -> CreateEventViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let CreateEventVC: CreateEventViewController = storyboard.instantiateViewController(withIdentifier: CreateEventViewControllerIdentifier) as! CreateEventViewController
        return CreateEventVC
    }

    // MARK: TabBarInterface
    func configuredViewControllerFromRoot(_ root:MainTabBarWireFrame) -> UIViewController {

        setModule()

        rootWireframe = root

        return navigationController!
    }


}
