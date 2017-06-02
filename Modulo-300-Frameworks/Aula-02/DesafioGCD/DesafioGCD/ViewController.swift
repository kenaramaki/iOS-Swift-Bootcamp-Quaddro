//
//  ViewController.swift
//  DesafioGCD
//
//  Created by Swift on 21/01/17.
//  Copyright © 2017 Swift. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var textFieldNumero: UITextField!
    
    @IBOutlet weak var textViewTabuada: UITextView!
    
    // MARK: - Propriedades
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.setup()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: - Métodos
    
    func setup() {
        
        self.textViewTabuada.text = ""
        self.textViewTabuada.isEditable = false
        
        
    }
    
    // MARK: - Actions
    
    @IBAction func iniciar(_ sender: UIButton) {
        
        
        if !(self.textFieldNumero.text!.isEmpty){
            
            
            let numeroEscolhido = self.textFieldNumero.text!.intValue
            
            
            DispatchQueue.global().async {
                
                
                
                for i in 1...10 {
                    
                    
                    DispatchQueue.main.async {
                    
                        
                        self.textViewTabuada.text = "\(self.textViewTabuada.text!)\n \(numeroEscolhido) X \(i) = \(numeroEscolhido * i)"
                    }
                    
                    
                    
                    Thread.sleep(forTimeInterval: 1.0)
                    
                }
                
                
            }
            
            
            
            
        }else{
            
            
            let alerta = UIAlertController(title: "Alerta!", message: "Mermão, coloca o múmero aí.", preferredStyle: .alert)
            
            let acaoOk = UIAlertAction(title: "Ok", style: .default, handler: nil)
            
            alerta.addAction(acaoOk)
            
            self.present(alerta, animated: true, completion: nil)
            
            
        }
        
        
    }
    
}


extension String{
    
    
    var intValue : Int {
        
        let valorConvertido = self as NSString
        
        
        return Int(valorConvertido.intValue)
    }
    
    
    
    
}





