//
//  ViewController.swift
//  CoreData1
//
//  Created by Árthur Ken Aramaki Mota on 22/04/17.
//  Copyright © 2017 Árthur Ken Aramaki Mota. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    // MARK: - Propriedades
    
    // Cara que gerencia os objetos do Core Data
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    
    // MARK: - Outlets
    @IBOutlet weak var textFieldNome: UITextField!
    @IBOutlet weak var textFieldIdade: UITextField!
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    
    // MARK: - Métodos

    // MARK: - Actions
    @IBAction func cadastrar(_ sender: UIButton) {
        
        if !(self.textFieldIdade.text!.isEmpty || self.textFieldNome.text!.isEmpty) {
            
            // Resgatando os valores
            let nome = self.textFieldNome.text!
            let idade = self.textFieldIdade.text!.intValue
            
            
            // Intanciando o objeto do Core Data
            let objetoCD = NSEntityDescription.insertNewObject(forEntityName: "Aluno", into: context)
            
            
            // Inserindo os valores
            objetoCD.setValue(nome, forKey: "nome")
            objetoCD.setValue(idade, forKey: "idade")
            
            
            // Salvando
            
            do {
                
                try self.context.save()
                
                //
                
                print("Registro inserido com sucesso")
                
                // Limpando as textFields
                self.textFieldNome.text = nil
                self.textFieldIdade.text = nil
                
            } catch {}
            
        }
        
    }
    
    @IBAction func resgatar(_ sender: UIButton) {
    
        // Requisição de busca
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Aluno")

        do {
            
            let alunos = try self.context.fetch(fetchRequest)
            
            
            for aluno in alunos {
            
                let nome = (aluno as AnyObject).value(forKey: "nome") as! String
                let idade = ((aluno as AnyObject).value(forKey: "idade") as AnyObject).int32Value
                
                
                // Exibindo os valores
                print("Nome: \(nome)\nIdade: \(idade!)")
                
                
            }
            
        }catch{}
        
        
    
        
    
    }

}

extension String {
    
    var intValue : Int {
        
        let conversao = self as NSString
        
        return Int(conversao.intValue)
    }
    
}
