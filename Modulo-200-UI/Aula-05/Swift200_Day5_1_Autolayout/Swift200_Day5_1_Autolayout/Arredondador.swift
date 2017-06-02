//
//  Arredondador.swift
//  Swift200_Day4_1_TextViewSwitchSegment
//
//  Created by Swift on 01/10/16.
//  Copyright © 2016 Quaddro. All rights reserved.
//

import UIKit

class Arredondador: NSObject {
    
    // @IBInspectable avisa o interface builder que essa variável
    // pode ser alterada no storyboard
    // Não pode ser optional, precisa de um valor padrão
    @IBInspectable var raio:CGFloat = 10
    
    @IBOutlet var alvos:[UIView]? {
        didSet{
            
            // Garantimos que existe um vetor com minhas views conectadas,
            // senão não preciso fazer nada e retorno
            guard let alvosAtuais = alvos else {
                return
            }
            
            // Pegamos cada uma das views em um loop
            // e pedimos para arredondar
            for alvo in alvosAtuais {
                alvo.layer.cornerRadius = raio
            }
        }
    }
}
