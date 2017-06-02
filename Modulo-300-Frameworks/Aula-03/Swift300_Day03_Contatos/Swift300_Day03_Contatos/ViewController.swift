//
//  ViewController.swift
//  Swift300_Day03_Contatos
//
//  Created by Swift on 28/01/17.
//  Copyright © 2017 Ken Aramaki. All rights reserved.
//

import UIKit
// Importando os frameworks
import Contacts
import ContactsUI

class ViewController: UIViewController, CNContactPickerDelegate {
    
    // MARK: - Outlets
    @IBOutlet weak var labelNome: UILabel!
    @IBOutlet weak var labelSobrenome: UILabel!
    @IBOutlet weak var labelTelefone: UILabel!
    
    
    // MARK: - Propriedades
    var contactStore = CNContactStore()
    var isSelecting = true
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Solicitando autorização para acessar os #contatinhosdopai
        if CNContactStore.authorizationStatus(for: CNEntityType.contacts) != CNAuthorizationStatus.authorized {
            self.contactStore.requestAccess(for: CNEntityType.contacts, completionHandler: { (autorizacao, erro) in
                
                print("Solicitação")
                
            })
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    // MARK: - Métodos
    
    // MARK: - Actions
    @IBAction func selecionar(_ sender: UIButton) {
    
        // Tratando a variável de controle
        self.isSelecting = true
        
        let contactPicker = CNContactPickerViewController()
        
        contactPicker.delegate = self
        
        self.present(contactPicker, animated: true, completion: nil)
    
    }
    
    @IBAction func apagar(_ sender: UIButton) {
    
        // Tratando a variável de controle
        self.isSelecting = false
        
        let contactPicker = CNContactPickerViewController()
        
        contactPicker.delegate = self
        
        self.present(contactPicker, animated: true, completion: nil)
        
    
    }

    @IBAction func criarNovoContato(_ sender: UIButton) {
        
    
        let alerta = UIAlertController(title: "Criar Contato", message: "Insira os dados para criar um novo contato", preferredStyle: .alert)
        let acaoOk = UIAlertAction(title: "Ok", style: .default) { (acao) in
            
            let nome = alerta.textFields![0].text
            let sobrenome = alerta.textFields![1].text
            let telefone = alerta.textFields![2].text
            
            if !(nome!.isEmpty || sobrenome!.isEmpty || telefone!.isEmpty) {
               
                // Criando um novo contato
                let novoContato = CNMutableContact()
                
                novoContato.givenName = nome!
                novoContato.familyName = sobrenome!
                
                novoContato.phoneNumbers = [CNLabeledValue(label: "home", value: CNPhoneNumber(stringValue: telefone!))]
                
                let saveRequest = CNSaveRequest()
                saveRequest.add(novoContato, toContainerWithIdentifier: nil)
                
                let contactStore = CNContactStore()
                
                do {
                    
                    try contactStore.execute(saveRequest)
                    
                }catch{}
                
                
            }else{
                
                // Caso esteja vazio
                
                let alerta = UIAlertController(title: "Alerta", message: "Preencha corretamente os campos", preferredStyle: .alert)
                
                let acaoOkzinha = UIAlertAction(title: "OK", style: .default, handler: nil)
                
                alerta.addAction(acaoOkzinha)
                
                self.present(alerta, animated: true, completion: nil)
                
            }
            
            
            
            
        }
    
        let acaoCancelar = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
        
        alerta.addAction(acaoOk)
        alerta.addAction(acaoCancelar)
        
        alerta.addTextField { (textField) in
            
            textField.placeholder = "Nome"
            
        }
        
        alerta.addTextField { (textField) in
            
            textField.placeholder = "Sobrenome"
            
        }
        
        alerta.addTextField { (textField) in
            
            textField.placeholder = "Telefone"
            
        }
        
        // Apresentando o alerta
        self.present(alerta, animated: true, completion: nil)
    }
    
    
    // MARK: - Métodos de CNContactPickerDelegate
    func contactPicker(_ picker: CNContactPickerViewController, didSelect contact: CNContact) {
        
        
        // Verificando se o usuário quer apagar ou selecionar um contato
        if self.isSelecting {
            
            // Caso ele queira selecionar
            let nome = contact.givenName
            let sobrenome = contact.familyName
            
            var telefone = ""
            
            let telefones = contact.phoneNumbers
            
            if telefones.count > 0 {
                
                telefone = (telefones[0].value).stringValue
                
            }
            
            // Exibindo os dados na label
            self.labelNome.text = nome
            self.labelSobrenome.text = sobrenome
            self.labelTelefone.text = telefone
        
            
        }else{
            
            // Caso ele queira apagar
            let saveRequest = CNSaveRequest()
            let contatoParaDeletar = contact.mutableCopy() as! CNMutableContact
            saveRequest.delete(contatoParaDeletar)
            
            do {
                
                try contactStore.execute(saveRequest)

            }catch{}
            
            
            
        }
        
        picker.dismiss(animated: true, completion: nil)
        
        
    }
    
    
}

