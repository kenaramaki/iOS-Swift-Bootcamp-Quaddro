//
//  ViewController.swift
//  Desafio XML CEP
//
//  Created by Árthur Ken Aramaki Mota on 01/04/17.
//  Copyright © 2017 Árthur Ken Aramaki Mota. All rights reserved.
//

import UIKit

class ViewController: UIViewController, XMLParserDelegate, UITextFieldDelegate {

    // MARK: - Outlets
    @IBOutlet weak var cepTextField: UITextField!
    
    @IBOutlet weak var numeroTextField: UITextField!
    
    @IBOutlet weak var enderecoTextField: UITextField!
    
    @IBOutlet weak var bairroTextField: UITextField!
    
    @IBOutlet weak var localidadeTextField: UITextField!
    
    @IBOutlet weak var ufTextField: UITextField!
    
    // MARK: - Propriedades
    var dicionarioDados = [String : String]()
    var tagAtual = ""
    var conteudoTag = ""
    var cepDaURL = "06033190"
    
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Path: https://viacep.com.br/ws/06033190/xml/

        
        
        self.cepTextField.delegate = self
        
        
       
    
    }

    
    

    // MARK: - Métodos
    
    // MARK: - Actions
    
    // MARK: - Métodos XMLParserDelegate
    
    // Start Document
    func parserDidStartDocument(_ parser: XMLParser) {
        
        print("iniciada a interpretação do arquivo")
        
    }
    
    
    // End Document
    func parserDidEndDocument(_ parser: XMLParser) {
        
        // Exibindo o dicionário de saída
        print(self.dicionarioDados)
        
        let cep =           self.dicionarioDados["cep"]
        let unidade =       self.dicionarioDados["unidade"]
        let uf =            self.dicionarioDados["uf"]
        let bairro =        self.dicionarioDados["bairro"]
        let localidade =    self.dicionarioDados["localidade"]
        let gia =           self.dicionarioDados["gia"]
        let complemento =   self.dicionarioDados["complemento"]
        let logradouro =    self.dicionarioDados["logradouro"]
        let ibge =          self.dicionarioDados["ibge"]
        
        numeroTextField.text = unidade
        enderecoTextField.text = logradouro
        bairroTextField.text = bairro
        localidadeTextField.text = localidade
        ufTextField.text = uf
        
        
    }
    
    
    // Start Element
    
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        
        self.tagAtual = elementName
        
        // Verificando se a tag é uma tag de um elemento relevante
        if (elementName == "cep" || elementName == "unidade" || elementName == "uf" || elementName == "bairro" || elementName == "localidade" || elementName == "gia" || elementName == "complemento" || elementName == "logradouro" || elementName == "ibge") {
            
            self.conteudoTag = ""
            
        }
        
        
    }
    
    
    // End Element
    
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        
        if elementName == "cep" {
            
            // Criando uma chave em nosso dicionário e armazenando o conteúdo
            self.dicionarioDados["cep"] = self.conteudoTag
            
            // Limpando as variáveis de controle
            self.tagAtual = ""
            self.conteudoTag = ""
            
        }
        
        if elementName == "unidade" {
            
            self.dicionarioDados["unidade"] = self.conteudoTag
            
            self.tagAtual = ""
            self.conteudoTag = ""
        }
     
        
        if elementName == "uf" {
            
            self.dicionarioDados["uf"] = self.conteudoTag
            
            self.tagAtual = ""
            self.conteudoTag = ""
        }
        
        
        if elementName == "bairro" {
            
            self.dicionarioDados["bairro"] = self.conteudoTag
            
            self.tagAtual = ""
            self.conteudoTag = ""
        }
        
        
        if elementName == "localidade" {
            
            self.dicionarioDados["localidade"] = self.conteudoTag
            
            self.tagAtual = ""
            self.conteudoTag = ""
        }
        
        
        if elementName == "gia" {
            
            self.dicionarioDados["gia"] = self.conteudoTag
            
            self.tagAtual = ""
            self.conteudoTag = ""
        }
        
        
        if elementName == "complemento" {
            
            self.dicionarioDados["complemento"] = self.conteudoTag
            
            self.tagAtual = ""
            self.conteudoTag = ""
        }
        
        
        if elementName == "logradouro" {
            
            self.dicionarioDados["logradouro"] = self.conteudoTag
            
            self.tagAtual = ""
            self.conteudoTag = ""
        }
        
        
        if elementName == "ibge" {
            
            self.dicionarioDados["ibge"] = self.conteudoTag
            
            self.tagAtual = ""
            self.conteudoTag = ""
        }
        
    }
    
    
    // Found Characters
    
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        
        
        if (self.tagAtual == "cep" || self.tagAtual == "unidade" || self.tagAtual == "uf" || self.tagAtual == "bairro" || self.tagAtual == "localidade" || self.tagAtual == "gia" || self.tagAtual == "complemento" || self.tagAtual == "logradouro" || self.tagAtual == "ibge"){
            
            self.conteudoTag += string
            
        }
        
    }
    

    // MARK: - Métodos TextFieldDelegate
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        // TODO: - E se o usuário colocar letras em vez de números?
        
        print("PASSOU")
        
        if  !(cepTextField.text!.isEmpty) {
            
            let cepDigitado = cepTextField.text!
            
            // Criando o caminho até o documento XML
            let urlArquivo = URL(string: "https://viacep.com.br/ws/" + cepDigitado + "/xml/")
            
            //print(urlArquivo)
            
            // Criando um objeto que fará o parse (interpretação) do nosso XML. A classe responsável por essa interpretação é a XMLParser
            if let url = urlArquivo {
            
                let xmlParser = XMLParser(contentsOf: url)
                
                // Atribuindo o delegate
                xmlParser?.delegate = self
                
                // Acionando o método que inicia o processo de interpretação do CML
                xmlParser?.parse()
            
            } else {
                
                numeroTextField.text = ""
                enderecoTextField.text = ""
                bairroTextField.text = ""
                localidadeTextField.text = ""
                ufTextField.text = ""
                
            }
            
        }
    
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        // Tirar o foco
        cepTextField.resignFirstResponder()
        return true
        
        
    }
    
}

