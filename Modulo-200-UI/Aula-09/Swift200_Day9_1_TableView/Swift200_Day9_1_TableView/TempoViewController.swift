//
//  TempoViewController.swift
//  Swift200_Day9_1_TableView
//
//  Created by Swift on 05/11/16.
//  Copyright © 2016 Swift. All rights reserved.
//

import UIKit

class TempoViewController: UIViewController {

    @IBOutlet weak var campoIcone: UILabel!
    @IBOutlet weak var campoTemperatura: UILabel!
    @IBOutlet weak var campoCidade: UILabel!
    @IBOutlet weak var campoCredito: UILabel!
    @IBOutlet weak var imagemFundo: UIImageView!

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Recuperamos a cidade favorita atualmente
        // do singleton do app
        let minhaFavorita = App.compartilhado.dadosDaFavorita()
        
        // Agora é só preencher os campos
        campoCidade.text = minhaFavorita.nome
        campoIcone.text = minhaFavorita.icone
        campoCredito.text = minhaFavorita.credito
        imagemFundo.image = UIImage(named: minhaFavorita.bg)
        
        // Continha de graus celsius!
        if App.compartilhado.usarCelsius {
            campoTemperatura.text = "\(minhaFavorita.temperatura)ºC"
        }else{
            let temp = (minhaFavorita.temperatura*9)/5 + 32
            campoTemperatura.text = "\(temp)ºF"
        }
        
        // Nesta tela queremos a barra de navegação escura
        self.navigationController?.navigationBar.barStyle = .black
        
    }
    
    
    
    
}
