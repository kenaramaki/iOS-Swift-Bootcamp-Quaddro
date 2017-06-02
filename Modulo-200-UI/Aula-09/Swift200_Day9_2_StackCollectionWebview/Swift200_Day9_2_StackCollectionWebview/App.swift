//
//  App.swift
//  Swift200_Day9_2_StackCollectionWebview
//
//  Created by Swift on 05/11/16.
//  Copyright © 2016 Swift. All rights reserved.
//

import Foundation
import UIKit

// Atalho para acessar GerenteDoApp.compartilhado
// utilizando apenas 'app.'
var app:GerenteDoApp{
    return GerenteDoApp.compartilhado
}

struct Filme {
    
    let id:Int
    let nome:String
    let direção:String
    let duração:Int
    let classificação:String
    let sinopse:String
    let avaliação:Int
    let detalhes:String
    var poster:UIImage {
        return UIImage(named: "\(id)") ?? UIImage()
    }
    
}


class GerenteDoApp {
    
    // Uma variável estática privada imutável
    fileprivate static let compartilhado = GerenteDoApp()
    
    typealias Categoria = (genero:String, lista:[Filme])
    let filmes:[Categoria] = [
        
        // pastebin.com/RaA9mrF2
        (
            "aventura",[
                Filme(id: 1, nome: "Doutor Estranho", direção: "Scott Derrickson", duração: 134, classificação: "12 anos", sinopse: "Doutor Stephen Strange é um cirurgião arrogante que, depois de perder o uso das mãos em um acidente de carro, parte em busca de uma cura e acaba encontrando a redenção como o maior mago do universo Marvel.", avaliação: 3, detalhes:"http://www.imdb.com/title/tt1211837"),
                Filme(id: 3, nome: "Capitão América: Guerra Civil", direção: "Anthony Russo", duração: 146, classificação: "Livre", sinopse: "O terceiro filme do Capitão América terá Steve Rogers contra Tony Stark em uma briga sobre a regulamentação dos heróis.", avaliação: 4, detalhes: "http://www.imdb.com/title/tt3498820/"),
                Filme(id: 2, nome: "A HARD DAY", direção: "Seong-hun Kim", duração: 111, classificação: "livre", sinopse: "A trama acompanha o detetive Gun-su que, ao voltar do funeral de sua mãe, atropela um homem em uma estrada escura. Em um momento de desespero, o policial oculta o crime e esconde o corpo junto ao de sua mãe. Acontece que alguém testemunhou o atropelamento e começa a ameaçar Gun-su.", avaliação: 4, detalhes: "http://www.imdb.com/title/tt3697626/")
            ]
        ),
        
        (
            "animação",[
                Filme(id: 4, nome: "Kubo e as Cordas Mágicas", direção: "Travis Knight", duração: 90, classificação: "Livre", sinopse: "Kubo vive uma vida tranquila em uma pequena vila no Japão até que um espírito vingativo faz com que todo tipo de monstros e deuses passem a perseguí-lo. Para se livrar disso, Kubo precisa encontrar a armadura mágica que seu pai, um lendário samurai, costumava usar.", avaliação: 5, detalhes: "http://www.imdb.com/title/tt4302938/"),
                Filme(id: 5, nome: "Os Incríveis", direção: "Brad Bird", duração: 114, classificação: "Livre", sinopse: "", avaliação: 5, detalhes: "http://www.imdb.com/title/tt0317705"),
                Filme(id: 6, nome: "Trolls", direção: "Harvey S. Laidman", duração: 90, classificação: "Livre", sinopse: "Poppy, a otimista líder dos Trolls, e seu total oposto, Ramo, embarcam em uma aventura que os leva muito além do único mundo que eles conhecem.", avaliação: 3, detalhes: "http://www.imdb.com/title/tt1679335")
            ]
            
        )
    
    ]
    
    // Função de apoio, que retorna a lista com todos os filmes ordenados
    func todosFilmes() -> [Filme]{
        var todos:[Filme] = []
        
        for categoria in app.filmes{
            todos.append(contentsOf: categoria.lista)
        }
        return todos
    }
    
    
    
}
