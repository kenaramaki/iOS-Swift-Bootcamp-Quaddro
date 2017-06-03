//
//  API.swift
//  NSURLSessinClasseAPI
//
//  Created by Árthur Ken Aramaki Mota on 08/04/17.
//  Copyright © 2017 Árthur Ken Aramaki Mota. All rights reserved.
//

import Foundation

var URLBase = URL(string: "https://httpbin.org")!

class API {
    
    // Requisição GET
    
    static func requisitarGet(_ completion : @escaping (_ resposta : [String : AnyObject], _ erro : Error?) -> Void) {
        
        let url = URLBase.appendingPathComponent("/get")
        
        let sessao = URLSession(configuration: URLSessionConfiguration.default)
        
        sessao.dataTask(with: url) { (data, response, error) in
            
            if error == nil {
                
                if let dataTemp = data {
                    
                    do {
                        
                        let dicionario = try JSONSerialization.jsonObject(with: dataTemp, options: JSONSerialization.ReadingOptions.allowFragments) as! [String : AnyObject]
                
                        completion(dicionario, nil)
                        
                        
                    }catch{
                    
                        completion([:], nil)
                    
                    }
                    
                } else {
                    // Caso a data seja nula
                    
                    completion([:], nil)
                    
                }
                
                
                
            } else {
                // Caso tenha dado erro (error != nil)
                
                completion([:], error)
                
                
            }
            
            
            
        }.resume()
        
    }
    
    
    // Requisicao PUT
    
    static func requisitarPut(_ completion : @escaping (_ resposta : [String : AnyObject], _ erro : Error?) -> Void) {
        
        // Criando a url
        let url = URLBase.appendingPathComponent("/put")
        
        // Criando a sessão 
        let sessao = URLSession(configuration: URLSessionConfiguration.default)
        
        // Criando o request
        var requisicao = URLRequest(url: url)
        requisicao.httpMethod = "PUT"
        
        // Colocando os argumentos
        let jsonBody = ["chavePut1" : "valorPut1", "chavePut2" : "valorPut2", "chavePut3" : "valorPut3"]
        let jsonData = try? JSONSerialization.data(withJSONObject: jsonBody, options: [])
        
        // 
        
        requisicao.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        requisicao.httpBody = jsonData
        
        //
        
        sessao.dataTask(with: requisicao) { (data, response, error) in
            
            if error == nil {
                
                if let dataTemp = data {
                    
                    do {
                        
                        let dicionario = try JSONSerialization.jsonObject(with: dataTemp, options: JSONSerialization.ReadingOptions.allowFragments) as! [String : AnyObject]
                        
                        completion(dicionario, nil)
                        
                    } catch {
                        
                        completion([:], nil)
                        
                    }
                    
                } else {
                    
                    completion([:], nil)
                    
                }
                
                
            } else {
                
                completion([:], error)
                
            }
            
            
        }.resume()
        
        
    }
    
    
    // Requisicao POST
    
    static func requisitarPost(_ completion : @escaping (_ resposta : [String : AnyObject], _ erro : Error?) -> Void) {
        
        // Criando a url
        let url = URLBase.appendingPathComponent("/post")
        
        // Criando a sessão
        let sessao = URLSession(configuration: URLSessionConfiguration.default)
        
        // Criando o request
        var requisicao = URLRequest(url: url)
        requisicao.httpMethod = "POST"
        
        // Colocando os argumentos
        let jsonBody = ["chavePost1" : "valorPost1", "chavePost2" : "valorPost2", "chavePost3" : "valorPost3"]
        let jsonData = try? JSONSerialization.data(withJSONObject: jsonBody, options: [])
        
        //
        
        requisicao.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        requisicao.httpBody = jsonData
        
        //
        
        sessao.dataTask(with: requisicao) { (data, response, error) in
            
            if error == nil {
                
                if let dataTemp = data {
                    
                    do {
                        
                        let dicionario = try JSONSerialization.jsonObject(with: dataTemp, options: JSONSerialization.ReadingOptions.allowFragments) as! [String : AnyObject]
                        
                        completion(dicionario, nil)
                        
                    } catch {
                        
                        completion([:], nil)
                        
                    }
                    
                } else {
                    
                    completion([:], nil)
                    
                }
                
                
            } else {
                
                completion([:], error)
                
            }
            
            
            }.resume()
        
        
    }
    
    
    // Requisicao DELTETE
    
    static func requisitarDelete(_ completion : @escaping (_ resposta : [String : AnyObject], _ erro : Error?) -> Void) {
        
        // Criando a url
        let url = URLBase.appendingPathComponent("/delete")
        
        // Criando a sessão
        let sessao = URLSession(configuration: URLSessionConfiguration.default)
        
        // Criando o request
        var requisicao = URLRequest(url: url)
        requisicao.httpMethod = "DELETE"
        
        // Colocando os argumentos
        let jsonBody = ["chaveDelete1" : "valorDelete1", "chaveDelete2" : "valorDelete2", "chaveDelte3" : "valorDelete3"]
        let jsonData = try? JSONSerialization.data(withJSONObject: jsonBody, options: [])
        
        //
        
        requisicao.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        requisicao.httpBody = jsonData
        
        //
        
        sessao.dataTask(with: requisicao) { (data, response, error) in
            
            if error == nil {
                
                if let dataTemp = data {
                    
                    do {
                        
                        let dicionario = try JSONSerialization.jsonObject(with: dataTemp, options: JSONSerialization.ReadingOptions.allowFragments) as! [String : AnyObject]
                        
                        completion(dicionario, nil)
                        
                    } catch {
                        
                        completion([:], nil)
                        
                    }
                    
                } else {
                    
                    completion([:], nil)
                    
                }
                
                
            } else {
                
                completion([:], error)
                
            }
            
            
            }.resume()
        
        
    }
    
    
}
