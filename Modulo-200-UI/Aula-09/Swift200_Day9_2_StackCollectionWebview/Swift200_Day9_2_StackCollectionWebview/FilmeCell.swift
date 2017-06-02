//
//  FilmeCell.swift
//  Swift200_Day9_2_StackCollectionWebview
//
//  Created by Swift on 05/11/16.
//  Copyright © 2016 Swift. All rights reserved.
//

import UIKit

class FilmeCell: UITableViewCell {

    @IBOutlet weak var imagemPoster: UIImageView!
    
    @IBOutlet weak var titulo: UILabel!
    @IBOutlet weak var descrição: UILabel!
    @IBOutlet weak var estrelas: UILabel!
    
    @IBOutlet weak var direção: UILabel!
    @IBOutlet weak var duração: UILabel!
    @IBOutlet weak var classificação: UILabel!
    
    
    func atualizar(paraFilme filme:Filme){
        
        titulo.text = filme.nome
        descrição.text = filme.sinopse
        direção.text = filme.direção
        duração.text = "\(filme.duração) min."
        classificação.text = filme.classificação
        imagemPoster.image = filme.poster
        
    }
    
    
    
    
}
