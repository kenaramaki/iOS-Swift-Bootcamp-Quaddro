//
//  ViewController.swift
//  Visualizador
//
//  Created by Swift on 21/01/17.
//  Copyright © 2017 Swift. All rights reserved.
//

import UIKit
// Importando o framework
import QuickLook



// Adotando os protocolos e QLPreviewControllerDataSource e QLPreviewControllerDelegate
class ViewController: UIViewController, QLPreviewControllerDelegate, QLPreviewControllerDataSource {
    
    // MARK: Outlets
    
    @IBOutlet weak var imageViewUnica: UIImageView!
    
    // MARK: Propriedades
    
    var arrayNomesFotos : [String] = []

    // MARK: View life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.popupaArray()
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
        
        print(self.arrayNomesFotos)
        
    }
    
    
    // MARK: Actions

    @IBAction func escolher(_ sender: UIButton) {
        
        let quickLook = QLPreviewController()
        
        // Atribuindo os datasource e delegate
        quickLook.dataSource = self
        quickLook.delegate = self
        
        self.present(quickLook, animated: true, completion: nil)
        
        
    }
    
    // MARK: Métodos de QLPreviewControllerDataSource
    
    func numberOfPreviewItems(in controller: QLPreviewController) -> Int {
        
        
        return self.arrayNomesFotos.count
        
        
    }
    
    
    func previewController(_ controller: QLPreviewController, previewItemAt index: Int) -> QLPreviewItem {
        
        // Criando o nome do arquivo baseado no objeto do nosso array que contém os nomes, e o índice do nosso método.
        
        let nomeFoto = self.arrayNomesFotos[index]
        
        // Criando o caminho até a raiz
        let raizApp = Bundle.main
        
        // Criando o caminho até o arquivo específico
        let pathArquivo = raizApp.path(forResource: nomeFoto, ofType: "JPG")
        
        // Convertendo o caminho (que está em string) em uma URL
        
        let urlArquivo = URL(fileURLWithPath: pathArquivo!)
        
        // Retornando a URL que contém o endereço
        return urlArquivo as QLPreviewItem
        
        
        
    }
    
    
    // MARK: Métodos de QLPreviewControllerDelegate
    
    
    func previewControllerWillDismiss(_ controller: QLPreviewController) {
        
     // Regatando o índice da selação
        let indice = controller.currentPreviewItemIndex
        
        // Criando o nome do arquivo baseado no índice e em nosso array
        let nomeImagem = self.arrayNomesFotos[indice]
        
        
        // Criando o nome completo da nossa imagem
        let nomeCompleto = nomeImagem + ".JPG"

        
        // Exibindo em tela
        
        self.imageViewUnica.image = UIImage(named: nomeCompleto)
        
        
        
    }

}



