//
//  ViewController.swift
//  Exercicio1
//
//  Created by Swift on 21/01/17.
//  Copyright © 2017 Ken Aramaki. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    
    //MARK -Metodos
    
    //MARK -Actions
    
    @IBAction func iniciar(_ sender:UIButton) {
        // Criando um bloco para agrupar os processos
        
        DispatchQueue.global().async {
         
        
            
            for i in...10{
               
                DispatchQueue.global().sync{

                
                self labelCima.text = "\(i)"
                
                Thread.sleep(forTimeInterval: 1.0)
                
            }
            
            
        }
        
            DispatchQueue.global().sync {
                
                
            }{
                
                self.LabelBaixo.text ="\(i)"
                
                for i in...10{
                
                    DispatchQueue.main.async {
                        
                    }
                }
                
                
                
            }
        
    }

    }
}

