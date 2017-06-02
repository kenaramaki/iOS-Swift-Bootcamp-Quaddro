//
//  ViewController.swift
//  Swift200_Day5_1_Autolayout
//
//  Created by Swift on 08/10/16.
//  Copyright © 2016 Quaddro. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var viewsDeFundo: [UIView]!
    
    let minhaTocadoraDeRadio = TocadoraDeRadio()
    
    @IBAction func voltei(sender:UIStoryboardSegue) {
        
    }
    
    
    // Altera a cor do relogio e marcador de bateria para cor branca
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    
    
    @IBAction func clickRock(sender: UIButton) {
        atualizaBorda(sender)
        minhaTocadoraDeRadio.mudarDeEstação(.Rock)
    }
    
    @IBAction func clickPop(sender: UIButton) {
        atualizaBorda(sender)
        minhaTocadoraDeRadio.mudarDeEstação(.Pop)

    }
    
    @IBAction func clickEcletica(sender: UIButton) {
        atualizaBorda(sender)
        minhaTocadoraDeRadio.mudarDeEstação(.Ecletica)
    }
    
    @IBAction func clickEletronica(sender: UIButton) {
        atualizaBorda(sender)
        minhaTocadoraDeRadio.mudarDeEstação(.Eletronica)
    }
    
    func atualizaBorda(botão:UIButton){
        
        // Primeiro removo a borda de todos
        for view in viewsDeFundo {
            view.layer.borderColor = UIColor.clearColor().CGColor
        }
        
        // Depois faço a borda da view em que o botãoselecionado está incluído (superview)
        botão.superview?.layer.borderColor = UIColor.redColor().CGColor
        botão.superview?.layer.borderWidth = 3.0
        
    }
    
}

