//
//  ViewController.swift
//  GCD
//
//  Created by Swift on 14/01/17.
//  Copyright © 2017 Ken Aramaki. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - Outlets
    
    
    // MARK: - Propriedades
    
    
    // MARK: - View Life Cicle
    override func viewDidLoad() {
        super.viewDidLoad()

        /* GCD
         
         Nos permite a utilização de recursos avançados de subprocessamento. Possui recursos para divisão de processos em múltiplos núcleos.
         
         Terminologias:
         
         queue: Fila de execução de tarefas
            main_queue: Contentra os recursos principais da sua aplicação
            global_queue: Espaço reservado para processamentos secundários
         
         sync: Define uma execução síncrona, ou seja, não permite blocos simultâneos
         async: Define uma execução assíncrona, ou seja, permite blocos simultâneos
         
        */
    
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Métodos
    
    
    // MARK: - Actions
    
    @IBAction func processarLinhaPrincipal(_ sender: UIButton) {
        
        for _ in 1...10 {
            
            print("Processando!")
            Thread.sleep(forTimeInterval: 1.0)
            
        }
        
    }
    
    @IBAction func processarGCD(_ sender: UIButton) {
        
        DispatchQueue.global().async {
            
            for _ in 1...10 {
                
                print("Processando!")
                Thread.sleep(forTimeInterval: 1.0)
                
            }
            
            
        }
        
    }
 
    
    
}

