//
//  ViewController.swift
//  SwiftDesafioImagePicker
//
//  Created by Swift on 28/01/17.
//  Copyright © 2017 Ken Aramaki. All rights reserved.
//

import UIKit
import QuickLook

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, QLPreviewControllerDelegate, QLPreviewControllerDataSource, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    var arrayElementos = ["reaper"]
    
    
    // MARK: - Outlet
    @IBOutlet weak var table: UITableView!
    
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    // MARK: - Métodos TableView
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayElementos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        cell.textLabel?.text = self.arrayElementos[indexPath.row]
        
        return cell
    }
  
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let quickLook = QLPreviewController()
        
        quickLook.delegate = self
        quickLook.dataSource = self
        
        self.navigationController?.pushViewController(quickLook, animated: true)
        
    }
    

    // MARK: - Métodos QuickLook
    
    func numberOfPreviewItems(in controller: QLPreviewController) -> Int {
        return 1
    }
    
    func previewController(_ controller: QLPreviewController, previewItemAt index: Int) -> QLPreviewItem {
        
        let nomeArquivo = self.arrayElementos[(self.table.indexPathForSelectedRow!.row)]
        
        let pathArquivo = Bundle.main.path(forResource: nomeArquivo, ofType: "jpg")
        
        let urlArquivo = URL(fileURLWithPath: pathArquivo!)
        
        return urlArquivo as QLPreviewItem
    }
    
    
    // TODO
    // MARK: - Métodos do UIImagePickerControllerDelegate
    
    // Método disparado quando usuário cancela a seleção
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        
        print("Cancelou")
        picker.dismiss(animated: true, completion: nil)
        
    }
    
    // FIX IT!!!
    
    // Método que é disparado quando o usuário faz uma seleção no picker
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        if let objetoEscolhido = info[UIImagePickerControllerOriginalImage]{
            
            if let imagemEscolhida = objetoEscolhido as? UIImage{
                
                arrayElementos.append(String(describing: imagemEscolhida))
                
            }
            
        }
        
        picker.dismiss(animated: true, completion: nil)
        table.reloadData()
        
        print("Selecionou")
        
    }
    
    
    
    // MARK: - Actions
    
    // Action que abre o álbum de fotos
    @IBAction func abrirAlbum(_ sender: UIBarButtonItem) {
        
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.photoLibrary) {
            
            imagePicker.sourceType = UIImagePickerControllerSourceType.photoLibrary
            self.present(imagePicker, animated: true, completion: nil)
            
        }else{
            
            let alerta = UIAlertController(title: "Alerta", message: "O Photo Library não está disponível", preferredStyle: .alert)
            
            let açãoOk = UIAlertAction(title: "OK", style: .default, handler: nil)
            
            alerta.addAction(açãoOk)
            
            self.present(alerta, animated: true, completion: nil)
            
        }
        
        
    }
    
    // Action que acessa a câmera
    @IBAction func abrirCamera(_ sender: UIBarButtonItem) {
        
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera){
            
            imagePicker.sourceType = UIImagePickerControllerSourceType.camera
            self.present(imagePicker, animated: true, completion: nil)
            
        }else{
            
            let alerta = UIAlertController(title: "Alerta", message: "A câmera não está acessível", preferredStyle: .alert)
            
            let açãoOk = UIAlertAction(title: "OK", style: .default, handler: nil)
            
            alerta.addAction(açãoOk)
            
            self.present(alerta, animated: true, completion: nil)
            
        }
        
    }
    
    
    
}

