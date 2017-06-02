//
//  ViewController.swift
//  Desafio Gesture
//
//  Created by Swift on 28/01/17.
//  Copyright © 2017 Ken Aramaki. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var viewzinha: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Mudar cor com triple tap
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(ViewController.disparaTap(_:)))
        tapGesture.numberOfTapsRequired = 3
        self.viewzinha.addGestureRecognizer(tapGesture)
        
        // Chamando o método Swipe
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.disparaSwipe(_:)))
        swipeRight.direction = UISwipeGestureRecognizerDirection.right
        self.viewzinha.addGestureRecognizer(swipeRight)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.disparaSwipe(_:)))
        swipeLeft.direction = UISwipeGestureRecognizerDirection.left
        self.viewzinha.addGestureRecognizer(swipeLeft)
        
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.disparaSwipe(_:)))
        swipeDown.direction = UISwipeGestureRecognizerDirection.down
        self.viewzinha.addGestureRecognizer(swipeDown)
        
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.disparaSwipe(_:)))
        swipeUp.direction = UISwipeGestureRecognizerDirection.up
        self.viewzinha.addGestureRecognizer(swipeUp)
        
    }

    // Método disparado pelo tap
    func disparaTap (_ gestoTap : UITapGestureRecognizer){
        print("Tap")
        
        UIView.animate(withDuration: 0.5, animations: {
            self.viewzinha.backgroundColor = self.randomColor()

        })
        
        
    }
    
    // Método disparado pelo swipe
    func disparaSwipe(_ gestoSwipe : UISwipeGestureRecognizer){
        print("Swipe")
        
        // Mover 50 pixels para a direita em 0.5 segundos
        switch gestoSwipe.direction {
        case UISwipeGestureRecognizerDirection.right:
            print("Right")
            
            UIView.animate(withDuration: 0.5, animations: {
                self.viewzinha.center.x += 50
            })
            
        // Mover 50 pixels para a esquerda em 0.5 segundos
        case UISwipeGestureRecognizerDirection.left:
            print("Left")
            
            UIView.animate(withDuration: 0.5, animations: {
                 self.viewzinha.center.x -= 50
            })
            
           
        // Mover 50 pixels para baix0 em 0.5 segundos
        case UISwipeGestureRecognizerDirection.down:
            print("Down")
            
            UIView.animate(withDuration: 0.5, animations: {
                self.viewzinha.center.y += 50
            })
            
           
        // Mover 50 pixels para cima em 0.5 segundos
        case UISwipeGestureRecognizerDirection.up:
            print("Up")
            
            UIView.animate(withDuration: 0.5, animations: {
                self.viewzinha.center.y -= 50
            })
            
        default:
            print("Default")
        }
        
    }
    
    // Método para chamar um número randômico
    func randomNumber() -> CGFloat {
        print(CGFloat(arc4random()%256))
        return CGFloat(arc4random()%256)
    }
    
    // Método para gerar uma cor aleatória
    func randomColor() -> UIColor{
        return (UIColor(red: randomNumber()/255.0, green: randomNumber()/255.0, blue: randomNumber()/255.0, alpha: 1.0))
    }
    

}

