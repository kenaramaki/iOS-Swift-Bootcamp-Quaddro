//
//  MeuParser.swift
//  DesafioXML_Felipe
//
//  Created by Swift on 11/02/17.
//  Copyright © 2017 Ken Aramaki. All rights reserved.
//

import UIKit

/*
 
 Criamos esta classe para parsear nosso XML
 
*/

class MeuParser: NSObject, XMLParserDelegate {

    // MARK: - Propriedades
    
    private var arrayPessoas : [Dictionary<String,String>] = []
    private var dicionarioAluno = [String : String]()
    private var tagAtual = ""
    private var conteudoTag = ""
    
    // Criando a propriedade que definirá o delegate
    var delegate : MeuParserDelegate?
    
    //
    
    // MARK: - Métodos
    func iniciarParse() {
        
        // Criando o caminho até o nosso XML
        let pathArquivo = Bundle.main.path(forResource: "dados", ofType: "xml")
        
        // Criamos uma URL s partir da string
        guard let pathTemp = pathArquivo else {
            return
        }
        
        
        let urlArquivo = URL(fileURLWithPath: pathTemp)
        let xmlParser = XMLParser(contentsOf: urlArquivo)
        
        // !!!!!!! Não esquecer !!!!!!!
        xmlParser?.delegate = self
        
        // Acionando efetivamente o parser
        xmlParser?.parse()
        
    }
    
    // MARK: - Métodos XMLParserDelegate
    
    func parserDidStartDocument(_ parser: XMLParser) {
        
        
    }
    
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        
        self.tagAtual = elementName
        
        // Se na abertura a tag for uma tag de conteúdo limpamos o conteúdo tag
        if elementName == "nome" || elementName == "idade" {
            
            self.conteudoTag = ""
            
        }
        
    }
    
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        
        if elementName == "nome" {
            
            self.dicionarioAluno["nome"] = self.conteudoTag
            
            // Limpamos as variáveis
            self.conteudoTag = ""
            self.tagAtual = ""
            
        }
        
        if elementName == "idade" {
            
            self.dicionarioAluno["idade"] = self.conteudoTag
            
            // Limpamos as variáveis
            self.conteudoTag = ""
            self.tagAtual = ""
            
        }
        
        if elementName == "aluno" {
            
            self.arrayPessoas += [self.dicionarioAluno]
        
        }
        
    }
    
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        
        if self.tagAtual == "nome" || self.tagAtual == "idade" {
            
            self.conteudoTag += string
            
        }
        
    }
    
    func parserDidEndDocument(_ parser: XMLParser) {
        
        //print("\(self.arrayPessoas)")
        self.delegate?.meuParserFinalizouAInterpretacao(self.arrayPessoas)
        
    }
    
}

protocol MeuParserDelegate {
    
    func meuParserFinalizouAInterpretacao(_ resultado : Array<Dictionary<String, String>>)
    
}


