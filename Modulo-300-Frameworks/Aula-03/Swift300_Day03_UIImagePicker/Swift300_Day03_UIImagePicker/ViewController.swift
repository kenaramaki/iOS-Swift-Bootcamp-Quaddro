//
//  ViewController.swift
//  Swift300_Day03_UIImagePicker
//
//  Created by Swift on 28/01/17.
//  Copyright © 2017 Ken Aramaki. All rights reserved.
//

import UIKit




// Adotando protoclo UIImagePickerControllerDelegate
class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    // MARK: - Outlets
    
    @IBOutlet weak var imageViewAlbum: UIImageView!
    @IBOutlet weak var imageViewDocuments: UIImageView!
    
    
    // MARK: - Propriedades
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(pathDocuments)

    }

    
    // MARK: - Métodos
    
    // MARK: - Actions
    @IBAction func abrirAlbum(_ sender: UIButton) {
        
        // Iniciando uma instância de imagePickerController
        let imagePicker = UIImagePickerController()
        
        // Atribuindo o delegate
        imagePicker.delegate = self
     
        // Verificando se o sourceType está disponível
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.photoLibrary) {
            
            // Caso o sourceType esteja disponível
            
            // Atribuindo o source type
            imagePicker.sourceType = UIImagePickerControllerSourceType.photoLibrary
            
            // Apresentando o picker em tela
            self.present(imagePicker, animated: true, completion: nil)
            
            
        }else{
            
            // Caso o sourceType não esteja disponível
            
            let alerta = UIAlertController(title: "Alerta", message: "O Photo Library não está disponível, por isso não será possível exibí-lo", preferredStyle: .alert)
            
            let acaoOk = UIAlertAction(title: "Ok", style: .default, handler: nil)
            
            alerta.addAction(acaoOk)
            
            self.present(alerta, animated: true, completion: nil)
            
        }
        
        
    }
    
    @IBAction func abrirCamera(_ sender: UIButton) {
     
        let imagePicker = UIImagePickerController()
        
        imagePicker.delegate = self
        
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera){
            
            // Setando o sourceType 
            imagePicker.sourceType = UIImagePickerControllerSourceType.camera
            
            self.present(imagePicker, animated: true, completion: nil)
            
            
        }else{
            
            let alerta = UIAlertController(title: "Alerta", message: "A camera não está disponível, por isso, não será possível acessá-la", preferredStyle: .alert)
            
            let acaoOk = UIAlertAction(title: "Ok", style: .default, handler: nil)
            
            alerta.addAction(acaoOk)
            
            self.present(alerta, animated: true, completion: nil)
            
        }
        
        
        
    }
    
    @IBAction func salvarAlbum(_ sender: UIButton) {
        
        if let imagem = self.imageViewAlbum.image {
            
            UIImageWriteToSavedPhotosAlbum(imagem, nil, nil, nil)
            
        }
        
        
    }
    
    @IBAction func salvarDocuments(_ sender: UIButton) {
     
        if let imagem = self.imageViewAlbum.image{
            
            let imagemData = UIImagePNGRepresentation(imagem)
            
            if let dataTemp = imagemData {
                
                try? dataTemp.write(to: URL(fileURLWithPath: pathArquivo))
                
            }
            
            
        }
        
    }
    
    @IBAction func recuperarImagemSalva(_ sender: UIButton) {
     
        let imagem = UIImage(contentsOfFile: pathArquivo)
        
        self.imageViewDocuments.image = imagem
        
        
    }
    
    
    // MARK: - Métodos de UIImagePickerControllerDelegate
    
    // Método que é disparado quando o usuário cancela a seleção
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        
        print("Cancelou!!!")
        picker.dismiss(animated: true, completion: nil)
        
    }
    
    // Método que é disparado quando o usuário faz uma seleção no picker
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {

        
        /*
        
        // Resgatando a imagem selecionada pelo usuário
        let imagemEscolhida = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        // Atribuindo a nossa imageView
        self.imageViewAlbum.image = imagemEscolhida
        
        */
        
        
        // Fazendo a tratativa completa
        if let objetoEscolhido = info[UIImagePickerControllerOriginalImage] {
            
            if let imagemEscolhida = objetoEscolhido as? UIImage{
                
                self.imageViewAlbum.image = imagemEscolhida
                
            }
            
        }
        
        picker.dismiss(animated: true, completion: nil)
        
        print("Selecionou")
        
    }
    
    
}

