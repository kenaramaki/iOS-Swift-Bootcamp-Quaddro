//
//  EscolhaSaborViewController.swift
//  Swift200_Day4_1_TextViewSwitchSegment
//
//  Created by Swift on 01/10/16.
//  Copyright © 2016 Quaddro. All rights reserved.
//

import UIKit

class EscolhaSaborViewController: UIViewController {

    var pizzaPedida:Pizza = Pizza()
    
    @IBOutlet weak var seletorSabor: UISegmentedControl!
    @IBOutlet weak var indicadorRecheioExtra: UISwitch!
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        // Precisamos garantir que essa segue está indo para a tela esperada
        // Se não for o caso, não temos o que fazer
        guard let destino = segue.destinationViewController as? DetalhesPedidoViewController else {
            return
        }
        
        // Pedimos pro segment o texto do segmento atualmente selecionado
        pizzaPedida.sabor = seletorSabor.titleForSegmentAtIndex(seletorSabor.selectedSegmentIndex)
        
        // Tem recheio extra se meu switch estiver 'on'
        pizzaPedida.recheioExtra = indicadorRecheioExtra.on
        
        destino.pizzaPedida = pizzaPedida
        
    }
    
}