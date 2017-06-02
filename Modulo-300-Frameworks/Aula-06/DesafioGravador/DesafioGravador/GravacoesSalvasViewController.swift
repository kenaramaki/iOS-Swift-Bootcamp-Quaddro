//
//  GravacoesSalvasViewController.swift
//  DesafioGravador
//
//  Created by Swift on 18/02/17.
//  Copyright © 2017 Ken Aramaki. All rights reserved.
//

import UIKit

class GravacoesSalvasViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    // MARK: - Outlets
    
    // MARK: - Propriedades
    
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Métodos Table View

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        cell.textLabel?.text = "Teste"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.performSegue(withIdentifier: "irParaDetalhesGravacao", sender: "OBJETO PASSADO PELA TELA ANTERIOR")
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if(segue.identifier == "irParaDetalhesGravacao"){
        
        
            let telaDetalhes = segue.destination as! DetalhesGravacaoViewController
            
            telaDetalhes.valorPassadoPelaOutraTela = sender as? String
            
        
        }
        
        
    }
    
    
}
