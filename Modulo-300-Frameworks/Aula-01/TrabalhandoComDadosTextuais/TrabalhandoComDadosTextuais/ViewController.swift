//
//  ViewController.swift
//  TrabalhandoComDadosTextuais
//
//  Created by Swift on 14/01/17.
//  Copyright © 2017 Ken Aramaki. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    /*
     
     É possível salvar dados textuais diretamente em disco para processamento futuro. Este recurso se torna particularmente útil quando é necessário uma perssistência na aplicação.
     
    */
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let caminhoParaSandBox = NSHomeDirectory()
        
        let pathDocuments = (caminhoParaSandBox as NSString).appendingPathComponent("Documents")
        
        let pathArquivo = (pathDocuments as NSString).appendingPathComponent("arquivo.txt")
        
        print(pathArquivo)
        
        let stringParaSerSalva = "\"Os que são loucos o suficiente para achar que podem mudar o mundo são os que de fato o mudam\" - Steve Jobs"
        
        do{
            
            try stringParaSerSalva.write(toFile: pathArquivo, atomically: true, encoding: String.Encoding.utf8)
            
        }catch{}
     
        
        // Fazendo o resgate do elemento salvo
        
        
        let stringResgatada = try? String(contentsOfFile: pathArquivo, encoding: String.Encoding.utf8)
            
        print("\(stringResgatada)")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

