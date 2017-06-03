//
//  ViewController.swift
//  WebservicesXML
//
//  Created by Árthur Ken Aramaki Mota on 01/04/17.
//  Copyright © 2017 Árthur Ken Aramaki Mota. All rights reserved.
//

import UIKit

// Adotando o protoclo do XMLParserDelegate
class ViewController: UIViewController, XMLParserDelegate {

    // MARK: - Outlets

    // MARK: - Propriedades
    var dicionarioDados = [String : String]()
    var tagAtual = ""
    var conteudoTag = ""
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Path: https://viacep.com.br/ws/06033190/xml/
        
        // Criando o caminho até o documento XML
        let urlArquivo = URL(string: "https://viacep.com.br/ws/06033190/xml/")!
        
        // Criando um objeto que fará o parse (interpretação) do nosso XML. A classe responsável por essa interpretação é a XMLParser
        let xmlParser = XMLParser(contentsOf: urlArquivo)
        
        // Atribuindo o delegate como esta classe (!!!!)
        xmlParser?.delegate = self
        
        // Acionando o método que inicia o processo de interpretação do XML
        xmlParser?.parse()

        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    // MARK: - Métodos
    
    
    
    // MARK: - Actions
    
    // MARK: - Métodos XMLParserDelegate
    
    // 5 métodos importantes
    
    // Start Document
    func parserDidStartDocument(_ parser: XMLParser) {
        
        print("Iniciada a iterpretação do arquivo")
        
    }
    
    // End Document
    func parserDidEndDocument(_ parser: XMLParser) {
        
        // Exibindo o dicionário de saída
        print(self.dicionarioDados)
        
        let cep         = self.dicionarioDados["cep"]
        let unidade     = self.dicionarioDados["unidade"]
        let uf          = self.dicionarioDados["uf"]
        let bairro      = self.dicionarioDados["bairro"]
        let localidade  = self.dicionarioDados["localidade"]
        let gia         = self.dicionarioDados["gia"]
        let complemento = self.dicionarioDados["complemento"]
        let logradouro  = self.dicionarioDados["logradouro"]
        let ibge        = self.dicionarioDados["ibge"]
        
        print("CEP: \(cep)")
        print("UNIDADE: \(unidade)")
        print("UF: \(uf)")
        print("BAIRRO: \(bairro)")
        print("LOCALIDADE: \(localidade)")
        print("GIA: \(gia)")
        print("COMPLEMENTO: \(complemento)")
        print("LOGRADOURO: \(logradouro)")
        print("IBGE: \(ibge)")
        
    }
    
    // Start Element
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        
        self.tagAtual = elementName
        
        // Verificando se a tag é uma tag de conteúdo relevante
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
    
    // Found Characters
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        
        if (self.tagAtual == "cep" || self.tagAtual == "unidade" || self.tagAtual == "uf" || self.tagAtual == "bairro" || self.tagAtual == "localidade" || self.tagAtual == "gia" || self.tagAtual == "complemento" || self.tagAtual == "logradouro" || self.tagAtual == "ibge"){
            
            self.conteudoTag += string
            
        }
        
    }
    
    
    
}

