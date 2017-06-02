//
//  ViewController.swift
//  Visualizador
//
//  Created by Swift on 21/01/17.
//  Copyright © 2017 Eduardi. All rights reserved.
//

import UIKit

import QuickLook


// Adotando os protocolos e QLPreviewControllerDataSource e QLPreviewCOntrollerDeledate

class ViewController: UIViewController, QLPreviewControllerDelegate, QLPreviewControllerDataSource {

    // MARK: Outlets
    
    @IBOutlet weak var imageViewUnica: UIImageView!
    // MARK: Propriedades
    
    var arrayNomesFotos :[String] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        popupaArray()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    // MARK: Métodos
    
    private func popupaArray(){
        
        for i in 1...20 {
            
            let nomeFoto = "IMG_\(i)"
            
            self.arrayNomesFotos += [nomeFoto]
            
        }
            print([self.arrayNomesFotos])
            
        }
        
        
    
    // MARK: Actions
    
    @IBAction func escolher(_ sender: Any) {
   
     let quickLook = QLPreviewController()
        
      quickLook.dataSource = self
      quickLook.delegate = self
        
        
        
       // self.present(quickLook, animetade: true, completion: nil)
    
        self.present(quickLook, animated: true, completion: nil)
    }
    
// MARK: Métodos QLPreviewControllerDataSource
    
    func numberOfPreviewItems (in controller: QLPreviewController) -> Int{
        
        return self.arrayNomesFotos.count
        
    }
    
    
    func previewController(_ controller: QLPreviewController, previewItemAt index: Int) -> QLPreviewItem {
        
            // Criando o nome do arquivo baseado no objeto do nosso array que contém os nomes, e o indice donosso metodo
        
            let nomeFoto = self.arrayNomesFotos[index]
        
            // criando o caminho até o arquivo
            let raizApp = Bundle.main
        
            //criando o caminho ate o arquivo específico
        
            let pathArquivo = raizApp.path(forResource: nomeFoto, ofType: "JPG" )
        
            // Convertendo o caminho(que esta em string) em uma URL
        
            let urlArquivo = URL(fileURLWithPath: pathArquivo!)
            
            return urlArquivo as QLPreviewItem
        
    }
    
    

    
    
    
    // MARK: Métodos QLPreviewControllerDelegate
    
    func previewControllerDidDismiss(_ controller: QLPreviewController) {
        
        //resgastando indice de seleção
        let indice = controller.currentPreviewItemIndex
        
        // criando nome de arquivo baseado no indice e em nosso array
        let nomeImagem = self.arrayNomesFotos[indice]
        
        //criando nome completo de nossa imagem
        let nomeCompleto = nomeImagem + ".JPG"
        
        //exibindo em tela
        
        self.imageViewUnica.image = UIImage(named: nomeCompleto)
        
        
    }
    
    
    
}

