//
//  ViewController.swift
//  NSUserDefaults
//
//  Created by Árthur Ken Aramaki Mota on 22/04/17.
//  Copyright © 2017 Árthur Ken Aramaki Mota. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Propriedades
    let userDefaults = UserDefaults.standard

    // MARK: - Outlets
    @IBOutlet weak var textFieldNome: UITextField!
    
    @IBOutlet weak var textFieldSobrenome: UITextField!
    
    @IBOutlet weak var textFieldIdade: UITextField!
    
    @IBOutlet weak var textFieldEmail: UITextField!
    
    @IBOutlet weak var textFieldTelefone: UITextField!
    
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    // MARK: - Métodos
    
    func verificaTextFieldsDigitadas (_ textFields : UITextField...) -> Bool {
        
        var tudoDigitado = true
        
        for textField in textFields {
            
            if textField.text!.isEmpty {
                
                tudoDigitado = false
                
            }
            
        }
        
        return tudoDigitado
        
    }
    
    
    // MARK: - Actions
    @IBAction func salvar(_ sender: UIButton) {
        
        if verificaTextFieldsDigitadas(self.textFieldNome, self.textFieldSobrenome, self.textFieldEmail, self.textFieldIdade, self.textFieldTelefone){
            
            let nome = self.textFieldNome.text!
            let sobrenome = self.textFieldSobrenome.text!
            let idade = self.textFieldIdade.text!
            let email = self.textFieldEmail.text!
            let telefone = self.textFieldTelefone.text!
            
            self.userDefaults.set(nome, forKey: "nome")
            self.userDefaults.set(sobrenome, forKey: "sobrenome")
            self.userDefaults.set(idade, forKey: "idade")
            self.userDefaults.set(email, forKey: "email")
            self.userDefaults.set(telefone, forKey: "telefone")
            
            self.userDefaults.synchronize()
            
            self.textFieldNome.text = nil
            self.textFieldSobrenome.text = nil
            self.textFieldIdade.text = nil
            self.textFieldEmail.text = nil
            self.textFieldTelefone.text = nil
            
            
        } else {
            
            
        }
    
    }
    
    @IBAction func resgatar(_ sender: UIButton) {
   
        let nome = self.userDefaults.object(forKey: "nome")
        let sobrenome = self.userDefaults.object(forKey: "sobrenome")
        let idade = self.userDefaults.object(forKey: "idade")
        let email = self.userDefaults.object(forKey: "email")
        let telefone = self.userDefaults.object(forKey: "telefone")
        
        self.textFieldNome.text = nome as? String
        self.textFieldSobrenome.text = sobrenome as? String
        self.textFieldIdade.text = idade as? String
        self.textFieldEmail.text = email as? String
        self.textFieldTelefone.text = telefone as? String
    
    }
 
    
    
    
}

