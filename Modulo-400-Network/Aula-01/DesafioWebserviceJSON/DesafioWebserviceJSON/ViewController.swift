//
//  ViewController.swift
//  DesafioWebserviceJSON
//
//  Created by Árthur Ken Aramaki Mota on 01/04/17.
//  Copyright © 2017 Árthur Ken Aramaki Mota. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    // MARK: - Outlets
    @IBOutlet weak var textFieldCep: UITextField!
    @IBOutlet weak var textFieldNumero: UITextField!
    @IBOutlet weak var textFieldEndereco: UITextField!
    @IBOutlet weak var textFieldBairro: UITextField!
    @IBOutlet weak var textFieldLocalidade: UITextField!
    @IBOutlet weak var textFieldUF: UITextField!
    
    // MARK: - Propriedades
    
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.textFieldCep.delegate = self
        
        
    }

  
    
    
    
    
    // MARK: - Métodos
    
    // MARK: - Actions
    
    // MARK: - Métodos de UITextFieldDelegate
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        // Criando a URL
        // https://viacep.com.br/ws/06033190/json/
        
        if textField == self.textFieldCep {
        
            if !self.textFieldCep.text!.isEmpty {
                
                let url = URL(string: "https://viacep.com.br/ws/\(self.textFieldCep.text!)/json/")!
                
                let sessao = URLSession(configuration: URLSessionConfiguration.default)
                
                let tarefa : URLSessionDataTask = sessao.dataTask(with: url, completionHandler: { (data, response, erro) in
                
                    if erro == nil {
                        
                        if let dataTemp = data {
                            
                            do {
                                
                                let dicionario = try JSONSerialization.jsonObject(with: dataTemp, options: JSONSerialization.ReadingOptions.allowFragments) as! [String : String]
                                
                                print(dicionario)
                                
                                let cep = dicionario["cep"] ?? ""
                                let unidade = dicionario["unidade"] ?? ""
                                let uf = dicionario["uf"] ?? ""
                                let bairro = dicionario["bairro"] ?? ""
                                let localidade = dicionario["localidade"] ?? ""
                                let gia = dicionario["gia"] ?? ""
                                let complemento = dicionario["complemento"] ?? ""
                                let logradouro = dicionario["logradouro"] ?? ""
                                let ibge = dicionario["ibge"] ?? ""
                                
                                
                                // Colocando interface gráfica na main queue
                                
                                DispatchQueue.main.async {
                                
                                    self.textFieldCep.text = cep
                                    self.textFieldUF.text = uf
                                    self.textFieldBairro.text = bairro
                                    self.textFieldEndereco.text = logradouro
                                    self.textFieldLocalidade.text = localidade
                                    
                                }
                                
                                
                                

                                
                            }catch{}
                            
                            
                            
                        } else {
                            
                            print("data nula")
                            
                        }
                        
                        
                    } else {
                        
                        print("ERRO: \(erro)")
                        
                    }
                    
                    
                })
            
                tarefa.resume()
                
            }
            
         
            
        }
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textFieldCep.resignFirstResponder()
        return true
    }


}

