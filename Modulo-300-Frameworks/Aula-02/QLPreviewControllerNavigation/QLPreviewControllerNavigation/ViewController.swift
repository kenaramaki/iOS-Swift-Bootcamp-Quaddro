//
//  ViewController.swift
//  QLPreviewControllerNavigation
//
//  Created by Swift on 21/01/17.
//  Copyright © 2017 Swift. All rights reserved.
//

import UIKit
// Importando o FrameWork
import QuickLook

class ViewController: UIViewController, QLPreviewControllerDataSource, QLPreviewControllerDelegate {
    
    
    // MARK: - Outlets
    
    // MARK: - Propriedades
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    // MARK: - Métodos
    
    // MARK: - Actions

    @IBAction func mostarArquivo(_ sender: UIButton) {
        
        
        // Criando o nosso visualizador
        let quickLook = QLPreviewController()
        
        
        quickLook.delegate = self
        quickLook.dataSource = self
        
        self.navigationController?.pushViewController(quickLook, animated: true)
        
    }
    
    // MARK: - Métodos de QLPreviewControllerDataSource
    
    func numberOfPreviewItems(in controller: QLPreviewController) -> Int {
        
        
        return 1
        
        
    }
    
    func previewController(_ controller: QLPreviewController, previewItemAt index: Int) -> QLPreviewItem {
        
        
        // Criando o nome do arquivo
        let nome = "5_Conselhos"
        
        // Criando a referência para o Bundle
        let raizApp = Bundle.main
        
        // Criando o caminho até o nosso arquivo
        let pathArquivo = raizApp.path(forResource: nome, ofType: "pdf")
        
        // Convertendo o objeto em uma URL
        let urlArquivo = URL(fileURLWithPath: pathArquivo!)
        
        // Retornando 
        return urlArquivo as QLPreviewItem

        
    }
    
    // MARK: - Métodos de QLPreviewControllerDelegate
    
    
    func previewControllerWillDismiss(_ controller: QLPreviewController) {
             
        
        
        print("Saiu")
    }
    
}

