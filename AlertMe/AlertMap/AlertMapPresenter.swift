//
// Created by Lucas Rocali
// Copyright (c) 2017 Rocali. All rights reserved.
//

import Foundation

class AlertMapPresenter: AlertMapPresenterProtocol, AlertInteractorOutputProtocol {
    
    weak var view: AlertMapViewProtocol? {
        didSet {
            if let view = view {
                view.setNavInfo(title: "Map", leftBtnText: "<",rightBtnText: "+")

            }
        }
    }

    var interactor: AlertInteractorInputProtocol?
    var wireframe: AlertMapWireframeProtocol?

    init() {}



    func leftBtnClicked() {
        wireframe?.logout()
        //navigationWireframe?.back()
    }

    func rightBtnClicked() {
        //navigationWireframe?.next()
    }

    func getInfo() {
        interactor?.loadEvents()
    }

    //I -> P
    func eventsLoaded() {
        print("eventsLoaded")
        if let events = interactor?.getEvents() {
            view?.updateEvents(events: events)
        }
    }

}
