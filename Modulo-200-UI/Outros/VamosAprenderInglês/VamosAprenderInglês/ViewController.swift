//
//  ViewController.swift
//  VamosAprenderInglês
//
//  Created by Luiz Gustavo Lino on 9/16/16.
//  Copyright © 2016 Luiz Gustavo Lino. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let desafios = [
        "Estou com muita fome": ["i", "am", "very", "hungry"],
        "Tenho novos sapatos": ["i", "have", "new", "shoes"],
        "O café da manhã está incluso?": ["is","breakfast","included"],
        "Quanto custa?": ["how","much","is","it"],
        "Não, obrigado": ["no","thank","you"],
        "Caro demais!": ["too","expensive"],
        "Claro que não!": ["of","course","not"],
        "Por que você está aqui?": ["why","are","you","here"]
    ].shuffle()
    
    @IBOutlet weak var uiFraseEn: UILabel!
    @IBOutlet weak var uiFrasePt: UILabel!
    
    var faltam      = 0
    var fraseAtual  = 0
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        fazerNovosBotões()
    }
    
    func fazerNovosBotões() {
        
        let frase = desafios[fraseAtual%desafios.count]
        let (pt, en) = frase
        let tamanhoDeCada = self.view.frame.width/CGFloat(en.count)
        let tamanhoTela   = self.view.frame
        
        uiFrasePt.text = pt
        uiFraseEn.text = ""
        faltam = en.count
        
        for (indice, pedaçoEn) in en.shuffle().enumerate() {
            
            let umBotão = UIButton(type: .Custom)
            umBotão.backgroundColor = UIColor.whiteColor()
            umBotão.setTitle( pedaçoEn, forState: .Normal)
            umBotão.layer.cornerRadius = 10
            
            umBotão.setTitleColor(UIColor(red: 0.9, green: 0.2, blue: 0.2, alpha: 1.0),
                                        forState: UIControlState.Normal)
            
            umBotão.setTitleColor(UIColor(red: 1.0, green: 0.4, blue: 0.4, alpha: 1.0),
                                   forState: UIControlState.Highlighted)
            
            umBotão.frame = CGRectMake( CGFloat(indice)*tamanhoDeCada + 5,
                                         tamanhoTela.height, tamanhoDeCada - 10, 60)
            
            UIView.animateWithDuration(0.2, delay: Double(indice)/10,
                options: UIViewAnimationOptions.CurveEaseOut, animations: {
                
                umBotão.frame = CGRectMake( CGFloat(indice)*tamanhoDeCada + 5,
                        tamanhoTela.height - 80,
                        tamanhoDeCada - 10, 60)
                    
            }, completion: nil )
            
            self.view.addSubview(umBotão)
            
            umBotão.addTarget(self, action: #selector(botãoSelecionado),
                               forControlEvents: .TouchUpInside)
            
        }
        
    }
    
    func botãoSelecionado(sender:UIButton) {
        
        let tituloBotão = sender.titleLabel?.text ?? ""
        let fraseAtual  = self.uiFraseEn.text ?? ""
        self.uiFraseEn.text = "\(fraseAtual) \(tituloBotão)"
        
        UIView.animateWithDuration(0.4, animations: {
            
            sender.transform = CGAffineTransformTranslate(sender.transform, 0, -150)
            sender.alpha = 0.0
            
        }) { _ in
            
            self.faltam -= 1
            if self.faltam == 0 {
                self.valida()
            }
        }
    }
    
    func valida(){
        let (_,frase) = desafios[fraseAtual%desafios.count]
        let fraseCertaEn = frase.reduce("") { "\($0) \($1)" }
        if uiFraseEn.text == fraseCertaEn {
            fraseAtual += 1
        }
        self.fazerNovosBotões()
    }

}

