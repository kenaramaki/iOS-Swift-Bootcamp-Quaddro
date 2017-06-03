//
//  ViewController.swift
//  WebServiceJson
//
//  Created by Árthur Ken Aramaki Mota on 01/04/17.
//  Copyright © 2017 Árthur Ken Aramaki Mota. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // https://viacep.com.br/ws/06033190/json/
        
        // Criando a URL
        let url = URL(string: "https://viacep.com.br/ws/06033190/json/")!
        
        // Criando a sessão que trabalhará a requisição
        let sessao = URLSession(configuration: URLSessionConfiguration.default)
        
        // Criando a tarefa 
        let tarefa : URLSessionDataTask = sessao.dataTask(with: url) { (data, response, error) in
            
            if error == nil {
                // Caso não tenho ocorrido erro
                
                if let dataTemp = data {
                    
                    var dicionario : [String : String] = [:]
                    
                    
                    do {
                        
                        // Resgatandp o objeto do nosso JSON
                        
                        dicionario = try JSONSerialization.jsonObject(with: dataTemp, options: JSONSerialization.ReadingOptions.allowFragments) as! [String : String]
                        
                        print(dicionario)
                        
                        
                    }catch{ }
                    
                    
                    
                } else {
                    
                    print("Data Nula")
                    
                }
                
                
            } else {
                // Caso tenha ocorrido erro
                print("Deu erro")
            }
            
            
        }
        
        tarefa.resume()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

