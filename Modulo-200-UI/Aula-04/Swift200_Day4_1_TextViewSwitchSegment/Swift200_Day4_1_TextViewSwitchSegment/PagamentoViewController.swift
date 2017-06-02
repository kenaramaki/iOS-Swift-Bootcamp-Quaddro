//
//  PagamentoViewController.swift
//  Swift200_Day4_1_TextViewSwitchSegment
//
//  Created by Swift on 01/10/16.
//  Copyright © 2016 Quaddro. All rights reserved.
//

import UIKit

class PagamentoViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var numeroCartao: UITextField!
    @IBOutlet weak var nomeCartao: UITextField!
    @IBOutlet weak var validade: UITextField!
    @IBOutlet weak var cvc: UITextField!
    @IBOutlet weak var bandeira: UISegmentedControl!
    @IBOutlet weak var botaoProsseguir: UIButton!
    @IBOutlet weak var campos: UIView!
    
    var pizzaPedida:Pizza?

    // Vamos escutar o evento de início e fim de edição para controlar a posição da view onde estão todos
    // os nossos campos de texto. Sobe mais quanto mais baixo é o campo, igual uma roldana
    //     o
    //    / \
    //   /   \
    // [🔝]   \ ⬇
    
    func textFieldDidBeginEditing(textField: UITextField) {
        UIView.animateWithDuration(0.4) {
            self.campos.center = CGPointMake(self.view!.frame.size.width / 2, 260 - textField.frame.origin.y)
        }
    }
    
    // Quando entramos na tela já rodada uma validação de campos preenchidos
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        validaTodosCamposPreenchidos()
    }
    
    
    // No fim da edição, voltamos os campos para o local correto
    func textFieldDidEndEditing(textField: UITextField) {
        
        validaTodosCamposPreenchidos()
        
        UIView.animateWithDuration(0.4){
            self.campos.center = CGPointMake(self.view!.frame.size.width / 2, 203 /* 108 + 190/2 */)
        }
    }
    
    // Quando tocar fora, tem que esconder o teclado!
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        // Eu toquei em uma view que não é alvo de edição atualmente?
        if touches.first?.view?.isFirstResponder() == false {
            // Se sim, cancela a edição que está sendo feita
            // Pegamos da aplicação a janela principal e pedimos o cancelamento de qualquer edição
            UIApplication.sharedApplication().keyWindow?.endEditing(true)
        }
        
    }
    
    // Corrigi bug do selecionar o Segmented por último
    @IBAction func mudouBandeira(sender: AnyObject) {
        validaTodosCamposPreenchidos()
    }
    
    
    // Quando não estão todos os campos preenchidos
    // vamos desabilitar o botão de continuar
    func validaTodosCamposPreenchidos() {
        
        guard numeroCartao.text != "" &&
              nomeCartao.text != "" &&
              validade.text != "" &&
              cvc.text != "" &&
              bandeira.selectedSegmentIndex != UISegmentedControlNoSegment else {
                botaoProsseguir.enabled = false
                botaoProsseguir.alpha = 0.5
                return
        }
        
        botaoProsseguir.enabled = true
        botaoProsseguir.alpha = 1.0
        
    }
    
    // Vamos escutar as alterações de texto para poder validar os campos
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        
        // Se o textfield tem texto, não precisa validar
        guard let text = textField.text else {
            return false
        }
        
        // primeiro vamos antecipar a edição para ver como  ficaria o texto
        var texto = text as NSString
        texto = texto.stringByReplacingCharactersInRange(range, withString: string)
        
        let tamanho = texto.length
        
        switch textField {
        case numeroCartao:
            
            // Número de cartão não pode ter mais de 19 dígitos
            // 1234.5678.1234.5678
            if tamanho > 19 {
                return false
            }
            
            // Filtramos tudo que não é número
            // Inclusive os antigos pontinhos
            let chars = texto.sóNumeros().characters
            
            // Depois, a cada 4, colocamos pontinho
            var novoTexto = ""
            for (i,v) in chars.enumerate(){
                if i % 4 == 0 && i != 0 {
                    novoTexto = "\(novoTexto)."
                }
                novoTexto.append(v)
            }
            
            // Depois de fazer todo o tratamento do texto
            // colocando pontinho nas casas, repassamos o valor
            // direto pro campo de texto e bloqueamos a edição proposta
            textField.text = novoTexto
            return false
            
        default: return true
        }
        
        
    }
    
    
}
