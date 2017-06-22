//
// Created by Lucas Rocali
// Copyright (c) 2017 Lucas Rocali. All rights reserved.
//

import Foundation
import UIKit

protocol CreateEventViewProtocol: class {

    var presenter: CreateEventPresenterProtocol? { get set }

    func setNavInfo(title:String?,leftBtnText:String?,rightBtnText:String?)
    func leftBtnClicked(_ sender:UIBarButtonItem)
    func rightBtnClicked(_ sender:UIBarButtonItem)

    // PRESENTER -> VIEW
    func updateCategories(categories:[Category])
}

protocol CreateEventWireframeProtocol: class {

    func setModule()

    //var somePopupWireframe : SomePopupWireframe? { get set }

    //func presentSomePopupView(fpresenter : CreateEventPresenter)

    // PRESENTER -> WIREFRAME

}

protocol CreateEventPresenterProtocol: class {
    var view: CreateEventViewProtocol? { get set }
    var interactor: CreateEventInteractorInputProtocol? { get set }
    var wireframe: CreateEventWireframeProtocol? { get set }

    func leftBtnClicked()
    func rightBtnClicked()

    // VIEW -> PRESENTER
    func getCategories()
    func createEvent(event:Event)
}

protocol CreateEventInteractorOutputProtocol: class {
    // INTERACTOR -> PRESENTER
}

protocol CreateEventInteractorInputProtocol: class {

    var presenter: CreateEventInteractorOutputProtocol? { get set }

    //PRESENTER -> INTERACTOR
    func getCategories() -> [Category]
    func createEvent(event:Event)
}
/*
protocol SomePopupDelegate {
    func someFunctionFromSomePopup()
}
*/
