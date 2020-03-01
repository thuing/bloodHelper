//
//  map.swift
//  bloodHelper
//
//  Created by zyh on 2019/5/8.
//  Copyright © 2019 小福. All rights reserved.
//

import UIKit
import MapKit
import SnapKit
import CoreLocation

class patientMapViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    
    var mapView: MKMapView?
    //1. create locationManager
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "我的位置"
        //2.1 地图init
        mapView = MKMapView.init(frame:self.view.frame)
        self.view.addSubview(mapView!)
        //地图类型设置 - 标准地图
        self.mapView?.mapType = MKMapType.standard
        mapView?.snp.makeConstraints({ (make) in
            make.edges.equalTo(UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
        })
        // 2. setup locationManager
        locationManager.delegate = self
        locationManager.distanceFilter = kCLLocationAccuracyNearestTenMeters
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        
        // 3. setup mapView
        mapView?.delegate = self
        mapView?.showsUserLocation = true
        mapView?.userTrackingMode = .follow
        
        // 4. setup test data
        setupData()
        // Do any additional setup after loading the view.
    }
    
    func setupData() {
        // 1. check if system can monitor regions
        
        if CLLocationManager.isMonitoringAvailable(for: CLCircularRegion.self) {
            // 2. region data
            let title = "上海海洋大学"
            let coordinate = CLLocationCoordinate2DMake(30.8830378462, 121.8962717056)
            let regionRadius = 300.0
            
            // 3. setup region
            //            let region = CLCircularRegion(center: CLLocationCoordinate2D(latitude: coordinate.latitude,longitude: coordinate.longitude), radius: regionRadius, identifier: title)
            
            // 4. setup annotation
            let restaurantAnnotation = MKPointAnnotation()
            restaurantAnnotation.coordinate = coordinate;
            restaurantAnnotation.title = "\(title)";
            self.mapView?.addAnnotation(restaurantAnnotation)
            
            // 5. setup circle
            let circle = MKCircle(center: coordinate, radius: regionRadius)
            self.mapView?.add(circle)
        }
        else {
            print("System can't track regions")
        }
        
    }
    
    // 6. draw circle
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        
        let circleRenderer = MKCircleRenderer(overlay: overlay)
        circleRenderer.strokeColor = UIColor.red
        circleRenderer.lineWidth = 1.0
        return circleRenderer
    }
    
    var monitoredRegions: Dictionary<String, NSDate> = [:]
    
    // 1. user enter region
    func locationManager(_ manager: CLLocationManager, didEnterRegion region: CLRegion) {
        //        Tool.confirm(title: "erroe", message: region.identifier, controller: self)
        // 2.1 Add entrance time
        monitoredRegions[region.identifier] = NSDate()
        
    }
    // 2. user exit region
    func locationManager(_ manager: CLLocationManager, didExitRegion region: CLRegion) {
        //         Tool.confirm(title: "exit", message: region.identifier, controller: self)
        // 2.2 Remove entrance time
        monitoredRegions.removeValue(forKey: region.identifier)
    }
    
    // 3. Update resions logic
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        //        updateRegions()
        let currLocation: CLLocation!
        currLocation = locations.last! as CLLocation
        self.reverseGeocode(sender: currLocation, currLocation:currLocation)
    }
    //解析编译地理位置
    func reverseGeocode(sender: AnyObject, currLocation:CLLocation) {
        let geocoder = CLGeocoder()
        var p:CLPlacemark?
        geocoder.reverseGeocodeLocation(currLocation, completionHandler: { (placemarks, error) -> Void in
            if error != nil {
                print("reverse geodcode fail: \(error!.localizedDescription)")
                return
            }
            let pm = placemarks! as [CLPlacemark]
            if (pm.count > 0){
                p = placemarks![0]
                //                let arrayforProvince:Array = (p?.name!.componentsSeparatedByString("省"))!
                
                
                guard p != nil
                    else {
                        return
                }
                let arrayforProvince:[String] = (p!.name?.components(separatedBy:"省"))!
                let city:String = arrayforProvince.last!
                let  arrayforcity:[String] = (city.components(separatedBy:("市")))
                self.title = arrayforcity.first;
            }else{
                print("No Placemarks!")
            }
        })
    }
    
    
    
    
    func updateRegions() {
        // 1.
        let regionMaxVisiting = 10.0
        var regionsToDelete: [String] = []
        //2.
        for regionIdentifier in monitoredRegions.keys {
            //3.
            if NSDate().timeIntervalSince(monitoredRegions[restorationIdentifier!]! as Date) > regionMaxVisiting {
                //showAlert("Thanks for visiting our restaurant")
                regionsToDelete.append((regionIdentifier))
            }
            // 4.
            for regionIdentifier in regionsToDelete {
                monitoredRegions.removeValue(forKey: regionIdentifier)
            }
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        // 1. status is not determined
        if CLLocationManager.authorizationStatus() == .notDetermined {
            locationManager.requestAlwaysAuthorization()
        }
            // 2. authorization were denied
        else if CLLocationManager.authorizationStatus() == .denied {
            //showAlert("Location services were previously denied, please enable loaction services")
        }
            // 3. we do have authorization
        else if CLLocationManager.authorizationStatus() == .authorizedAlways {
            locationManager.startUpdatingLocation()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
}
