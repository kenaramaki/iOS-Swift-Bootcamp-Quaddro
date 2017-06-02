//
//  ViewController.swift
//  LocationServiceDuvida
//
//  Created by Swift on 11/02/17.
//  Copyright © 2017 Ken Aramaki. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {

    let locationManager = CLLocationManager()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        
        self.locationManager.requestWhenInUseAuthorization()
        
        //
        switch CLLocationManager.authorizationStatus() {
        case .authorizedAlways:
            print("authorizedAlways")
        case .authorizedWhenInUse:
            print("authorizedWhenInUse")
        case .denied:
            print("denied")
            
            let alerta = UIAlertController(title: "Oh no!", message: "Estamos sem autorização par acessar sua localização. Você precisa ir nas configurações do aparelho e autorizar para que possamos prosseguir", preferredStyle: .alert)
            
            let acaoOK = UIAlertAction(title: "Ok, vamos lá", style: .default, handler: { (acao) in
                
                UIApplication.shared.open(URL(string: UIApplicationOpenSettingsURLString)!)
                
            })
            
            
            let acaoCancelar = UIAlertAction(title: "Não. Obrigado, tchau", style: .cancel, handler: nil)
            
            alerta.addAction(acaoOK)
            alerta.addAction(acaoCancelar)
            
            self.present(alerta, animated: true, completion: nil)
            
        case .notDetermined:
            print("notDetermined")
        case .restricted:
            print("restricted")
        }
        
        
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

