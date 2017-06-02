//
//  ViewController.swift
//  Swift200_Day2_1_TextField
//
//  Created by Swift on 17/09/16.
//  Copyright © 2016 Quaddro. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var meusCamposDeTexto: [UITextField]!
    
    @IBOutlet weak var campoNome: UITextField!
    @IBOutlet weak var campoIdade: UITextField!
    @IBOutlet weak var campoSenha: UITextField!
    
    @IBAction func limparCampos() {
        for campo in meusCamposDeTexto {
            campo.text = ""
        }
    }
    
    // unwindn segue -> outras telas rebobinam para cá
    @IBAction func volta(sender:UIStoryboardSegue) {
        print("Voltei")
    }
    
    
    
    override func shouldPerformSegueWithIdentifier(identifier: String, sender: AnyObject?) -> Bool {
        
        // Vamos garantir que é a nossa segue "entrar"
        guard identifier == "entrar" else {
            return true
        }
        
        guard tudoPreenchido() else {
            mostraAlerta("Ops! Para entrar nessa festa é preciso preencher todos os campos. Faz essa gentileza?")
            return false
        }
        
        guard campoSenha.text == "123" else {
            mostraAlerta("Humm 🤔 Essa senha aí tá errada! Fica pra próxima, colega. Abraços!")
            return false
        }
        
        // A idade ten que estar preenchida e maior igual que 18
        guard  let idadePreenchida = campoIdade.text
            where Int(idadePreenchida) >= 18 else {
                mostraAlerta("Wow! Infelizmente, lek, essa festança aqui é só para maiores de idade. Fica triste não 😚")
            return false
        }
        
        return true
        
    }
    
    func mostraAlerta(textoAlerta: String) {
        
        let alerta = AlertaView(frame: self.view.frame, texto: textoAlerta)
        self.view.addSubview(alerta)
        
        print(textoAlerta)
    }
    
    
    
    func tudoPreenchido() -> Bool {
        return (meusCamposDeTexto.filter { $0.text == ""}).isEmpty
    }
    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

