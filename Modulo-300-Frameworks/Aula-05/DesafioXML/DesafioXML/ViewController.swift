//
//  ViewController.swift
//  DesafioXML
//
//  Created by Swift on 11/02/17.
//  Copyright © 2017 Ken Aramaki. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, XMLParserDelegate {

    // MARK: - Outlets
    @IBOutlet weak var tabela: UITableView!

    // MARK: - Propriedades
    var arrayPessoas : [Dictionary<String,String>] = []
    var dicionarioAluno = [String : String]()
    var tagAtual = ""
    var conteudoTag = ""
    
    var pathArquivo = ""
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let path = Bundle.main.path(forResource: "dados", ofType: "xml") {
            
            pathArquivo = path
            
        }
        
        let urlArquivo = URL(fileURLWithPath: pathArquivo)
        
        let xmlParser = XMLParser(contentsOf: urlArquivo)
        
        xmlParser?.delegate = self
        
        xmlParser?.parse()
        
    }

    // MARK: - Métodos
    
    // MARK: - Actions
    
    // MARL: = Métodos de XMLParserDelegate
    
    func parserDidStartDocument(_ parser: XMLParser) {
        
        print("parserDidStartDocument - Iniciou a interpretação do Documento")
        
    }
    
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        print("didStartElement - Abriu a tag: \(elementName)")
        
        self.tagAtual = elementName
        
        if elementName == "nome" || elementName == "idade" {
            
            self.conteudoTag = ""
            
        }
        
    }
    
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        print("didEndElement - Fechou a tag: \(elementName)")
        
        if elementName == "nome" {
            
            self.dicionarioAluno ["nome"] = self.conteudoTag
        
            self.conteudoTag = ""
            self.tagAtual = ""
        
        }
        
        if elementName ==  "idade" {
            
            self.dicionarioAluno ["idade"] = self.conteudoTag
            
            self.conteudoTag = ""
            self.tagAtual = ""
            
        }
        
        if elementName == "aluno" {
            
            self.arrayPessoas += [self.dicionarioAluno]
            
        }
        
    }
    
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        print("foundCharacters - Encontrou conteúdo: \(string)")
        
        if self.tagAtual == "nome" || self.tagAtual == "idade" {
            
            self.conteudoTag += string
            
        }
        
    }
    
    func parserDidEndDocument(_ parser: XMLParser) {
        print("parserDidEndDocument - Documento finalizado")
        
        print("\n\n\n\(self.arrayPessoas)")

    }
    
    
    // MARK: - Métodos de TableView
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return arrayPessoas.count
        
    }
    
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //let cell = UITableViewCell(style: .default, reuseIdentifier: "Cell") as! Celula
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! Celula
        
        cell.labelIdade.text = self.arrayPessoas[indexPath.row]["idade"]
        cell.labelNome.text = self.arrayPessoas[indexPath.row]["nome"]
        //cell.textLabel?.text = "\(indexPath.row)"
        
        
        return cell
        
    }
    

}

