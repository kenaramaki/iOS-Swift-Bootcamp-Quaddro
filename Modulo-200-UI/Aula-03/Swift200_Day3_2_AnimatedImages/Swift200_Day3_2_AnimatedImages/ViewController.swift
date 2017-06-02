//
//  ViewController.swift
//  Swift200_Day3_2_AnimatedImages
//
//  Created by Swift on 24/09/16.
//  Copyright © 2016 Quaddro. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    func toqueEm(ponto:CGPoint) {
        
        // Colocando todas imagens num vetor
        
        var vetorDeImagens:[UIImage] = []
        
        for i in 1...32{
            let imageName = "drop\(i)"
            if let imageData = UIImage(named:imageName) {
                vetorDeImagens.append(imageData)
            }
        }
        
        // Cria uma imageView para rodar nossa animação
        // e centraliza ela no ponto
        let umaOnda = UIImageView(frame: CGRectMake(0, 0, 100, 100))
        umaOnda.center = ponto
        umaOnda.animationImages = vetorDeImagens
        umaOnda.animationRepeatCount = 1
        self.view?.addSubview(umaOnda)
        umaOnda.startAnimating()
        
        // SAP: Chame esse método, com esse parametro, depois desse tempo
        performSelector(#selector(removerUmaOnda), withObject: umaOnda, afterDelay: 1.2)
        
    }
    
    // Removendo as ondinhas
    func removerUmaOnda(sender:UIImageView){
        sender.removeFromSuperview()
    }

    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        // versão multi-touch
        for touch in touches {
            let centro = touch.locationInView(self.view)
            toqueEm(centro)
        }
    }
    
    
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        // versão multi-touch
        for touch in touches {
            let centro = touch.locationInView(self.view)
            toqueEm(centro)
            }
        }
        
        
        // versão sem multitouch
        //if let centro = touches.first?.locationInView(self.view){
        //    toqueEm(centro)
        //}
    

}

