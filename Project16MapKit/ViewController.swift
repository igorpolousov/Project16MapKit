//
//  ViewController.swift
//  Project16MapKit
//
//  Created by Igor Polousov on 31.10.2021.
//
import MapKit
import UIKit

class ViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Map Type", style: .plain, target: self, action: #selector(changeMapView))
        
        let london = Capital(title: "London", coordinate:CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275), info: "Home to the 2012 Summer Olympics")
        let oslo = Capital(title: "Oslo", coordinate: CLLocationCoordinate2D(latitude: 59.95, longitude: 10.75), info: "It was founded a thousand years ago")
        let paris = Capital(title: "Paris", coordinate: CLLocationCoordinate2D(latitude: 48.8567, longitude: 2.3508), info: "Often called the city of Light")
        let rome = Capital(title: "Rome", coordinate: CLLocationCoordinate2D(latitude: 41.9, longitude: 12.5), info: "Has a whole country inside it")
        let washington = Capital(title: "Washington DC", coordinate: CLLocationCoordinate2D(latitude: 38.895111, longitude: -77.036667), info: "Named after George himself")
        
        mapView.addAnnotations([london, oslo, paris, rome, washington ])
    }

    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard annotation is Capital else { return nil }
        
        let identifier = "Capital"
        
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) as? MKPinAnnotationView
        
        
        if annotationView == nil {
            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            annotationView?.canShowCallout = true
            
            let btn = UIButton(type: .detailDisclosure)
            annotationView?.rightCalloutAccessoryView = btn
        } else {
            annotationView?.annotation = annotation
        }
        
        annotationView?.pinTintColor = UIColor.blue
        return annotationView
    }

    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        guard let capital = view.annotation as? Capital else { return }
        
        let placeName = capital.title
        let placeInfo = capital.info
        
        let ac = UIAlertController(title: placeName, message: placeInfo, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Ok", style: .default))
        present(ac, animated: true)
    }
    
    @objc func changeMapView() {
        let ac = UIAlertController(title: "Choose map view", message: "Here you can choose map view", preferredStyle: .actionSheet)
        ac.addAction(UIAlertAction(title: "Satellite", style: .default, handler: setMapType))
        ac.addAction(UIAlertAction(title: "Hybrid", style: .default, handler: setMapType))
        ac.addAction(UIAlertAction(title: "Hybrid FlyOver", style: .default, handler: setMapType))
        ac.addAction(UIAlertAction(title: "Muted Standart", style: .default, handler: setMapType))
        ac.addAction(UIAlertAction(title: "Satellite FlyOver", style: .default, handler: setMapType))
        ac.addAction(UIAlertAction(title: "Standart", style: .default, handler: setMapType))
        present(ac, animated: true)
    }
    
    func setMapType(action: UIAlertAction) {
        guard let setTitlte = action.title else { return }
        
        
        switch setTitlte {
        case "Standart":
            mapView.mapType = .standard
        case "Hybrid":
            mapView.mapType = .hybrid
        case "Hybrid FlyOver":
            mapView.mapType = .hybridFlyover
        case "Muted Standart":
            mapView.mapType = .mutedStandard
        case "Satellite":
            mapView.mapType = .satellite
        case "Satellite FlyOver":
            mapView.mapType = .satelliteFlyover
        default:
            mapView.mapType = .standard
        }
        
    }
}

