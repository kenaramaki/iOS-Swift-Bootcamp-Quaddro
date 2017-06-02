//
//  ViewController.swift
//  Swift200_Day2_2_UISlider
//
//  Created by Swift on 17/09/16.
//  Copyright © 2016 Quaddro. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(animated: Bool) {
        
        let contaGotas = ContaGotasViewController(nibName: "ContaGotasViewController", bundle: nil)
        contaGotas.modalTransitionStyle = .CrossDissolve // aparece com fade
        contaGotas.modalPresentationStyle = .OverCurrentContext // não descarta a tela de atrás
        presentViewController(contaGotas, animated: true, completion: nil)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

