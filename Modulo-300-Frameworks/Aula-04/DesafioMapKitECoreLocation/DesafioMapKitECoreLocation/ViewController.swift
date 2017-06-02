//
//  ViewController.swift
//  DesafioMapKitECoreLocation
//
//  Created by Swift on 04/02/17.
//  Copyright © 2017 Ken Aramaki. All rights reserved.
//

import UIKit
import MapKit

// Coordenadas Oiapoque: 4.407888, -51.510440
// Coordenadas Chuí: -33.689547, -53.447342


//
let coordenadasOiapoque = CLLocationCoordinate2D(latitude: 4.407888, longitude: -51.510440)
let coordenadasChui = CLLocationCoordinate2D(latitude: -33.689547, longitude: -53.447342)

//
let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)

//
let regiaoOiapoque = MKCoordinateRegion(center: coordenadasOiapoque, span: span)
let regiaoChui = MKCoordinateRegion(center: coordenadasChui, span: span)




class ViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var mapa: MKMapView!
    
    // MARK: - Propriedades
    
    // MARK: - View Life Cycle
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setPino(coordenadas: coordenadasOiapoque, titulo: "Oiapoque")
        setPino(coordenadas: coordenadasChui, titulo: "Chuí")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    // MARK: - Métodos
    func setPino(coordenadas: CLLocationCoordinate2D, titulo: String) {
        
        let pino = MKPointAnnotation()
        pino.title = titulo
        pino.coordinate = coordenadas
        self.mapa.addAnnotation(pino)
        
    }
    
    // MARK: - Actions
    
    @IBAction func mudarOiapoque(_ sender: UIBarButtonItem) {
        
        self.mapa.setRegion(regiaoOiapoque, animated: true)
        
    }
    
    @IBAction func mudarChui(_ sender: UIBarButtonItem) {
        
        self.mapa.setRegion(regiaoChui, animated: true)
        
    }
    
    @IBAction func mudarMapa(_ sender: UISegmentedControl) {
        
        switch sender.selectedSegmentIndex {
        case 0:
            self.mapa.mapType = .standard
        case 1:
            self.mapa.mapType = .satellite
        default:
            self.mapa.mapType = .standard
        }
        
    }
    
}

