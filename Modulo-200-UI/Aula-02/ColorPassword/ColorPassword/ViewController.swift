//
//  ViewController.swift
//  ColorPassword
//
//  Created by Swift on 17/09/16.
//  Copyright © 2016 Quaddro. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let cores = [
        UIColor.redColor(),
        UIColor.blueColor(),
        UIColor.cyanColor(),
        UIColor.magentaColor(),
        UIColor.orangeColor(),
        UIColor.greenColor(),
        UIColor.blackColor()
    ]
    
    let senha = [
        UIColor.blueColor(),
        UIColor.redColor(),
        UIColor.blueColor()
    ]
    


    override func viewDidLoad() {
        super.viewDidLoad()
        
        // pegamos a largura da tela
        let largura = self.view.frame.size.width / 3
        
        
        for i in 0..<3 {
            let posicao = CGRectMake(largura * CGFloat(i),0,largura,400)
            let umaDasViews = UIView(frame: posicao)
            umaDasViews.backgroundColor = cores.first
            umaDasViews.tag = i+1
            self.view.addSubview(umaDasViews)
        }
    
        // Criando Botão
        let botãoEntrar = UIButton(type: UIButtonType.System)
        botãoEntrar.frame = CGRectMake(0, 410, self.view.frame.width, self.view.frame.height - 410)
        botãoEntrar.setTitle("Entrar", forState: UIControlState.Normal)
        botãoEntrar.backgroundColor = UIColor(white: 0.9, alpha: 1.0)
        self.view.addSubview(botãoEntrar)
        
        
        botãoEntrar.addTarget(self, action: "entrar", forControlEvents: UIControlEvents.TouchUpInside)
        
    }
    
    func entrar() {
        
        guard let viewUm = self.view.viewWithTag(1),
              let viewDois = self.view.viewWithTag(2),
              let viewTres = self.view.viewWithTag(3) else {
                return
        }
        
        if senha[0] == viewUm.backgroundColor
            && senha[1] == viewDois.backgroundColor
            && senha [2] == viewTres.backgroundColor {
            print("Certo!")
            
            performSegueWithIdentifier("entrar", sender: self)
            
        } else {
            print("Errado!")
        }
     
    }
    
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        // Pego a view atual 
        // Acho a cor de fundo dela
        // Procuro o índice dessa cor no vetor
        guard let viewAlvo = touches.first?.view,
              let corAtual = viewAlvo.backgroundColor,
              let indiceAtual = cores.indexOf(corAtual) else {
            return
        }
        
        // Acho a próxima cor
        // e troco o fundo para essa nova cor
        let proximaCor = cores[(indiceAtual + 1)%cores.count]
        viewAlvo.backgroundColor = proximaCor
        
    }
    
    
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

