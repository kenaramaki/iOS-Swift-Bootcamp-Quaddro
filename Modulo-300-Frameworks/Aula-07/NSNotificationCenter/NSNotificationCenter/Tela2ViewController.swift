//
//  Tela2ViewController.swift
//  NSNotificationCenter
//
//  Created by Swift on 04/03/17.
//  Copyright © 2017 Ken Aramaki. All rights reserved.
//

import UIKit

class Tela2ViewController: UIViewController {

    // MARK: - Outlets
    
    // MARK: - Propriedades
    
    // MARK: - View Life Cycle
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: -  Métodos
    
    
    // MARK: - Actions
    @IBAction func dispararNotificacao(_ sender: UIButton) {
        
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "NOTIFICACAO"), object: nil, userInfo: ["nome" : "Ken", "sobrenome" : "Aramaki"])
        
        self.dismiss(animated: true, completion: nil)
        
    }

    
 
}
