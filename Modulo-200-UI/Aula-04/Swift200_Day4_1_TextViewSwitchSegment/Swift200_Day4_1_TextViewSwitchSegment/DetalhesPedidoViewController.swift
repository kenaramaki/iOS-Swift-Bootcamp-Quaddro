//
//  DetalhesPedidoViewController.swift
//  Swift200_Day4_1_TextViewSwitchSegment
//
//  Created by Swift on 01/10/16.
//  Copyright © 2016 Quaddro. All rights reserved.
//

import UIKit

class DetalhesPedidoViewController: UIViewController, UITextViewDelegate {

    @IBOutlet weak var pedidoEspecial: UITextView!
    @IBOutlet weak var numTalheres: UITextField!
    @IBOutlet weak var contador: UILabel!
    
    // Recebemos o evento do stepper avisando que o usuário apertou ou '+' ou '-'
    // Repassamos esse valor como Int para o campo de texto
    @IBAction func talheresMudou(sender: UIStepper) {
        numTalheres.text = "\(Int(sender.value))"
    }
    
    // Vamos continuar repassando os valores para um objeto Pizza,
    // que veio da tela anterior e agora vai para a próxima
    var pizzaPedida:Pizza?
    
    
    // Quando tocar em prosseguir, preenchemos o objeto pizza com os dados desta tela
    // e repassamos para o próximo view controller
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        guard let destino = segue.destinationViewController as? PagamentoViewController else {
            return
        }
        
        pizzaPedida?.detalhesDoPedido = pedidoEspecial.text
        pizzaPedida?.talheres = Int(numTalheres.text ?? "0")
        
        destino.pizzaPedida = pizzaPedida
        
    }
    

    // Como textView não tem placeholder, vamos implementar essa funcionalidade
    // utilizando o delegate de começo e fim da edição
    func textViewDidEndEditing(textView: UITextView) {
        if textView.text == "" {
            textView.text = "Algum pedido especial?"
        }
    }
    
    func textViewDidBeginEditing(textView: UITextView) {
        if textView.text == "Algum pedido especial?" {
            textView.text = ""
        }
    }
    
    // Vamos escutar o evento de edição de texto para:
    // 1) Esconder o teclado quando tocar em 'done'
    // 2) Contar a quantidade de texto que ainda pode se digitar
    // 3) Limitar o texto em 60 chars
    func textView(textView: UITextView, shouldChangeTextInRange range: NSRange, replacementText text: String) -> Bool {
        
        print("text = " + text)
        print("range = ", range)
        print("textView.text = " + textView.text)
        
        // 1)
        if text == "\n" {
            textView.resignFirstResponder()
            return false
        }

     
        var texto = textView.text as NSString
        texto = texto.stringByReplacingCharactersInRange(range, withString: text)
        
       // print("Vai ficar assim: ", texto)
        
        let tamanho = texto.length
        //print("Tamanho do texto: ", tamanho)
        
        
        // 3)
        if tamanho > 60 {
            return false
        }
        
        // 2)
        contador.text = "\(60 - tamanho)"
        
        return true
    }
    
}
