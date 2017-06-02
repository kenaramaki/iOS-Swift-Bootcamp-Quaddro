//
//  ViewController.swift
//  Swift200_Day1_1_ViewsOutletsButton
//
//  Created by Swift on 10/09/16.
//  Copyright © 2016 Quaddro. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("Hello World!")
        // Do any additional setup after loading the view, typically from a nib.
        
        guard let viewUm = self.view.viewWithTag(1) else {
            print("Atenção! Algo deu errado na ViewController")
            //return
            fatalError()
        }
        
        viewUm.alpha = 0.3
        
        
        self.view.viewWithTag(2)?.alpha = 0.6
        
        
        if let viewTres = self.view.viewWithTag(3) {
            viewTres.alpha = 0.2
            viewTres.viewWithTag(4)?.hidden = false
            
            let viewQuatro = viewTres.viewWithTag(4)
            viewQuatro?.backgroundColor = UIColor.orangeColor()
        }
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        print("Pick! Tag: \(touches.first?.view?.tag)")
        
        if touches.first?.view?.tag == 2 {
            
            if let segundo = storyboard?.instantiateViewControllerWithIdentifier("segundoViewController") {
                presentViewController(segundo, animated: true, completion: nil)
            }
        }
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        print("1) A tela vai aparecer!")
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        print("1) A tela apareceu")
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        print("1) A tela vai desaparecer!")
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        print("1) A tela desapareceu")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

