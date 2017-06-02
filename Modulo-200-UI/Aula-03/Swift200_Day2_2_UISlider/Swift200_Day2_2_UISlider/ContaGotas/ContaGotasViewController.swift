//
//  ContaGotasViewController.swift
//  Swift200_Day2_2_UISlider
//
//  Created by Swift on 24/09/16.
//  Copyright © 2016 Quaddro. All rights reserved.
//

import UIKit

protocol AquelesQueMudamDeCor {
    func recebeNovaCor(cor:UIColor)
}

class ContaGotasViewController: UIViewController {
    
    
    @IBOutlet weak var amostra: UIView!
    
    @IBOutlet weak var sliderVermelho: UISlider!
    @IBOutlet weak var sliderVerde: UISlider!
    @IBOutlet weak var sliderAzul: UISlider!
    
    @IBOutlet weak var valorVermelho: UILabel!
    @IBOutlet weak var valorVerde: UILabel!
    @IBOutlet weak var valorAzul: UILabel!
    
    var quemMeChamou:AquelesQueMudamDeCor?
    
    @IBAction func valorMudou(alvo:UISlider) {
        
        let valorAtual = Int(alvo.value * 255)
        
        switch alvo {
        case sliderVermelho:
            valorVermelho.text = "\(valorAtual)"
        case sliderAzul:
            valorAzul.text = "\(valorAtual)"
        case sliderVerde:
            valorVerde.text = "\(valorAtual)"
        default:
            break
        }
        
        let novaCorDeFundo = UIColor(colorLiteralRed: sliderVermelho.value, green: sliderVerde.value, blue: sliderAzul.value, alpha: 1.0)
        
        amostra.backgroundColor = novaCorDeFundo
        
    }
    
    @IBAction func aplicar(sender: AnyObject){
        quemMeChamou?.recebeNovaCor(amostra.backgroundColor!)
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    @IBAction func cancela(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }

    
    func definirCorInicial(cor:UIColor){
        
        amostra.backgroundColor = cor
        
        // Pegando o RGB da nova cor em formato numérico 0...1
        var vermelho:CGFloat    = 0.0
        var verde:CGFloat       = 0.0
        var azul:CGFloat        = 0.0
        var alpha:CGFloat       = 0.0
        cor.getRed(&vermelho, green: &verde, blue: &azul, alpha: &alpha)
        
        // Atualizando os sliders para a nova cor
        sliderAzul.value = Float(azul)
        sliderVermelho.value = Float(vermelho)
        sliderVerde.value = Float(verde)
        
        valorAzul.text = "\(Int(sliderAzul.value * 255))"
        valorVermelho.text = "\(Int(sliderVermelho.value * 255))"
        valorVerde.text = "\(Int(sliderVerde.value * 255))"
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
