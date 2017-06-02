//
//  ViewController.swift
//  Multiplicação
//
//  Created by Swift on 21/01/17.
//  Copyright © 2017 Eduardi. All rights reserved.
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
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    // MARK: - Métodos
    
    // MARK: - Actions

    @IBAction func clickBotao(_ sender: Any) {
    
    let numeroDigitado = self.textFieldNumero.text!.intValue
        

        //print("Numero: \(numeroDigitado)")
        
         DispatchQueue.global().async {
            
        for i in 1...10{
        
        
          //  print("\(numeroDigitado) X \(i) = \(numeroDigitado * i)")
        
                 
                
                    Thread.sleep(forTimeInterval: 1.0)
                    
                    
                    DispatchQueue.main.async {
                      
                        self.textViewTabuada.text = "\(self.textViewTabuada.text!)\n \(numeroDigitado) X \(i) = \(numeroDigitado * i)"
                        
                        }
                    
                    
              
            

            }
            
            
        }
    
        
        self.textFieldNumero.resignFirstResponder()
    
 
 
        
        
        
    }
    
    
 
    
    
    
    
}



extension String{

    var intValue : Int{
    
    return  Int((self as NSString).intValue)
    
    }


}
