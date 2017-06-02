//
//  ViewController.swift
//  TrabalhandoComArraysEDicionarios
//
//  Created by Swift on 14/01/17.
//  Copyright © 2017 Ken Aramaki. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        /* Trabalhando com arrays e dictionary
         
         Uma property list é um arquivo que pode salvar informações estruturadas no formato de dictionary ou array.
         
         Property Lists podem ser constituídas apenas de certos tipos de dados como dicionários, arrays, strings, números, datas (Date), dados binários (Data), valores boleanos.
         
         Não é possível salvar (inicialmente) dados completos em uma plist, caso haja a necessidade você pode salvar apenas as propriedades e posteriormente recriar suas instâncias
         
        */
        
        
        // Criando o path onde o arquivo será salvo
        
        let caminhoParaSandbox = NSHomeDirectory()
        
        let pathDocuments = (caminhoParaSandbox as NSString).appendingPathComponent("Documents")
        
        print(pathDocuments)
        
        
        // ============================= Salvando Arrays ========================
        
            // Criando o path onde o arquivo será salvo
        
        let pathArraySalvo = (pathDocuments as NSString).appendingPathComponent("array.plist")
        
        // Criando o array com os valores que serão salvos
        let arrayNomes = ["Ken", "João", "Maria"]
        
        
        // Realizando a gravação em disco
        let arrayConvertido = arrayNomes as NSArray
        arrayConvertido.write(toFile: pathArraySalvo, atomically: true)
        
        
        // ================================== Resgatando o elemento salvo =====================
        
        let arrayResgatado = NSArray(contentsOfFile: pathArraySalvo)
        print("ArrayResgatado: \(arrayResgatado)")
        
        
        
        // ================================== Salvando dicionários =====================

        // Criando o path até o elemento
        
        let pathDicionarioSalvo = (pathDocuments as NSString).appendingPathComponent("dicionario.plist")
        
        // Criando o dicionário que será salvo em disco
        let dicionario = ["nome" : "Ken", "sobrenome" : "Aramaki"]
        
        // Realizando a gravação em disco
        let dicionarioConvertido = dicionario as NSDictionary
        dicionarioConvertido.write(toFile: pathDicionarioSalvo, atomically: true)
        
        
        // =========================== Resgatando o dicionário
        
        let dicionarioResgatado = NSDictionary(contentsOfFile: pathDicionarioSalvo)
        print("DicionarioResgatado: \(dicionarioResgatado)")
        
        
        
        
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

