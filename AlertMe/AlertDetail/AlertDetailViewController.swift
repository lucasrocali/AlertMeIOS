//
// Created by Lucas Rocali
// Copyright (c) 2017 Lucas Rocali. All rights reserved.
//

import Foundation
import UIKit
import MapKit

class MyPointAnnotation : MKPointAnnotation {
    var pinTintColor: UIColor?
}

class AlertDetailViewController: UIViewController,MKMapViewDelegate, AlertDetailViewProtocol {

    var presenter: AlertDetailPresenterProtocol?

    var event : Event?

    var locations : [Location] = []

    @IBOutlet weak var categoryNameLbl: UILabel!
    @IBOutlet weak var userNameLbl: UILabel!
    @IBOutlet weak var dateLbl: UILabel!
    
    @IBOutlet weak var mapView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()

        mapView.delegate = self

        if let event = event {
            categoryNameLbl.text = event.category
            userNameLbl.text = event.userName
            dateLbl.text = event.date

            presenter?.getInfoForEventId(event.id)

            let annotation = MyPointAnnotation()
            annotation.pinTintColor = UIColor.blue
            annotation.title = event.category
            annotation.coordinate = CLLocationCoordinate2D(latitude: event.lat, longitude: event.lon)
            mapView.addAnnotation(annotation)

            let homeLocation = CLLocation(latitude: event.lat, longitude: event.lon)
            let regionRadius: CLLocationDistance = 10000
            let coordinateRegion = MKCoordinateRegionMakeWithDistance(homeLocation.coordinate,
                                                                      regionRadius * 2.0, regionRadius * 2.0)
            mapView.setRegion(coordinateRegion, animated: true)        }

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

    func upateLocations(_ locations:[Location]) {
        print("upateLocations")
        print(locations)
        self.locations = locations
        for location in locations {

            if location.lat != event?.lat && location.lon != event?.lon {

                let annotation = MyPointAnnotation()
                annotation.pinTintColor = UIColor.red
                annotation.title = location.userName
                annotation.coordinate = CLLocationCoordinate2D(latitude: location.lat, longitude: location.lon)
                mapView.addAnnotation(annotation)
            }

        }

    }

    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: "myAnnotation") as? MKPinAnnotationView

        if annotationView == nil {
            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: "myAnnotation")
        } else {
            annotationView?.annotation = annotation
        }

        if let annotation = annotation as? MyPointAnnotation {
            annotationView?.pinTintColor = annotation.pinTintColor
        }

        return annotationView
    }
}
