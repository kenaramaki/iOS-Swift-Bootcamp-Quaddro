//
//  AlertaView.swift
//  Swift200_Day2_1_TextField
//
//  Created by Swift on 17/09/16.
//  Copyright © 2016 Quaddro. All rights reserved.
//

import Foundation
import UIKit

class AlertaView : UIView {
    
    init(frame: CGRect, texto:String) {
        super.init(frame: frame)
        
        // Nosso layout
        // Fundo escuro
        backgroundColor = UIColor.blackColor().colorWithAlphaComponent(0.8)
        autoresizingMask = [.FlexibleWidth, .FlexibleHeight]
        
        let fundo = UIView(frame: CGRectMake(0,0,200,120))
        fundo.backgroundColor = UIColor.whiteColor()
        fundo.center = self.center
        fundo.autoresizingMask = [.FlexibleTopMargin, .FlexibleLeftMargin, .FlexibleRightMargin, .FlexibleBottomMargin]
        addSubview(fundo)
        
        let margem:CGFloat = 10
        let aviso = UILabel(frame: CGRectMake(margem,margem,fundo.frame.size.width - (margem*2), (fundo.frame.size.height/2) - margem))
        aviso.text = texto
        aviso.numberOfLines = 0
        aviso.font = UIFont.systemFontOfSize(12)
        fundo.addSubview(aviso)
        
        let botão = UIButton(type: .System)
        let altura = fundo.frame.size.height
        let largura = fundo.frame.size.width
        botão.frame = CGRectMake(margem, altura/2 + margem, largura - margem * 2, altura/2 - 2 * margem)
        botão.setTitle("Entendi", forState: UIControlState.Normal)
        botão.backgroundColor = UIColor(white: 0.92, alpha: 1.0)
        botão.addTarget(self, action: "fechar"/*#selector(fechar)*/, forControlEvents: .TouchUpInside)
        fundo.addSubview(botão)
        
        //arredondar corners
        fundo.layer.cornerRadius = 10
        botão.layer.cornerRadius = 10
        
        
        // animação da entrada
        alpha = 0.0 // <- valor inicial é transparente
        
        let destinoDoFundo = fundo.frame
        var inicioDoFundo = destinoDoFundo
        inicioDoFundo.origin.y -= 90 // A partir da inicial, sobe 90
        
        fundo.frame = inicioDoFundo
        
        UIView.animateWithDuration(0.2) {
            self.alpha = 1.0 // <- valor final é visível
            fundo.frame = destinoDoFundo
        }
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if touches.first?.view == self {
            fechar()
        }
    }
    
    func fechar() {
        
        UIView.animateWithDuration(0.2, animations: {
                self.alpha = 0.0 // anima por 0.2 segundos e depois
            }, completion: { _ in
                self.removeFromSuperview() // tira a view
        })
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}