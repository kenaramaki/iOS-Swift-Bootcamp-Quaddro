//
//  ViewController.swift
//  DesafioWebServiceXML
//
//  Created by Árthur Ken Aramaki Mota on 01/04/17.
//  Copyright © 2017 Árthur Ken Aramaki Mota. All rights reserved.
//

import UIKit

// Colocando os protocolos
class ViewController: UIViewController, UITextFieldDelegate, XMLParserDelegate {

    // MARK: - Outlets
    @IBOutlet weak var textFieldCep: UITextField!
    @IBOutlet weak var textFieldNumero: UITextField!
    @IBOutlet weak var textFieldEndereco: UITextField!
    @IBOutlet weak var textFieldBairro: UITextField!
    @IBOutlet weak var textFieldLocalidade: UITextField!
    @IBOutlet weak var textFieldUf: UITextField!
    
    // MARK: - Propriedades
    var dicionarioDados = [String : String]()
    var tagAtual = ""
    var conteudoTag = ""
    
    
    
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Ligando o delegate
        self.textFieldCep.delegate = self
    
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    // MARK: - Métodos
    
    // MARK: - Actions
    
    // MARK: - Métodos de XMLParserDelegate
    
    // Start Document
    func parserDidStartDocument(_ parser: XMLParser) {
        
        print("Iniciou")
        
    }
    
    // End Document
    func parserDidEndDocument(_ parser: XMLParser) {
        
        print("Finalizou")
        
        print(dicionarioDados)
        
        let cep = self.dicionarioDados["cep"] ?? ""
        let unidade = self.dicionarioDados["unidade"] ?? ""
        let uf = self.dicionarioDados["uf"] ?? ""
        let bairro = self.dicionarioDados["bairro"] ?? ""
        let localidade = self.dicionarioDados["localidade"] ?? ""
        let gia = self.dicionarioDados["gia"] ?? ""
        let logradouro = self.dicionarioDados["logradouro"] ?? ""
        let complemento = self.dicionarioDados["complemento"] ?? ""
        let ibge = self.dicionarioDados["ibge"] ?? ""
        
        self.textFieldCep.text = cep
        self.textFieldUf.text = uf
        self.textFieldBairro.text = bairro
        self.textFieldLocalidade.text = localidade
        self.textFieldEndereco.text = logradouro
        
    }
    
    // Start Element
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        
        self.tagAtual = elementName
        
        // Se a tag for uma tag de abertura
        if (elementName == "cep" || elementName == "unidade" || elementName == "uf" || elementName == "bairro" || elementName == "localidade" || elementName == "gia" || elementName == "complemento" || elementName == "logradouro" || elementName == "ibge") {
            
            self.conteudoTag = ""
            
        }
        
    }
    
    // End Element
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        
        if elementName == "cep" {
            
            self.dicionarioDados["cep"] = self.conteudoTag
            
            self.conteudoTag = ""
            self.tagAtual = ""
            
        }
        
        if elementName == "unidade" {
            
            self.dicionarioDados["unidade"] = self.conteudoTag
            
            self.conteudoTag = ""
            self.tagAtual = ""
            
        }
        
        if elementName == "uf" {
            
            self.dicionarioDados["uf"] = self.conteudoTag
            
            self.conteudoTag = ""
            self.tagAtual = ""
            
        }
        
        if elementName == "bairro" {
            
            self.dicionarioDados["bairro"] = self.conteudoTag
            
            self.conteudoTag = ""
            self.tagAtual = ""
            
        }
        
        if elementName == "localidade" {
            
            self.dicionarioDados["localidade"] = self.conteudoTag
            
            self.conteudoTag = ""
            self.tagAtual = ""
            
        }
        
        if elementName == "gia" {
            
            self.dicionarioDados["gia"] = self.conteudoTag
            
            self.conteudoTag = ""
            self.tagAtual = ""
            
        }
        
        if elementName == "complemento" {
            
            self.dicionarioDados["complemento"] = self.conteudoTag
            
            self.conteudoTag = ""
            self.tagAtual = ""
            
        }
        
        if elementName == "logradouro" {
            
            self.dicionarioDados["logradouro"] = self.conteudoTag
            
            self.conteudoTag = ""
            self.tagAtual = ""
            
        }
        
        if elementName == "ibge" {
            
            self.dicionarioDados["ibge"] = self.conteudoTag
            
            self.conteudoTag = ""
            self.tagAtual = ""
            
        }
        
        
    }
    
    // Found Character
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        
        if (self.tagAtual == "cep" || self.tagAtual == "unidade" || self.tagAtual == "uf" || self.tagAtual == "bairro" || self.tagAtual == "localidade" || self.tagAtual == "gia" || self.tagAtual == "complemento" || self.tagAtual == "logradouro" || self.tagAtual == "ibge"){
            
            self.conteudoTag += string
            
        }
        
        
    }
    
    
    
    // MARK: - Métodos de UITextFieldDelegate
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        if (textField == self.textFieldCep) {
            
            if !(self.textFieldCep.text!.isEmpty) {
                
                // Criando a url a partir da url padrão mais o text digitado
                let urlArquivo = URL(string: "https://viacep.com.br/ws/\(self.textFieldCep.text!)/xml/")!
                
                // Criando o parser que irá interpretar o conteúdo do nosso XML
                let xmlParser = XMLParser(contentsOf: urlArquivo)
                
                // Ligando o delegate
                xmlParser?.delegate = self
                
                // Iniciando o parse
                xmlParser?.parse()
                
                
            }
            
            
        }
        
    }
    

}

