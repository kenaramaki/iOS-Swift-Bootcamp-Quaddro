//
//  ViewController.swift
//  VFL
//
//  Created by Swift Prof on 22/10/16.
//  Copyright © 2016 Swift Prof. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Criar o label para o título
        let titulo = UILabel()
        titulo.text = "Teste"
        titulo.backgroundColor = UIColor.red
        titulo.translatesAutoresizingMaskIntoConstraints = false
        
        // criar o label para o conteúdo
        let descrição = UILabel()
        descrição.text = "Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet"
        descrição.backgroundColor = UIColor.blue
        descrição.numberOfLines = 0
        descrição.translatesAutoresizingMaskIntoConstraints = false
        
        // criar o botão
        let botão = UIButton(type: .system)
        botão.setTitle("Botão", for: .normal)
        botão.backgroundColor = UIColor.gray
        botão.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(titulo)
        self.view.addSubview(descrição)
        self.view.addSubview(botão)
        
        // Precisamos mapear as views do código
        // em um dicionário, dando um nome para
        // cada uma, que será utilizado no
        // string de formatação
        let mapaViews = [
            "t": titulo,
            "d": descrição,
            "b": botão
        ]
        
        // Prepara um vetor para incluir as
        // constraints
        var limitadores:[NSLayoutConstraint] = []
        
        for regra in ["H:|-5-[t]-5-|",
                      "H:|-5-[d]-5-|",
                      "H:|-5-[b]-5-|",
                      "V:|-25-[t]-5-[d]-5@250-[b(==65)]-5-|"
            ]{
                limitadores.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: regra, options: NSLayoutFormatOptions(), metrics: nil, views: mapaViews))
        }
        
        // Ativar as constraints
        NSLayoutConstraint.activate(limitadores)
    }

}

