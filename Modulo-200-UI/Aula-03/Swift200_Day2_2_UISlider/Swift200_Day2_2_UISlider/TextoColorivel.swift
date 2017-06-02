//
//  TextoColorivel.swift
//  Swift200_Day2_2_UISlider
//
//  Created by Swift on 24/09/16.
//  Copyright © 2016 Quaddro. All rights reserved.
//

import UIKit

class TextoColorivel: UILabel, AquelesQueMudamDeCor {
    
    @IBOutlet weak var meuViewController:UIViewController!
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        let contaGotas = ContaGotasViewController(nibName: "ContaGotasViewController", bundle: nil)
        
        // Isso diz ao iOS que a tela de atrás é importante
        // e deve continuar sendo exibida
        contaGotas.modalPresentationStyle = .OverCurrentContext
        
        // Vamos trocar a animação para fadeIn
        contaGotas.modalTransitionStyle = .CrossDissolve
        
        meuViewController.presentViewController(contaGotas, animated: true, completion: nil)
        
        contaGotas.quemMeChamou = self
        
        
        if let corDeFundo = textColor {
            contaGotas.definirCorInicial(corDeFundo)
        }
    }
    
    
    func recebeNovaCor(cor: UIColor) {
        self.textColor = cor
    }
    
    
    
    
}
