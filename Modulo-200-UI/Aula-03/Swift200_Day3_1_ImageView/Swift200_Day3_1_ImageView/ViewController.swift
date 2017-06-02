//
//  ViewController.swift
//  Swift200_Day3_1_ImageView
//
//  Created by Swift on 24/09/16.
//  Copyright © 2016 Quaddro. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBAction func abreMapa(sender: AnyObject) {
        
        // Documentação em: http://apple.co/2cHroho
        if let endereço = NSURL(string: "http://maps.apple.com/?daddr=Parque+do+ibirapuera&addr=sao-paulo&dirflg"){
            UIApplication.sharedApplication().openURL(endereço)
        }
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        // Garante que essa é a segue que leva para a tela de detalhes
        // e garante que a segue tem um identificador
        if let destino = segue.destinationViewController as? DetalhesViewController,
            let item = segue.identifier {
            
            destino.item = item
            
        }
        
        
    }
    
    
}

