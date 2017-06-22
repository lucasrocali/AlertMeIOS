//
// Created by Lucas Rocali
// Copyright (c) 2017 Rocali. All rights reserved.
//

import Foundation
import UIKit
protocol AlertMapViewProtocol: class {

    var presenter: AlertMapPresenterProtocol? { get set }

    func setNavInfo(title:String?,leftBtnText:String?,rightBtnText:String?)
    func leftBtnClicked(_ sender:UIBarButtonItem)
    func rightBtnClicked(_ sender:UIBarButtonItem)

    // PRESENTER -> VIEW
    func updateEvents(events:[Event])
}

protocol AlertMapWireframeProtocol: class {

    func setModule()

    //var somePopupWireframe : SomePopupWireframe? { get set }

    //func presentSomePopupView(fpresenter : AlertMapPresenter)

    // PRESENTER -> WIREFRAME

    func logout()
}

protocol AlertMapPresenterProtocol: class {
    var view: AlertMapViewProtocol? { get set }
    var interactor: AlertInteractorInputProtocol? { get set }
    var wireframe: AlertMapWireframeProtocol? { get set }

    func leftBtnClicked()
    func rightBtnClicked()

    // VIEW -> PRESENTER
    func getInfo()
}

protocol AlertInteractorOutputProtocol: class {
    // INTERACTOR -> PRESENTER
    func eventsLoaded()
}

protocol AlertInteractorInputProtocol: class {

    var presenter: AlertInteractorOutputProtocol? { get set }
    //PRESENTER -> INTERACTOR
    func loadEvents()
    func getEvents() -> [Event]
}
/*
protocol SomePopupDelegate {
    func someFunctionFromSomePopup()
}
*/
