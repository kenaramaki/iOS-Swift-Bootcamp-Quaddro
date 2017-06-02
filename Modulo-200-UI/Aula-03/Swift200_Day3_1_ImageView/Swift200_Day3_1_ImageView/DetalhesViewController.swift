//
//  DetalhesViewController.swift
//  Swift200_Day3_1_ImageView
//
//  Created by Swift on 24/09/16.
//  Copyright © 2016 Quaddro. All rights reserved.
//

import UIKit

class DetalhesViewController: UIViewController {

    var item:String?
    
    @IBOutlet weak var fotinho: UIImageView!
    @IBOutlet weak var descrição: UILabel!
    
    
    // Dicionário
    var detalhes = [
        "ponte": "O Parque Ibirapuera é o mais importante parque urbano da cidade de São Paulo, no Brasil. Foi inaugurado em 21 de agosto de 1954 para a comemoração do quarto centenário da cidade. Em 2012 e 2013, foi apontado pela rede social Facebook como o local mais popular em todo o Brasil para se fazer check-in.",
        
        "teatro": "O Auditório Ibirapuera é um edifício concebido por Oscar Niemeyer para apresentações de espetáculos musicais. O prédio possui simplicidade volumétrica singular, sendo composto de um bloco único, que em planta tem a forma de um trapézio e, em corte, a forma de um triângulo.",
        
        "obelisco": "O Obelisco Mausoléu aos Heróis de 32, também conhecido como Obelisco do Ibirapuera ou Obelisco de São Paulo, é um monumento funerário brasileiro, símbolo da Revolução Constitucionalista de 1932. É um projeto do escultor ítalo-brasileiro Galileo Ugo Emendabili, que chegou ao Brasil em 1923, fugindo do regime fascista na Itália.",
        
        "cavalinho": "Monumento às Bandeiras é uma obra de arte executada pelo escultor ítalo-brasileiro Victor Brecheret. A obra representa os bandeirantes, expondo suas diversas etnias e o esforço para desbravar o país. Além de portugueses, vemos na obra negros, mamelucos e índios, puxando uma canoa de monções, utilizadas nas expedições fluviais."
    ]
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        print("Item atual: \(item)")
        
        guard let itemAtual = item else {
            return
        }
        
        descrição.text = detalhes[itemAtual]
        
        switch itemAtual {
        case "cavalinho":
            fotinho.image = UIImage(named:"ibira-2")
        case "obelisco":
            fotinho.image = UIImage(named:"ibira-1")
        case "ponte":
            fotinho.image = UIImage(named:"ibira-3")
        case "teatro":
            fotinho.image = UIImage(named:"ibira-4")
        default:
            break
        }
        
        // alinhamento da imagem
        fotinho.contentMode = .ScaleAspectFill
        fotinho.clipsToBounds = true
        
        // arredondando a fotinha
        fotinho.layer.cornerRadius = 60
        fotinho.layer.borderColor = UIColor.whiteColor().CGColor
        fotinho.layer.borderWidth = 10
    }
    
    @IBAction func fechar() {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    
}
