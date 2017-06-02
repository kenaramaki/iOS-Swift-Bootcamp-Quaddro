//
//  TabelaViewController.swift
//  DesafioXML_Felipe
//
//  Created by Swift on 11/02/17.
//  Copyright © 2017 Ken Aramaki. All rights reserved.
//

import UIKit

class TabelaViewController: UITableViewController, MeuParserDelegate {
    
    // MARK: - Propriedades
    var arrayResultado : Array<Dictionary<String, String>> = []
    

    override func viewDidLoad() {
        super.viewDidLoad()

        let parserzinho = MeuParser()
        parserzinho.delegate = self
        parserzinho.iniciarParse()
        
        // Registrando a Nib
        self.tableView.register(UINib(nibName:"CelulaBoladona", bundle: nil), forCellReuseIdentifier: "celulaBoladona")
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.arrayResultado.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "celulaBoladona", for: indexPath) as! CelulaBoladona

        
        //cell.textLabel?.text = self.arrayResultado[indexPath.row]["nome"]
        
        cell.labelEsquerda.text = self.arrayResultado[indexPath.row]["nome"]
        cell.labelDireita.text = self.arrayResultado[indexPath.row]["idade"]
        
        return cell
    }
    
    // MARK: - Métodos de MeuParserDelegate
    func meuParserFinalizouAInterpretacao(_ resultado: Array<Dictionary<String, String>>) {
        
        self.arrayResultado = resultado
        
        self.tableView.reloadData()
        
        
    }

}
