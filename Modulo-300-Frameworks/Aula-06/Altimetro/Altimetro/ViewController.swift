//
//  ViewController.swift
//  Altimetro
//
//  Created by Swift on 18/02/17.
//  Copyright © 2017 Ken Aramaki. All rights reserved.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var labelRelativeAltitude: UILabel!
    @IBOutlet weak var labelPressure: UILabel!
    
    // MARK: - Propriedades
    let altimetro = CMAltimeter()
    
    
    // MARL: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Métodos
    
    // MARK: - Actions
    @IBAction func ligarAltimetro(_ sender: UIButton) {
        
        if CMAltimeter.isRelativeAltitudeAvailable() {
            
            self.altimetro.startRelativeAltitudeUpdates(to: OperationQueue.main, withHandler: { (data, error) in
                
                let altitudeData = data
                
                self.labelRelativeAltitude.text = "\(altitudeData?.relativeAltitude)m"
                
                self.labelPressure.text = "\(altitudeData?.pressure) kpa"
                
            })
            
        }
        
    }
    

}

