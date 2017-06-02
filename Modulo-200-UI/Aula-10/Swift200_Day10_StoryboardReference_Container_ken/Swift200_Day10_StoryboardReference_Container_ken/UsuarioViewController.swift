//
//  UsuarioViewController.swift
//  Swift200_Day10_StoryboardReference_Container_ken
//
//  Created by Swift on 12/11/16.
//  Copyright © 2016 Swift. All rights reserved.
//

import UIKit

class UsuarioViewController: UIViewController {

    @IBOutlet weak var nomeUsuario: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nomeUsuario.text = "Now Playing: Guns N' Roses"
        
    }

}
