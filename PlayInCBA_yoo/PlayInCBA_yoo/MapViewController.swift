//
//  MapViewController.swift
//  PlayInCBA_yoo
//
//  Created by 게임공학과 on 2018. 5. 27..
//  Copyright © 2018년 게임공학과. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController, MKMapViewDelegate {
    
    var audioController: AudioController
    required init?(coder aDecoder: NSCoder) {
        audioController = AudioController()
        audioController.preloadAudioEffects(audioFileNames: AudioEffectFiles)
        
        super.init(coder: aDecoder)
    }
    @IBAction func Back(_ sender: Any) {
        audioController.playerEffect(name: "ding.mp3")
    }
    
    @IBOutlet weak var mapView: MKMapView!
    var campusName : String?
    
    var posts = NSMutableArray()
    
    let regionRadius: CLLocationDistance = 300
    
    func centerMapOnLocation(location: CLLocation){
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, regionRadius, regionRadius)
        
        mapView.setRegion(coordinateRegion, animated: true)
    }
    
    var campus : [Campus] = []
    
    func loadInitData(){
        var location = CLLocationCoordinate2DMake(37.369302, 126.938652)
        var span = MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
        var region = MKCoordinateRegion(center: location, span: span)
        
        var annotation = MKPointAnnotation()
        
        annotation.coordinate = location
        annotation.title = "필레오 센터"
        annotation.subtitle = "Check for Alert"
        
        mapView.setRegion(region, animated: true)
        mapView.addAnnotation(annotation)
        
        ///////////////////////////////////////
        
        location = CLLocationCoordinate2DMake(37.557918, 126.936672)
        span = MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
        region = MKCoordinateRegion(center: location, span: span)
        annotation = MKPointAnnotation()
        
        
        annotation.coordinate = location
        annotation.title = "신촌 센터"
        annotation.subtitle = "Check for Alert"
        
        mapView.setRegion(region, animated: true)
        mapView.addAnnotation(annotation)
        
        ///////////////////////////////////////
        
        location = CLLocationCoordinate2DMake(37.488647, 126.729723)
        span = MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
        region = MKCoordinateRegion(center: location, span: span)
        annotation = MKPointAnnotation()
        
        annotation.coordinate = location
        annotation.title = "인천 센터"
        annotation.subtitle = "Check for Alert"
        
        mapView.setRegion(region, animated: true)
        mapView.addAnnotation(annotation)
        
        ///////////////////////////////////////
        
        location = CLLocationCoordinate2DMake(37.590693, 127.017252)
        span = MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
        region = MKCoordinateRegion(center: location, span: span)
        annotation = MKPointAnnotation()
        
        annotation.coordinate = location
        annotation.title = "대학로 센터"
        annotation.subtitle = "Check for Alert"
        
        mapView.setRegion(region, animated: true)
        mapView.addAnnotation(annotation)
        
        
        ///////////////////////////////////////
        
        location = CLLocationCoordinate2DMake(37.504874, 126.902067)
        span = MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
        region = MKCoordinateRegion(center: location, span: span)
        annotation = MKPointAnnotation()
        
        annotation.coordinate = location
        annotation.title = "성락교회"
        annotation.subtitle = "Check for Alert"
        
        mapView.setRegion(region, animated: true)
        mapView.addAnnotation(annotation)
    }

    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl){
        let location = view.annotation as! Campus
        let launchOptions = [MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving]
        location.mapItem().openInMaps(launchOptions: launchOptions)
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView?{
        
        guard let annotation = annotation as? Campus else { return nil }
        let identifier = "marker"
        var view: MKMarkerAnnotationView
        
        if let dequeuedView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) as? MKMarkerAnnotationView {
            dequeuedView.annotation = annotation
            view = dequeuedView
        } else{
            view = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            view.canShowCallout = true
            view.calloutOffset = CGPoint(x: -5, y: 5)
            view.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
        }
        return view
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadInitData()
        
        
        if(campusName == "필레오"){
            centerMapOnLocation(location: CLLocation(latitude: 37.369302, longitude: 126.938652)) // 필레오
        }
        else if (campusName == "신촌"){
            centerMapOnLocation(location: CLLocation(latitude: 37.557918, longitude: 126.936672)) // 신촌
        }
        else if (campusName == "대학로"){
            centerMapOnLocation(location: CLLocation(latitude: 37.590693, longitude: 127.017252)) // 대학로
        }
        else if (campusName == "인천"){
            centerMapOnLocation(location: CLLocation(latitude: 37.488647, longitude: 126.729723)) // 인천
        }
        else {
            centerMapOnLocation(location: CLLocation(latitude: 37.504874, longitude: 126.902067)) // 성락교회
        }
        
        /*
        let initialLocation = CLLocation(latitude: 37.369302, longitude: 126.938652)
        centerMapOnLocation(location: initialLocation)
        mapView.delegate = self as? MKMapViewDelegate
        loadInitData()
        mapView.addAnnotation(campus as! MKAnnotation)
         */
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
