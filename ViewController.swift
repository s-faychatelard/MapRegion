//
//  ViewController.swift
//  MapRegion
//
//  Created by Sylvain Fay-Chatelard on 9/29/15.
//  Copyright © 2015 Sylvain Fay-Chatelard. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {
    
    @IBOutlet var mapView: MKMapView!
    @IBOutlet var regionLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.regionLabel.text = ""
    }
    
    func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
        let northEast = CLLocationCoordinate2DMake(self.mapView.region.center.latitude + self.mapView.region.span.latitudeDelta / 2,
                                                   self.mapView.region.center.longitude + self.mapView.region.span.longitudeDelta / 2)
        let southWest = CLLocationCoordinate2DMake(self.mapView.region.center.latitude - self.mapView.region.span.latitudeDelta / 2,
                                                   self.mapView.region.center.longitude - self.mapView.region.span.longitudeDelta / 2)

        self.regionLabel.text = """
                                [
                                    "centerLatitude": \(self.mapView.region.center.latitude),
                                    "centerLongitude": \(self.mapView.region.center.longitude)),
                                    "latitudeDelta": \(self.mapView.region.span.latitudeDelta),
                                    "longitudeDelta": \(self.mapView.region.span.longitudeDelta)
                                ]

                                MapBounds(
                                    latitudeNorth = \(northEast.latitude),
                                    latitudeSouth = \(southWest.latitude),
                                    longitudeEast = \(northEast.longitude),
                                    longitudeWest = \(southWest.longitude)
                                )
                                """
    }
    
    @IBAction func copyToPasteboard() {
        print(self.regionLabel.text)
        UIPasteboard.general.string = self.regionLabel.text
    }
}

