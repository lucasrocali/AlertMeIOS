//
// Created by Lucas Rocali
// Copyright (c) 2017 Lucas Rocali. All rights reserved.
//

import Foundation
import UIKit
import MapKit

class CreateEventViewController: UIViewController, CreateEventViewProtocol,UICollectionViewDelegate,UICollectionViewDataSource,CLLocationManagerDelegate,MKMapViewDelegate {

    @IBOutlet weak var categoriesCollectionView: UICollectionView!
    @IBOutlet weak var mapView: MKMapView!
    var locationManager : CLLocationManager!
    var presenter: CreateEventPresenterProtocol?

    var categories : [Category] = []

    var selectedCategoryIndex = -1
    var lastUserLocation:CLLocation?

    override func viewDidLoad() {
        super.viewDidLoad()

        presenter?.getCategories()

    }

    override func viewWillAppear(_ animated: Bool) {
        selectedCategoryIndex = -1
        categoriesCollectionView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func updateCategories(categories:[Category]) {
        self.categories = categories
        categoriesCollectionView.reloadData()
    }


    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        determineCurrentLocation()
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


    func determineCurrentLocation()
    {
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()

        if CLLocationManager.locationServicesEnabled() {
            //locationManager.startUpdatingHeading()
            locationManager.startUpdatingLocation()
        }
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        lastUserLocation = locations[0] as CLLocation

        // Call stopUpdatingLocation() to stop listening for location updates,
        // other wise this function will be called every time when user location changes.
        //manager.stopUpdatingLocation()

        if let userLocation = lastUserLocation {
            let center = CLLocationCoordinate2D(latitude: userLocation.coordinate.latitude, longitude: userLocation.coordinate.longitude)
            let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))

            mapView.setRegion(region, animated: true)

            // Drop a pin at user's Current Location
            let myAnnotation: MKPointAnnotation = MKPointAnnotation()
            myAnnotation.coordinate = CLLocationCoordinate2DMake(userLocation.coordinate.latitude, userLocation.coordinate.longitude);
            myAnnotation.title = "Current location"
            mapView.addAnnotation(myAnnotation)
        }
    }


    //MARK: Collection View
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return categories.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell : CategoryCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "categoryCell", for: indexPath) as! CategoryCollectionViewCell

        cell.categoryLbl.text = categories[indexPath.row].name
        cell.layer.borderColor = UIColor.darkGray.cgColor
        cell.layer.borderWidth = 1

        if (cell.isSelected) {
            cell.backgroundColor = UIColor.lightGray
        } else {
            cell.backgroundColor = UIColor.white
        }

        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell : CategoryCollectionViewCell = collectionView.cellForItem(at: indexPath) as! CategoryCollectionViewCell
        cell.backgroundColor = UIColor.lightGray

        selectedCategoryIndex = indexPath.row
    }

    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let cell : CategoryCollectionViewCell = collectionView.cellForItem(at: indexPath) as! CategoryCollectionViewCell
        cell.backgroundColor = UIColor.white
    }

    @IBAction func confirmEvent(_ sender: Any) {
        if let userLocation = lastUserLocation, selectedCategoryIndex >= 0 {
            let category = categories[selectedCategoryIndex]
            let event = Event(categoryId: category.id, lat: userLocation.coordinate.latitude, lon: userLocation.coordinate.longitude, importance: 5, comment: "")
            presenter?.createEvent(event: event)
        }

    }
}
