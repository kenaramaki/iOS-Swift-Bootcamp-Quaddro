//
//  ViewController.swift
//  UIActivityViewController
//
//  Created by Swift on 04/03/17.
//  Copyright © 2017 Ken Aramaki. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var textFieldURL: UITextField!
    @IBOutlet weak var textFieldTexto: UITextField!
    
    // MARK: - Propriedades
    var minhaActivity : UIActivityViewController!
    
    // MARK: - View Life Cycle
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Métodos
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        self.becomeFirstResponder()
        
    }
    
    override var canBecomeFirstResponder: Bool {
        
        return true
        
    }
    
    func exibeAlertaSimples(titulo : String, mensagem : String) {
        
        let alerta = UIAlertController(title: titulo, message: mensagem, preferredStyle: .alert)
        let acaoOK = UIAlertAction(title: "OK", style: .default, handler: nil)
        alerta.addAction(acaoOK)
        
        self.present(alerta, animated: true, completion: nil)
        
    }
    
    
    // MARK: - Actions
    @IBAction func enviarURL(_ sender: UIButton) {
        
        if !self.textFieldURL.text!.isEmpty {
            
            let url = URL(string: self.textFieldURL.text!)
            
            self.minhaActivity = UIActivityViewController(activityItems: [url!], applicationActivities: nil)
            
            self.present(self.minhaActivity, animated: true, completion: nil)
            
        } else {
            
            self.exibeAlertaSimples(titulo: "Alerta", mensagem: "Preencha corretamente o campo da URL para prosseguir.")
            
        }
        
        
    }
    
    @IBAction func enviarTexto(_ sender: UIButton) {
        
        // Verificando se o usuário digitou algo
        if !self.textFieldTexto.text!.isEmpty {
            // Caso ele tenha digitado
            
            self.minhaActivity = UIActivityViewController(activityItems: [self.textFieldTexto.text!], applicationActivities: nil)
            
            self.present(self.minhaActivity, animated: true, completion: nil)
            
            
            
        } else {
            // Caso ele não tenha digitado
            
            self.exibeAlertaSimples(titulo: "Alerta", mensagem: "Preencha corretamente o campo de texto para fazer o compartilhamento")
            
        }
        
    }
    
    @IBAction func enviarImagem(_ sender: UIButton) {
        
        let caminho = Bundle.main.path(forResource: "imagem", ofType: "png")
        let url = URL(fileURLWithPath: caminho!)
        
        self.minhaActivity = UIActivityViewController(activityItems: [url], applicationActivities: nil)
        
        self.present(minhaActivity, animated: true, completion: nil)
        
    }

}

