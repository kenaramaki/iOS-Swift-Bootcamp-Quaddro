//
//  ViewController.swift
//  ColorPassword
//
//  Created by Swift on 10/09/16.
//  Copyright © 2016 Quaddro. All rights reserved.
//


/*
 
 App: Color Password
 Crie um aplicativo que apresente na tela inicial três listras coloridas.
 Cada vez que o usuário toca em uma listra, o programa deve trocar sua cor.
 São 6 cores: azul, vermelho, verde, roxo, amarelo, laranja
 Inicialmente todas estão azul
 
 Crie um botão "entrar" no rodapé e defina uma senha.
 Exemplo de senha: verde, laranja, azul
 Quando tocar em "entrar verifica se a senha está correta.
 Se estiver, mostra uma tela de sucesso, senão, volta tudo para azul
 
 Bônus: contar o número de tentativas e mostrar na tela de sucesso"
 
 */

import UIKit

class ViewController: UIViewController {

    let cores = [UIColor.blueColor(),
                 UIColor.redColor(),
                 UIColor.greenColor(),
                 UIColor.purpleColor(),
                 UIColor.yellowColor(),
                 UIColor.orangeColor()]
    
    let senha = [UIColor.purpleColor(),
                 UIColor.greenColor(),
                 UIColor.redColor()]
    
    var index1 = 1
    var index2 = 1
    var index3 = 1
    
    var tentativas = 0
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        print("Toquei na View: \(touches.first?.view?.tag)")
        
        if touches.first?.view?.tag == 1 {
            self.view.viewWithTag(1)?.backgroundColor = cores[index1]
            index1 += 1
            
            if index1 == 6 {
                index1 = 0
            }
        }
        
        if touches.first?.view?.tag == 2 {
            self.view.viewWithTag(2)?.backgroundColor = cores[index2]
            index2 += 1
            
            if index2 == 6 {
                index2 = 0
            }
        }
        
        if touches.first?.view?.tag == 3 {
            self.view.viewWithTag(3)?.backgroundColor = cores[index3]
            index3 += 1
            
            if index3 == 6 {
                index3 = 0
            }
        }
        
    }
    
    
    @IBAction func entrar(sender: AnyObject) {
        
        tentativas += 1
        
        if (self.view.viewWithTag(1)?.backgroundColor == senha[0] && self.view.viewWithTag(2)?.backgroundColor == senha[1] && self.view.viewWithTag(3)?.backgroundColor == senha[2]) {
            print("Senha correta!")
            
            if let resultado = storyboard?.instantiateViewControllerWithIdentifier("resultadoViewController") as? ResultadoViewController{
                resultado.totalDeTentativas = tentativas
                presentViewController(resultado, animated: true, completion: nil)
            }
            
        } else {
            print("Senha errada!")
        }

        print(tentativas)

    }
    
   
    override func viewWillAppear(animated: Bool) {
        view.viewWithTag(1)?.backgroundColor = UIColor.blueColor()
        view.viewWithTag(2)?.backgroundColor = UIColor.blueColor()
        view.viewWithTag(3)?.backgroundColor = UIColor.blueColor()
        
        tentativas = 0 
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.view.viewWithTag(1)?.backgroundColor = UIColor.blueColor()
        self.view.viewWithTag(2)?.backgroundColor = UIColor.blueColor()
        self.view.viewWithTag(3)?.backgroundColor = UIColor.blueColor()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

