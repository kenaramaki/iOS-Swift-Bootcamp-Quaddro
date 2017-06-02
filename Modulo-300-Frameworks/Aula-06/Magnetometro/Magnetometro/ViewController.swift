//
//  ViewController.swift
//  Magnetometro
//
//  Created by Swift on 18/02/17.
//  Copyright © 2017 Ken Aramaki. All rights reserved.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {

    
    // MARK: - Outlets
    @IBOutlet weak var labelMFX: UILabel!
    @IBOutlet weak var labelMFY: UILabel!
    @IBOutlet weak var labelMFZ: UILabel!
    
    // MARK: - Propriedades
    let motionManager = CMMotionManager()
    
    
    // MARK:- View Life Cycle
    
    
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
    @IBAction func ligarMagnetometro(_ sender: Any) {
        
        if motionManager.isMagnetometerAvailable {
            
            motionManager.startMagnetometerUpdates(to: OperationQueue.main, withHandler: { (data, error) in
                
                self.labelMFX.text = "\(data!.magneticField.x)"
                self.labelMFY.text = "\(data!.magneticField.y)"
                self.labelMFZ.text = "\(data!.magneticField.z)"

                
            })
            
        }
        
        
    }
    
    
    
}

