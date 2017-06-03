//
//  ViewController.swift
//  URLSession
//
//  Created by Árthur Ken Aramaki Mota on 08/04/17.
//  Copyright © 2017 Árthur Ken Aramaki Mota. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - Propriedades
    
    var urlBase = URL(string: "https://httpbin.org")!
    
    // MARK: - Outlets
    
    // MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    

    // MARK: - Métodos
    
    // MARK: - Actions
    
    @IBAction func fazerRequisicaoGet(_ sender: UIButton) {
        
        let url = urlBase.appendingPathComponent("/get")
        
        let sessao = URLSession(configuration: URLSessionConfiguration.default)
        
        let tarefa : URLSessionDataTask = sessao.dataTask(with: url) { (data, response, error) in
            
            if error == nil {
                
                if let dataTemp = data {
                    
                    do {
                        
                        let dicionario = try JSONSerialization.jsonObject(with: dataTemp, options: JSONSerialization.ReadingOptions.allowFragments) as! [String : AnyObject]
                        
                        print(dicionario)
                        
                        
                    } catch{}
                    
                }
                
            }
            
        }
        
        tarefa.resume()
        
    }

    
    
    @IBAction func fazerRequisicaoPost(_ sender: UIButton) {
    
        // Criando a noss url
        let url = urlBase.appendingPathComponent("/post")
        
        // Criano a session
        let sessao = URLSession(configuration: URLSessionConfiguration.default)
        
        // Criando o request
        var requisicao = URLRequest(url: url)
        requisicao.httpMethod = "POST"
        
        // Colocando os argumrntos na requisição
        let jsonBody = ["chavePost1" : "valorPost1", "chavePost2" : "valorPost2", "chavePost3" : "valorPost3"]
        let jsonData = try? JSONSerialization.data(withJSONObject: jsonBody, options: [])
        
        //
        
        requisicao.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        requisicao.httpBody = jsonData
        
        //
        
        let tarefa = sessao.dataTask(with: requisicao) { (data, response, error) in
            
            if error == nil {
                
                if let dataTemp = data {
                 
                    do {
                        
                        let dicionario = try JSONSerialization.jsonObject(with: dataTemp, options: JSONSerialization.ReadingOptions.allowFragments) as! [String : AnyObject]
                        
                        print(dicionario)
                        
                        
                    }catch{}
                    
                }
                
            }
            
        }
        
        tarefa.resume()
    
    }
    

    @IBAction func fazerRequisicaoPut(_ sender: UIButton) {
   
        // Criando a noss url
        let url = urlBase.appendingPathComponent("/put")
        
        // Criano a session
        let sessao = URLSession(configuration: URLSessionConfiguration.default)
        
        // Criando o request
        var requisicao = URLRequest(url: url)
        requisicao.httpMethod = "PUT"
        
        // Colocando os argumrntos na requisição
        let jsonBody = ["chavePut1" : "valorPut1", "chavePut2" : "valorPut2", "chavePut3" : "valorPut3"]
        let jsonData = try? JSONSerialization.data(withJSONObject: jsonBody, options: [])
        
        //
        
        requisicao.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        requisicao.httpBody = jsonData
        
        //
        
        let tarefa = sessao.dataTask(with: requisicao) { (data, response, error) in
            
            if error == nil {
                
                if let dataTemp = data {
                    
                    do {
                        
                        let dicionario = try JSONSerialization.jsonObject(with: dataTemp, options: JSONSerialization.ReadingOptions.allowFragments) as! [String : AnyObject]
                        
                        print(dicionario)
                        
                        
                    }catch{}
                    
                }
                
            }
            
        }
        
        tarefa.resume()
        
        
    
    }
    
    
    @IBAction func fazerRequisicaoDelete(_ sender: UIButton) {
   
        // Criando a noss url
        let url = urlBase.appendingPathComponent("/delete")
        
        // Criano a session
        let sessao = URLSession(configuration: URLSessionConfiguration.default)
        
        // Criando o request
        var requisicao = URLRequest(url: url)
        requisicao.httpMethod = "DELETE"
        
        // Colocando os argumrntos na requisição
        let jsonBody = ["chaveDelete1" : "valorDelete1", "chaveDelete2" : "valorDelete2", "chaveDelete3" : "valorDelete3"]
        let jsonData = try? JSONSerialization.data(withJSONObject: jsonBody, options: [])
        
        //
        
        requisicao.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        requisicao.httpBody = jsonData
        
        //
        
        let tarefa = sessao.dataTask(with: requisicao) { (data, response, error) in
            
            if error == nil {
                
                if let dataTemp = data {
                    
                    do {
                        
                        let dicionario = try JSONSerialization.jsonObject(with: dataTemp, options: JSONSerialization.ReadingOptions.allowFragments) as! [String : AnyObject]
                        
                        print(dicionario)
                        
                        
                    }catch{}
                    
                }
                
            }
            
        }
        
        tarefa.resume()
        
    }

}

