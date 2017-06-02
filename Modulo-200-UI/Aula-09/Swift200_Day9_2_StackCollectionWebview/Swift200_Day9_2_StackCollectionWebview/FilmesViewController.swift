//
//  FilmesViewController.swift
//  Swift200_Day9_2_StackCollectionWebview
//
//  Created by Swift on 05/11/16.
//  Copyright © 2016 Swift. All rights reserved.
//

import UIKit

class FilmesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tabela: UITableView!
    
    // Implementando delegates do tableview
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Tabela tem que utilizar tamanho que as constraints resolverem
        tabela.rowHeight = UITableViewAutomaticDimension
        
        // Precisa de uma estimativa de tamanho
        // para a tabela desenhar o scroll
        tabela.estimatedRowHeight = 181
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return app.filmes.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return app.filmes[section].lista.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Aventura"
        case 1:
            return "Animação"
        default:
            fatalError("Título não encontrado")
        }
        
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let header = UILabel()
        header.text = app.filmes[section].genero.uppercased()
        header.font = UIFont.boldSystemFont(ofSize: 9)
        header.textColor = UIColor.white
        header.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        header.textAlignment = .center
        
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    
    // View for header in section
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tabela.dequeueReusableCell(withIdentifier: "CelulaDoFilme") as? FilmeCell else{
            fatalError("Não encontrei a celula")
        }
        
        cell.atualizar(paraFilme: app.filmes[indexPath.section].lista[indexPath.row])
        
        return cell
        
    }

}
