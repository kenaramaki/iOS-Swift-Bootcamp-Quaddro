//
//  ViewController.swift
//  NSNotificationCenter
//
//  Created by Swift on 04/03/17.
//  Copyright © 2017 Ken Aramaki. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var labelUnica: UILabel!
    
    // MARK: - Propriedades
    
    // MARK: - View Life Cycle
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.funcaoDisparadaPelaNotificacao(_:)), name: NSNotification.Name(rawValue: "NOTIFICACAO"), object: nil)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: -  Métodos
    func funcaoDisparadaPelaNotificacao(_ notificacao : Notification) {
        
        self.labelUnica.text = "Funfou"
        
        print(notificacao.userInfo)
        
        
    }
    
    
    
    // MARK: - Actions


}

