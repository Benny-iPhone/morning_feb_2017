//
//  MapViewController.swift
//  LocationProject
//
//  Created by Benny Davidovitz on 24/04/2017.
//  Copyright © 2017 xcoder.solutions. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController, MKMapViewDelegate {
    @IBOutlet weak var mapView: MKMapView!

    override func viewDidLoad() {
        super.viewDidLoad()

        mapView.showsUserLocation = true
        mapView.delegate = self
        
        mapView.addAnnotations(Branch.sampleArray())
    }

    //MARK: - MKMapView Delegate
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        if annotation is MKUserLocation{
            return nil
        }
        
        var annView = mapView.dequeueReusableAnnotationView(withIdentifier: "ann") as? MKPinAnnotationView
        if annView == nil{
            annView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: "ann")
            annView?.pinTintColor = .black
            annView?.canShowCallout = true
            
            let button = UIButton(type: .infoLight)
            annView?.rightCalloutAccessoryView = button
            
        } else {
            annView?.annotation = annotation
        }
        
        return annView
        
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        
        guard let branch = view.annotation as? Branch else {
            return
        }
        
        guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "BranchDetailsViewController") as? BranchDetailsViewController else {
            return
        }
        
        nextVC.branch = branch
        
        self.navigationController?.show(nextVC, sender: control)
        
        
        
    }

}













