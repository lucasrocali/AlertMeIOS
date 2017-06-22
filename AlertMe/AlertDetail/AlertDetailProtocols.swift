//
// Created by Lucas Rocali
// Copyright (c) 2017 Lucas Rocali. All rights reserved.
//

import Foundation
import UIKit

protocol AlertDetailViewProtocol: class {

    var presenter: AlertDetailPresenterProtocol? { get set }

    var event : Event? { get set }

    func setNavInfo(title:String?,leftBtnText:String?,rightBtnText:String?)
    func leftBtnClicked(_ sender:UIBarButtonItem)
    func rightBtnClicked(_ sender:UIBarButtonItem)

    // PRESENTER -> VIEW
    func upateLocations(_ locations:[Location])
}

protocol AlertDetailWireframeProtocol: class {

    func pushModule(fnavc:UINavigationController,event:Event)

    //var somePopupWireframe : SomePopupWireframe? { get set }

    //func presentSomePopupView(fpresenter : AlertDetailPresenter)

    // PRESENTER -> WIREFRAME
    func back()

}

protocol AlertDetailPresenterProtocol: class {
    var view: AlertDetailViewProtocol? { get set }
    var interactor: AlertDetailInteractorInputProtocol? { get set }
    var wireframe: AlertDetailWireframeProtocol? { get set }

    func leftBtnClicked()
    func rightBtnClicked()

    // VIEW -> PRESENTER
    func getInfoForEventId(_ eventId:Int)
}

protocol AlertDetailInteractorOutputProtocol: class {
    // INTERACTOR -> PRESENTER
    func locationsLoaded()
}

protocol AlertDetailInteractorInputProtocol: class {

    var presenter: AlertDetailInteractorOutputProtocol? { get set }

    var locations : [Location] { get set}

    //PRESENTER -> INTERACTOR
    func loadLocationsForEventId(_ eventId:Int)
}
/*
protocol SomePopupDelegate {
    func someFunctionFromSomePopup()
}
*/
