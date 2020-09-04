//
//  AnnotationPin.swift
//  Virtual Tourist Virtual Tourist VirtualTourist
//
//  Created by Mohammed on 22/08/2020.
//  Copyright © 2020 Alzuwayyid. All rights reserved.
//

import Foundation
import MapKit


class AnnotationPin: MKPointAnnotation {
    var pin: Pin

    init(pin: Pin){
        self.pin = pin
        super.init()
        self.coordinate = CLLocationCoordinate2D(latitude: pin.latitude, longitude: pin.longitude)
    }
}

