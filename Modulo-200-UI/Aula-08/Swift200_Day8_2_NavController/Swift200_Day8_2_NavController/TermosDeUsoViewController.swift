//
//  TermosDeUsoViewController.swift
//  Swift200_Day8_2_NavController
//
//  Created by Swift on 29/10/16.
//  Copyright © 2016 Swift. All rights reserved.
//

import UIKit

class TermosDeUsoViewController: UIViewController {

  
    
    @IBAction func tapVoltar(_ sender: AnyObject) {
        // Quando tocamos no botão 'voltar', pedimos ao navController
        // para que retire a tela que está mais acima, no caso é esta
        // mesmo, a TermoDeUso
        let _ = self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func tapImprimir(_ sender: AnyObject) {
        
        if let controlador = self.storyboard?.instantiateViewController(withIdentifier: "imprimir"){
            self.navigationController?.pushViewController(controlador, animated: true)
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // Quando entra na tela pede para esconder a barra de navegação no topo
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        // Quando sai da tela volta a barra que estava lá no topo
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
}
