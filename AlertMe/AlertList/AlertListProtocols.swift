//
// Created by Lucas Rocali
// Copyright (c) 2017 Rocali. All rights reserved.
//

import Foundation
import UIKit

protocol AlertListViewProtocol: class {

    var presenter: AlertListPresenterProtocol? { get set }

    func setNavInfo(title:String?,leftBtnText:String?,rightBtnText:String?)
    func leftBtnClicked(_ sender:UIBarButtonItem)
    func rightBtnClicked(_ sender:UIBarButtonItem)

    // PRESENTER -> VIEW
    func updateEvents(events:[Event])
}

protocol AlertListWireframeProtocol: class {

    func setModule()

    //var somePopupWireframe : SomePopupWireframe? { get set }

    //func presentSomePopupView(fpresenter : AlertListPresenter)

    // PRESENTER -> WIREFRAME

}

protocol AlertListPresenterProtocol: class {
    var view: AlertListViewProtocol? { get set }
    var interactor: AlertInteractorInputProtocol? { get set }
    var wireframe: AlertListWireframeProtocol? { get set }

    func leftBtnClicked()
    func rightBtnClicked()

    // VIEW -> PRESENTER
    func getInfo()
}

/*
protocol SomePopupDelegate {
    func someFunctionFromSomePopup()
}
*/
