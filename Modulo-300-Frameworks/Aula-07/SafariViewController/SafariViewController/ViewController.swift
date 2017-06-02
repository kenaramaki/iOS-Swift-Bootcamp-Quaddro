//
//  ViewController.swift
//  SafariViewController
//
//  Created by Swift on 04/03/17.
//  Copyright © 2017 Ken Aramaki. All rights reserved.
//

import UIKit
// Importando o framework
import SafariServices

class ViewController: UIViewController, SFSafariViewControllerDelegate {

    // MARK: - Outlets
    
    // MARK: - Propriedades
    
    // MARK: - View Life Cycle
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }



    // MARK: - Métodos
    
    // MARK: - Actions
    @IBAction func abrirSafariViewController(_ sender: UIButton) {
        
        let meuSafariViewController = SFSafariViewController(url: URL(string: "http://www.google.com.br")!)
        
        self.present(meuSafariViewController, animated: true, completion: nil)
        
        meuSafariViewController.delegate = self
    }
    
    // MARK: - Métodos de SFSafariViewControllerDelegate
    func safariViewController(_ controller: SFSafariViewController, didCompleteInitialLoad didLoadSuccessfully: Bool) {
        
        print("Carregamento inicial concluído")
        
    }
    
    func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
        
        print("Did Finish")
        
    }
    
    
    
    
    
}

