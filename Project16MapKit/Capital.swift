//
//  Capital.swift
//  Project16MapKit
//
//  Created by Igor Polousov on 31.10.2021.
//

import UIKit
import MapKit

class Capital: NSObject, MKAnnotation {

    var title: String?
    var coordinate: CLLocationCoordinate2D
    var info: String
    var html: String
    
    init(title: String, coordinate: CLLocationCoordinate2D, info: String, html: String) {
        self.title = title
        self.coordinate = coordinate
        self.info = info
        self.html = html
    }
    
}
