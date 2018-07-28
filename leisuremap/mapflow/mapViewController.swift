//
//  mapViewController.swift
//  leisuremap
//
//  Created by stu1 on 2018/7/25.
//  Copyright © 2018年 stu1. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class mapViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {

    @IBOutlet weak var mapView: MKMapView!
    //Location
    
    let locationManager = CLLocationManager()
    
    let regionRodius : CLLocationDistance = 1000
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //
        locationManager.requestAlwaysAuthorization()
        locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled(){
            
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.startUpdatingLocation()
        
        }
        
        //
        mapView.delegate = self
        mapView.showsUserLocation = true
        
        let flag = MapFlag(title: "iOS App Swift", locationName: "ABC", discipline: "Apple Room", coordinate: CLLocationCoordinate2D(latitude:31.29075118, longitude: 118.3623587), url: "https://apple.longitude: com")
        
        mapView.addAnnotation(flag)
        
        //centerMapOnLocation( )
        
    }
    
    func centerMapOnLocation(location : CLLocation){
        
        let coordinateRegion = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: regionRodius, longitudinalMeters: regionRodius)
        
        mapView.setRegion( coordinateRegion, animated: true )
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdatelocations locations: [CLLocation]){
        
        
        guard let locValue : CLLocationCoordinate2D = manager.location? .coordinate else {
            
            return
        }

        print( "latitude:\( locValue.latitude): longitude: \(locValue.longitude)" )
        centerMapOnLocation(location: manager.location!)
        
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
       
        guard let annotation = annotation as? MapFlag else{
            return nil
        }
        
        let identifier = "marker"
        let annotationView : MKAnnotationView
        
        if let dequeueView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) as? MKMarkerAnnotationView{
            dequeueView.annotation = annotation
            annotationView = dequeueView
            
        }else{
            annotationView = MKMarkerAnnotationView(annotation:annotation,reuseIdentifier:identifier)
            annotationView.canShowCallout = true
            annotationView.calloutOffset = CGPoint( x:-5,y: 5)
            
            let button = UIButton(type: .contactAdd)
            annotationView.rightCalloutAccessoryView = button
            
            button.addTarget(self, action: #selector(self.moveToWeb(sender:)),for: .touchUpInside)
            
        }
        
        
    
        return annotationView
    
    
    }
    
    
    @objc func moveToWeb(sender: UIButton){
        
        
    }

}
