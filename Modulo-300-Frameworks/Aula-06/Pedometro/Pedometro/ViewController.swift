//
//  ViewController.swift
//  Pedometro
//
//  Created by Swift on 18/02/17.
//  Copyright © 2017 Ken Aramaki. All rights reserved.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var labelPassos: UILabel!
    
    // MARK: - Propriedades
    var pedometro = CMPedometer()
    
    
    
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
    @IBAction func ligarPedometro(_ sender: UIButton) {
    
        if CMPedometer.isStepCountingAvailable() {
            
            self.pedometro.startUpdates(from: Date(), withHandler: { (data, error) in
                
                self.labelPassos.text = "\(data!.numberOfSteps)"
                
            })
            
            
        }
        
    
    
    }
    
    
}

