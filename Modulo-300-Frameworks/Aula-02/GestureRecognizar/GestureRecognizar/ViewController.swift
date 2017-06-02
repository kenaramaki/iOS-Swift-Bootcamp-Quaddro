//
//  ViewController.swift
//  GestureRecognizar
//
//  Created by Swift on 21/01/17.
//  Copyright © 2017 Swift. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: Outlets
    
    @IBOutlet weak var viewzinha: UIView!
    
    // MARK: Propriedades

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        /*
        
        // Gesto Tap
        
        let gestoTap = UITapGestureRecognizer(target: self, action: #selector(ViewController.disparouTap(_:)))
        
        gestoTap.numberOfTapsRequired = 2
        
     
        self.viewzinha.addGestureRecognizer(gestoTap)
        
        */
 
        // --------
        
        
        /*
        // Swipe
        
        let gestoSwipe = UISwipeGestureRecognizer(target: self, action: #selector(disparouSwipe(_:)))
        
        gestoSwipe.direction = .left
        
        self.viewzinha.addGestureRecognizer(gestoSwipe)
        
         */
        
        // --------
        
        /*
        
        // Pan
        
        let gestoPan = UIPanGestureRecognizer(target: self, action: #selector(disparouPan(_:)))
        
        self.viewzinha.addGestureRecognizer(gestoPan)
        
         */
 
        // -------
        
        
        /*
        // Long Press
        
        let gestoLongPress = UILongPressGestureRecognizer(target: self, action: #selector(ViewController.disparouLongPress(_:)))
        
        gestoLongPress.minimumPressDuration = 3.0
        
        self.viewzinha.addGestureRecognizer(gestoLongPress)
        
         */
 
        //-----------
        
        // Rotation
        
        /*
        
        let gestoRotation = UIRotationGestureRecognizer(target: self, action: #selector(ViewController.disparouRotation(_:)))
        
        self.viewzinha.addGestureRecognizer(gestoRotation)
        
         */
        
        // Pinch
        
        
        let gestoPinch = UIPinchGestureRecognizer(target: self, action: #selector(ViewController.disparouPinch(_:)))
        
        self.viewzinha.addGestureRecognizer(gestoPinch)
        
    
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    // MARK: Métodos
    
    
    // Método que que será disparado pelo Tap
    
    func disparouTap(_ gestoTap : UITapGestureRecognizer) {
        
        print("O usuário Tapou")
    }
    
    // Método que será disparado pelo swipe 
    
    func disparouSwipe(_ gestoSwipe : UISwipeGestureRecognizer){
   
        print("O usuário swipou")
        
        
    }
    
    func disparouPan(_ gestoPan : UIPanGestureRecognizer) {
        
        let posicaoToque = gestoPan.location(in: self.view)
        
        print("\(posicaoToque)")
    
    }
    
    func disparouLongPress(_ gestoLongPress : UILongPressGestureRecognizer) {
        
        if (gestoLongPress.state == UIGestureRecognizerState.began ) {
        
            print("Long Press Disparado")
        }
        
        
    }
    
    
    func disparouRotation(_ gestoRotation : UIRotationGestureRecognizer){
        
        
        gestoRotation.view?.transform = gestoRotation.view!.transform.rotated(by: gestoRotation.rotation)
        
        gestoRotation.rotation = 0
        
        
        
    }
    
    
    func disparouPinch(_ gestoPinch : UIPinchGestureRecognizer){
        
        gestoPinch.view?.transform = gestoPinch.view!.transform.scaledBy(x: gestoPinch.scale, y: gestoPinch.scale)
        
        gestoPinch.scale = 1
        
    }
    
    
    // MARK: Actions
    
    

}

