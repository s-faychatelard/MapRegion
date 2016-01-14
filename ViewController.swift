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
    
    func mapView(mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
        self.regionLabel.text = "CLLocationCoordinate2DMake(\(self.mapView.region.center.latitude), \(self.mapView.region.center.longitude))\n"
                              + "MKCoordinateSpanMake(\(self.mapView.region.span.latitudeDelta), \(self.mapView.region.span.longitudeDelta));";
    }
    
    @IBAction func copyToPasteboard() {
        print(self.regionLabel.text)
        UIPasteboard.generalPasteboard().string = self.regionLabel.text
    }
}

