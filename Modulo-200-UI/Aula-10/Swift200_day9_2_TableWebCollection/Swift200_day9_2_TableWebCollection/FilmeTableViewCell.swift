//
//  FilmeTableViewCell.swift
//  Swift200_day9_2_TableWebCollection
//
//  Created by Swift on 12/11/16.
//  Copyright © 2016 Luiz Gustavo Lino. All rights reserved.
//

import UIKit

class FilmeTableViewCell: UITableViewCell {

    @IBOutlet weak var titulo: UILabel!
    @IBOutlet weak var direção: UILabel!
    @IBOutlet weak var classificação: UILabel!
    @IBOutlet weak var duração: UILabel!
    @IBOutlet weak var descrição: UILabel!
    @IBOutlet weak var avaliação: UILabel!
    @IBOutlet weak var poster: UIImageView!
    @IBOutlet weak var imagemDeFundo: UIImageView!
    
    func atualizar(paraFilme filme:Filme){
        
        titulo.text = filme.nome
        direção.text = filme.direção
        classificação.text = filme.classificação
        duração.text = "\(filme.duração) min."
        descrição.text = filme.sinopse
        
        poster.image = filme.poster
        imagemDeFundo.image = filme.poster
        
        let estrelas = Array(repeating: "⭐️", count: filme.avaliação)
        avaliação.text = estrelas.joined()
        
    }

}
