//
// Created by Lucas Rocali
// Copyright (c) 2017 Rocali. All rights reserved.
//

import Foundation
import UIKit
import MapKit

class AlertMapViewController: UIViewController, AlertMapViewProtocol {

    var presenter: AlertMapPresenterProtocol?

    @IBOutlet weak var mapView: MKMapView!
    var events : [Event] = []

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewDidAppear(_ animated: Bool) {
        presenter?.getInfo()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func setNavInfo(title: String?, leftBtnText: String?, rightBtnText: String?) {
        self.title = title

        let leftButton =  UIBarButtonItem(title: leftBtnText, style: .plain, target: self, action: #selector(self.leftBtnClicked(_:)))
        self.navigationItem.leftBarButtonItem = leftButton

        let rightButton =  UIBarButtonItem(title: rightBtnText, style: .plain, target: self, action: #selector(self.rightBtnClicked(_:)))
        self.navigationItem.rightBarButtonItem = rightButton
    }

    func leftBtnClicked(_ sender:UIBarButtonItem) {
        presenter?.leftBtnClicked()

    }
    func rightBtnClicked(_ sender:UIBarButtonItem) {
        presenter?.rightBtnClicked()
    }

    func updateEvents(events:[Event]) {
        self.events = events
        for event in events {
            let annotation = MKPointAnnotation()
            annotation.title = event.category
            annotation.coordinate = CLLocationCoordinate2D(latitude: event.lat, longitude: event.lon)
            mapView.addAnnotation(annotation)
        }
    }
}
