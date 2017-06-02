//
//  ViewController.swift
//  CoreLocationBussula
//
//  Created by Swift on 04/02/17.
//  Copyright © 2017 Ken Aramaki. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {

    // MARK: - IBOutlets
    @IBOutlet weak var agulhaView: UIView!
    
    // MARK: - Propriedades
    let locationManager = CLLocationManager()
    
    
    // MARK: - ViewLifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        
        self.locationManager.delegate = self
        
        locationManager.startUpdatingHeading()
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Métodos
    
    
    
    // MARK: - Actions
    

    // MARK: - Métodos de CLLocationManagerDelegate
    func locationManager(_ manager: CLLocationManager, didUpdateHeading newHeading: CLHeading) {
        
        // resgatando o ângulo baseado no norte
        let angulo = newHeading.magneticHeading
        let radianos = angulo * M_PI / 180
        
        self.agulhaView.transform = CGAffineTransform(rotationAngle: CGFloat(radianos))
        
    }
    
    
}

