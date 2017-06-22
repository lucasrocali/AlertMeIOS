//
// Created by Lucas Rocali
// Copyright (c) 2017 Lucas Rocali. All rights reserved.
//

import Foundation

class AlertDetailPresenter: AlertDetailPresenterProtocol, AlertDetailInteractorOutputProtocol {
    
    weak var view: AlertDetailViewProtocol? {
        didSet {
            if let view = view {
                view.setNavInfo(title: "Event Detail", leftBtnText: "<",rightBtnText: "")

            }
        }
    }

    var interactor: AlertDetailInteractorInputProtocol?
    var wireframe: AlertDetailWireframeProtocol?

    init() {}

    //V -> P
    func leftBtnClicked() {
        wireframe?.back()
    }

    func rightBtnClicked() {
       // navigationWireframe?.next()
    }

    func getInfoForEventId(_ eventId:Int) {
        interactor?.loadLocationsForEventId(eventId)
    }

    //I -> P
    func locationsLoaded() {
        if let locations = interactor?.locations {
            view?.upateLocations(locations)
        }
    }

}
