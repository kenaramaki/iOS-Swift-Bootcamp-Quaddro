//
//  ViewController.swift
//  Swift300_Day01_Lembretes
//
//  Created by Swift on 14/01/17.
//  Copyright © 2017 Ken Aramaki. All rights reserved.
//

import UIKit

let caminhoParaSandbox = NSHomeDirectory()
let pathDocuments = (caminhoParaSandbox as NSString).appendingPathComponent("Documents")
let pathLembretesTXT = (pathDocuments as NSString).appendingPathComponent("lembretes.txt")


class ViewController: UIViewController {

    @IBOutlet weak var lembretesTextView: UITextView!
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var lembrete: UITextField!
    
    var arrayLembretes = [String]()
    var listaDeLembretes = String()
  
        
    override func viewDidLoad() {
        super.viewDidLoad()

        print(pathDocuments)
        
        //let pathArrayLembretesSalvo = (pathDocuments as NSString).appendingPathComponent("arrayLembretes.plist")
    
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
        
    }

    @IBAction func apagarLembretesAction(_ sender: Any) {
    }
    
   
    
    @IBAction func entrarLembrete(_ sender: Any) {
        print("botão pressionado")
        
        if let lembreteAdicionado = lembrete.text {
            listaDeLembretes += "\(lembreteAdicionado)\n"
        }
        
        lembretesTextView.text = listaDeLembretes
        print(arrayLembretes)
        
        do {
            try listaDeLembretes.write(toFile: pathLembretesTXT, atomically: true, encoding: .utf8)
        }catch{}
        
        
    }
    

}

