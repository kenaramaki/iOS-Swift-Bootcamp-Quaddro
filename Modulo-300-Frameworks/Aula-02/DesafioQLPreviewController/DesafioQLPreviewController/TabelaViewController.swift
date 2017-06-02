//
//  TabelaViewController.swift
//  DesafioQLPreviewController
//
//  Created by Swift on 21/01/17.
//  Copyright © 2017 Swift. All rights reserved.
//

import UIKit
import QuickLook

class TabelaViewController: UITableViewController, QLPreviewControllerDelegate, QLPreviewControllerDataSource {
    
    var arrayNomesPDFs = ["5_Conselhos", "Identdade da Sua Empresa", "Marketing Digital"]

    override func viewDidLoad() {
        super.viewDidLoad()

      
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
        return self.arrayNomesPDFs.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let cell = tableView.dequeueReusableCell(withIdentifier: "celula", for: indexPath)

        // Configure the cell...
        
        cell.textLabel?.text = self.arrayNomesPDFs[indexPath.row]

        return cell
    }
    
    
    // MARK: Métodos de UITableViewDelegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
     let quickLook = QLPreviewController()
        
        
        quickLook.delegate = self
        quickLook.dataSource = self
        
     self.navigationController?.pushViewController(quickLook, animated: true)
        
    }
    
    
    // MARK: Métodos QLPreviewControllerDataSource
    
    
    func numberOfPreviewItems(in controller: QLPreviewController) -> Int {
        
        
        return 1
        
        
    }
    
    
    func previewController(_ controller: QLPreviewController, previewItemAt index: Int) -> QLPreviewItem {
        
        
        let nomeArquivo = self.arrayNomesPDFs[self.tableView.indexPathForSelectedRow!.row]
        
        let pathArquivo = Bundle.main.path(forResource: nomeArquivo, ofType: "pdf")
        
        let urlArquivo = URL(fileURLWithPath: pathArquivo!)
        
        return urlArquivo as QLPreviewItem
        
        
        
    }
    

   
}
