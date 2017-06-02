//
//  ViewController.swift
//  XML
//
//  Created by Swift on 11/02/17.
//  Copyright © 2017 Ken Aramaki. All rights reserved.
//

import UIKit

class ViewController: UIViewController, XMLParserDelegate {

    // MARK: - Outlets
    
    // MARK: - Propriedades
    var arrayPessoas : [Dictionary<String,String>] = []
    var dicionarioAluno = [String : String]()
    var tagAtual = ""
    var conteudoTag = ""
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Criando o caminho (path) até o documento de XML
        let pathArquivo = Bundle.main.path(forResource: "dados", ofType: "xml")
        
        // Criando uma URL a partir da string que contém o path do nosso arquivo
        let urlArquivo = URL(fileURLWithPath: pathArquivo!)
        
        // Criando um objeto que fará o parse (interpretação) do nosso XML. A classe responsável por este trabalho é o XMLParser (vulgo NSXMLParser)
        let xmlParser = XMLParser(contentsOf: urlArquivo)
        
        // Atribuindo o delegate
        xmlParser?.delegate = self
        
        // Acionando o método que faz toda a interpretação do XML
        xmlParser?.parse()
        
    }
    
    // MARK: - Métodos de XMLParserDelegate
    
    //  Este método é disparado sempre que se inicia a interpretação de um documento
    func parserDidStartDocument(_ parser: XMLParser) {
        
        print("parserDidStarDocument - Iniciou a interpretação do Documento")
        
    }
    
    // Este método é disparado sempre que uma abertura de tag é encontrada
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        
        print("didStartElement - Abriu uma tag: \(elementName)")
        
        self.tagAtual = elementName
        
        // Se na abertura de tags a tag for uma tag de conteúdo específico limpamos o nosso conteúdo tag
        if elementName == "nome" || elementName == "idade"{
            
            self.conteudoTag = ""
            
        }
        
    }
    
    // Este método é disparado sempre que um fechamento de tag é encontrado
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        
        print("didEndElement - Fechou tag")
        
        // Caso encontrarmos uma tag de fechamento de uma tag de conteúdo (nome, idade), armazenamos o conteúdo encontrado em nosso dicionário
        if elementName == "nome" {
            
            // Criamos uma chave em nosso dicionário e adicionamos o conteúdo encontrado
            self.dicionarioAluno ["nome"] = self.conteudoTag
            
            // Limpando as variáveis de controle 
            self.conteudoTag =  ""
            self.tagAtual = ""
            
        }
        
        // Caso a tag for uma tag de idade
        if elementName == "idade" {
            
            // Criamos uma chave no nosso dicionário e adicionamos o conteúdo encontrado
            self.dicionarioAluno ["idade"] = self.conteudoTag
            
            // Limpando as variáveis de controle
            self.conteudoTag = ""
            self.tagAtual = ""
            
        }
        
        
        // Caso a tag for uma tag aluno
        if elementName == "aluno" {
            
            // Adicionamos o nosso dicionário em nossa array
            self.arrayPessoas += [self.dicionarioAluno]
            
        }
        
    }
    
    // Este método é disparado sempre que um conteúdo for encontrado
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        
        print("foundCharacters - Encontrou conteúdo: \(string)")
        
        if self.tagAtual == "nome" || self.tagAtual == "idade" {
            
            self.conteudoTag += string
            
        }
    
    }
    
    // Este método é disparado quando a interpretação do documento é finalizado
    func parserDidEndDocument(_ parser: XMLParser) {
        
        print("parserDidEndDocument - Documento finalizado")
        print("\n\n\n\(self.arrayPessoas)")
        
    }
    
    // MARK: - Métodos
    
    
    // MARK: - Actions
    
    
    
}

