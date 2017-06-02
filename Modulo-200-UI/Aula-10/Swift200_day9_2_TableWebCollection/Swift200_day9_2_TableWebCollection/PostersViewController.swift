//
//  PostersViewController.swift
//  Swift200_day9_2_TableWebCollection
//
//  Created by Swift on 12/11/16.
//  Copyright © 2016 Luiz Gustavo Lino. All rights reserved.
//

import UIKit

class PostersViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    // Quantas seções vou ter na minha coleção
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    // Quantidade de itens = quantidade de filmes, um poster de cada
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return app.todosFilmes().count
    }
 
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "poster", for: indexPath)
        
        // OI?!
        (cell as? PosterCollectionViewCell)?.imagem.image = app.todosFilmes()[indexPath.row].poster
        
        return cell
        
    }
    
    // Selecionei uym poster da collection
    // pede para executar a segue
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "mostraLista", sender: collectionView)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let coleção = sender as? UICollectionView,
              let destino = segue.destination as? FilmeViewController,
              let itemSelecionado = coleção.indexPathsForSelectedItems?.first else {
                return
        }
        
        // Buscamos o filme do item selecionado e
        // repassamos para o item certo
        let filme = app.todosFilmes()[itemSelecionado.row]
        destino.preSelecionado = filme
        
    }
    
    
    
}
