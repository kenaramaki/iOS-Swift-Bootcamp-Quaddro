//
//  ListaGravacoesViewController.swift
//  DesafioGravador
//
//  Created by Swift on 04/03/17.
//  Copyright © 2017 Ken Aramaki. All rights reserved.
//

import UIKit

class ListaGravacoesViewController: UITableViewController {

    // MARK: - Outlets
 
    // MARK: - Propriedades
    
    var arrayListaGravacoes : [String] = []
    
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if FileManager.default.fileExists(atPath: pathArquivo) {
            
            // Caso exista
            self.arrayListaGravacoes = NSArray(contentsOfFile: pathArquivo) as! [String]
            
            
            
        } else {
            
            // Caso não exista
            
            // Criamos um alerta 
            let alerta = UIAlertController(title: "Alerta", message: "Não há gravações", preferredStyle: .alert)
            let acaoOk = UIAlertAction(title: "OK", style: .default, handler: nil)
            alerta.addAction(acaoOk)
            self.present(alerta, animated: true, completion: nil)
            
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrayListaGravacoes.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "celula", for: indexPath)

        // Configure the cell...
        cell.textLabel?.text = self.arrayListaGravacoes[indexPath.row]

        return cell
    }
    
    
    
    // MARK: - Table View Delegate
    
    // Método que é disparado quando o usuário clica em uma célula
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // Resgatando o nome
        let nomeGravacao = self.arrayListaGravacoes[indexPath.row]
        
        // Executamos o segue passando o nome da gravação pelo sender
        self.performSegue(withIdentifier: "segueTelaReproducao", sender: nomeGravacao)
        
        
        
    }
    
    
    
    // MARK: - Métodos
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "segueTelaReproducao"{
            
            let telaDestino = segue.destination as! ReproducaoViewController
            
            telaDestino.nomeEscolhido = sender as? String
            
        }
        
    }
    
    
    
    // MARK: - Actions
    
}
