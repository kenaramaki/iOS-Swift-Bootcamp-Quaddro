//
//  ViewController.swift
//  DesafioJSONCEP
//
//  Created by Árthur Ken Aramaki Mota on 01/04/17.
//  Copyright © 2017 Árthur Ken Aramaki Mota. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    // MARK: - Outlets
    @IBOutlet weak var cepTextField: UITextField!
    @IBOutlet weak var numeroTextField: UITextField!
    @IBOutlet weak var enderecoTextField: UITextField!
    @IBOutlet weak var bairroTextField: UITextField!
    @IBOutlet weak var localidadeTextField: UITextField!
    @IBOutlet weak var ufTextField: UITextField!
    
    // MARK: - Propriedades
    var dicionarioDados = [String : String]()
    

    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // https://viacep.com.br/ws/06033190/json/
        
        self.cepTextField.delegate = self
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Métodos
    
    // MARK: - Actions
    
    // MARK: - Métodos de UITextFieldDelegate
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        if textField == cepTextField {
            
            let url = URL(string: "https://viacep.com.br/ws/\(textField.text!)/json/")!
            
            let sessao = URLSession(configuration: URLSessionConfiguration.default)
            
            let tarefa : URLSessionDataTask  = sessao.dataTask(with: url, completionHandler: { (data, response, error) in
                
                if error == nil {
                    
                    if let dataTemp = data {
                        
                        var dicionario : [String : String] = [:]
                        
                        do {
                            
                            dicionario = try JSONSerialization.jsonObject(with: dataTemp, options: JSONSerialization.ReadingOptions.allowFragments) as! [String : String]
                            
                            self.dicionarioDados = dicionario
                            
                            print(dicionario)
                            let cep = self.dicionarioDados["cep"] ?? ""
                            let unidade = self.dicionarioDados["unidade"] ?? ""
                            let uf = self.dicionarioDados["uf"] ?? ""
                            let bairro = self.dicionarioDados["bairro"] ?? ""
                            let localidade = self.dicionarioDados["localidade"] ?? ""
                            let gia = self.dicionarioDados["gia"] ?? ""
                            let logradouro = self.dicionarioDados["logradouro"] ?? ""
                            let complemento = self.dicionarioDados["complemento"] ?? ""
                            let ibge = self.dicionarioDados["ibge"] ?? ""
                           
                            DispatchQueue.main.async {
                                
                                self.cepTextField.text = cep
                                self.enderecoTextField.text = logradouro
                                self.bairroTextField.text = bairro
                                self.localidadeTextField.text = localidade
                                self.ufTextField.text = uf
                            
                            }
                        }catch{}
                        
                        
                    }
                    
                    
                } else {
                    
                    print("Data Nula")
                    
                }
                
            })
           
            tarefa.resume()
        
        }
        
        /*
        print(dicionarioDados["logradouro"])
        
        let cep = dicionarioDados["cep"] ?? ""
        let unidade = dicionarioDados["unidade"] ?? ""
        let uf = dicionarioDados["uf"] ?? ""
        let bairro = dicionarioDados["bairro"] ?? ""
        let localidade = dicionarioDados["localidade"] ?? ""
        let gia = dicionarioDados["gia"] ?? ""
        let logradouro = dicionarioDados["logradouro"] ?? ""
        let complemento = dicionarioDados["complemento"] ?? ""
        let ibge = dicionarioDados["ibge"] ?? ""
        
        cepTextField.text = cep
        enderecoTextField.text = logradouro
        bairroTextField.text = bairro
        localidadeTextField.text = localidade
        ufTextField.text = uf
        */
        

    }


}

