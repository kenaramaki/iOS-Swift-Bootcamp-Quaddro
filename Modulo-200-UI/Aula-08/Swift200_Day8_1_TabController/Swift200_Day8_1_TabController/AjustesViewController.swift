//
//  AjustesViewController.swift
//  Swift200_Day8_1_TabController
//
//  Created by Swift on 29/10/16.
//  Copyright © 2016 Swift. All rights reserved.
//

import UIKit

class AjustesViewController: UIViewController {

    // unwind segue
    @IBAction func voltei(_ sender:UIStoryboardSegue){
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("Ajustes vai aparecer")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("Ajustes apareceu")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("Ajustes vai desaparcer")
        
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("Ajustes desapareceu")
    }
   
}
