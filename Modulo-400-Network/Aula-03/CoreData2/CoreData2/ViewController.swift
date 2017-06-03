//
//  ViewController.swift
//  CoreData2
//
//  Created by Árthur Ken Aramaki Mota on 22/04/17.
//  Copyright © 2017 Árthur Ken Aramaki Mota. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    // MARK: - Propriedades
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
        
            let nome = self.textFieldNome.text!
            let idade = self.textFieldIdade.text!.intValue
            
            //
            
            let aluno = Aluno(context: context)
            aluno.nome = nome
            aluno.idade = Int16(idade)
            
            // 
            
            do {
                
                try self.context.save()
                
                //
                
                self.textFieldNome.text = nil
                self.textFieldIdade.text = nil
                
            }catch{
                
                print("Erro catch")
            
            }
        
        }
        
    }
    
    @IBAction func resgatar(_ sender: UIButton) {
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Aluno")
        
        do {
            
            let resultado = try self.context.fetch(fetchRequest)
            
            let alunos = resultado as! [Aluno]
            
            for aluno in alunos {
                
                print("Nome: \(aluno.nome!)\nIdade: \(aluno.idade)")
                
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
