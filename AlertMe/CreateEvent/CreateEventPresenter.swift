//
// Created by Lucas Rocali
// Copyright (c) 2017 Lucas Rocali. All rights reserved.
//

import Foundation

class CreateEventPresenter: CreateEventPresenterProtocol, CreateEventInteractorOutputProtocol {
    
    weak var view: CreateEventViewProtocol? {
        didSet {
            if let view = view {
                view.setNavInfo(title: "Create Event", leftBtnText: "",rightBtnText: "")

            }
        }
    }

    var interactor: CreateEventInteractorInputProtocol?
    var wireframe: CreateEventWireframeProtocol?

    init() {}

    func leftBtnClicked() {
        //navigationWireframe?.back()
    }

    func rightBtnClicked() {
        //navigationWireframe?.next()
    }

    //P -> I
    func getCategories() {
        if let categories = interactor?.getCategories(){
            view?.updateCategories(categories: categories)
        }

    }

    func createEvent(event:Event) {
        interactor?.createEvent(event: event)
    }

}
