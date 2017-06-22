//
// Created by Lucas Rocali
// Copyright (c) 2017 Rocali. All rights reserved.
//

import Foundation

class AlertListPresenter: AlertListPresenterProtocol, AlertInteractorOutputProtocol {

    
    weak var view: AlertListViewProtocol? {
        didSet {
            if let view = view {
                view.setNavInfo(title: "List", leftBtnText: "",rightBtnText: "+")

            }
        }
    }

    var interactor: AlertInteractorInputProtocol?
    var wireframe: AlertListWireframeProtocol?

    init() {}

    func leftBtnClicked() {
        //navigationWireframe?.back()
    }

    func rightBtnClicked() {
        //navigationWireframe?.next()
    }

    func getInfo() {
        interactor?.loadEvents()
    }

    internal func eventsLoaded() {
        print("eventsLoaded")
        if let events = interactor?.getEvents() {
            view?.updateEvents(events: events)
        }

    }

}
