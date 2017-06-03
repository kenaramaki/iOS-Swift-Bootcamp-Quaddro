//
//  ViewController.swift
//  ULSessionDelegate
//
//  Created by Árthur Ken Aramaki Mota on 08/04/17.
//  Copyright © 2017 Árthur Ken Aramaki Mota. All rights reserved.
//

import UIKit

class ViewController: UIViewController, URLSessionDataDelegate {
    
    // MARK: - Outlets
    
    // MARK: - Propriedades
    
    var sessionGet : URLSession!
    var sessionPut : URLSession!
    var sessionPost : URLSession!
    var sessionDelete : URLSession!
    
    //
    
    var URLBase = URL(string: "https://httpbin.org")!
    
    // MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Inicializando as sessões
        self.sessionGet = URLSession(configuration: URLSessionConfiguration.default, delegate: self, delegateQueue: nil)
        
        self.sessionPut = URLSession(configuration: URLSessionConfiguration.default, delegate: self, delegateQueue: nil)
        
        self.sessionPost = URLSession(configuration: URLSessionConfiguration.default, delegate: self, delegateQueue: nil)
        
        self.sessionDelete = URLSession(configuration: URLSessionConfiguration.default, delegate: self, delegateQueue: nil)
        
        
    }


    // MARK: - Métodos
    
    // MARK: - Actions
    @IBAction func fazerRequisicaoGet(_ sender: UIButton) {
        
        let url = URLBase.appendingPathComponent("/get")
        
        // Criando uma tarefa 
        let tarefa = self.sessionGet.dataTask(with: url)
        
        // Esecutando a tarefa
        tarefa.resume()
        
        
    }
    
    @IBAction func fazerRequisicaoPut(_ sender: UIButton) {
        
        // Criando nossa URL
        let url = URLBase.appendingPathComponent("/put")
        
        // Criando um request
        var requisicao = URLRequest(url: url)
        requisicao.httpMethod = "PUT"
        
        // Colocando os argumentos em nossa requisição
        let jsonBody = ["chave1Put" : "valor1Put", "chave2Put" : "valor2Put", "chave3Put" : "valor3Put"]
        let jsonData = try? JSONSerialization.data(withJSONObject: jsonBody, options: [])
        
        requisicao.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        requisicao.httpBody = jsonData
        
        //
        
        let tarefa = self.sessionPut.dataTask(with: requisicao)
        
        tarefa.resume()
        
        
    }
    
    @IBAction func fazerRequisicaoPost(_ sender: UIButton) {
        
        // Criando nossa URL
        let url = URLBase.appendingPathComponent("/post")
        
        // Criando um request
        var requisicao = URLRequest(url: url)
        requisicao.httpMethod = "POST"
        
        // Colocando os argumentos em nossa requisição
        let jsonBody = ["chave1Post" : "valor1Post", "chave2Post" : "valor2Post", "chave3Post" : "valor3Post"]
        let jsonData = try? JSONSerialization.data(withJSONObject: jsonBody, options: [])
        
        requisicao.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        requisicao.httpBody = jsonData
        
        //
        
        let tarefa = self.sessionPost.dataTask(with: requisicao)
        
        tarefa.resume()
        
        
    }
    
    @IBAction func fazerRequisicaoDelete(_ sender: UIButton) {
        
        // Criando nossa URL
        let url = URLBase.appendingPathComponent("/delete")
        
        // Criando um request
        var requisicao = URLRequest(url: url)
        requisicao.httpMethod = "DELETE"
        
        // Colocando os argumentos em nossa requisição
        let jsonBody = ["chave1Delete" : "valor1Delete", "chave2Delete" : "valor2Delete", "chave3Delete" : "valor3Delete"]
        let jsonData = try? JSONSerialization.data(withJSONObject: jsonBody, options: [])
        
        requisicao.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        requisicao.httpBody = jsonData
        
        //
        
        let tarefa = self.sessionDelete.dataTask(with: requisicao)
        
        tarefa.resume()
        
        
    }
    
    
    // MARK: - Métodos de URLSessionDataDelegate
    
    func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive response: URLResponse, completionHandler: @escaping (URLSession.ResponseDisposition) -> Void) {
        
        completionHandler(URLSession.ResponseDisposition.allow)
        
    }
    
    func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive data: Data) {
        
        if session == self.sessionGet {
            
            print("GET")
            
        }
        
        
        if session == self.sessionPut   {
            
            print("PUT")
            
        }
        
        
        if session == self.sessionPost   {
            
            print("POST")
            
        }
        
        
        if session == self.sessionDelete   {
            
            print("DELETE")
            
        }
        
        do {
            
            let dicionario = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments)
            
            print(dicionario)
            
        }catch{}
        
    }
    

}

