//
//  ViewController.swift
//  DesafioGravador
//
//  Created by Swift on 18/02/17.
//  Copyright © 2017 Ken Aramaki. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // MARK: - Outlets
    @IBOutlet weak var tabela: UITableView!
    
    // MARK: - Propriedades
    let tituloDasSecoes = ["Novas Gravações", "Consultas", "Exclusões"]
    let tituloCelulas = ["Criar uma nova gravação", "Gravações Salvas", "Excluir todas as gravações"]
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

    print(caminhoParaSandbox)
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Actions
    
    // MARK: - Métodos
 
    // MARK: - Métodos TableView
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 1
        
    }
    
    
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) 
        
        switch indexPath.section {
        case 0:
            cell.textLabel?.text = tituloCelulas[0]
        case 1:
            cell.textLabel?.text = tituloCelulas[1]
        case 2:
            cell.textLabel?.text = tituloCelulas[2]
        default:
            cell.textLabel?.text = "cell"
        }
        
        return cell
    }
    
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        
        return tituloDasSecoes.count
        
    }
    
    public func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        switch section {
        case 0:
            return tituloDasSecoes[0]
        case 1:
            return tituloDasSecoes[1]
        case 2:
            return tituloDasSecoes[2]
        default:
            return "title"
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        switch indexPath.section {
        case 0:
            self.performSegue(withIdentifier: "irParaNovaGravacao", sender: nil)
        case 1:
            self.performSegue(withIdentifier: "irParaGravacoesSalvas", sender: nil)
        default:
            break
        }
        
        /*
        if indexPath.section == 0 {
            
            self.performSegue(withIdentifier: "tela2", sender: nil)
            
        }
        */
    }


}

