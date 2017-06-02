//
//  ViewController.swift
//  Swift200_Day6_1_AutolayoutPickerToolbar
//
//  Created by Swift on 15/10/16.
//  Copyright © 2016 Swift. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var nivelUm: UIImageView!
    @IBOutlet weak var nivelDois: UIImageView!
    @IBOutlet weak var nivelTres: UIImageView!
    
    // Implementamos o método que recebe do picker o aviso de que um item foi selecionado
    // Ele nos diz a coluna(component) e linha(row)
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        // Verificamos qual imagem vamos mudar (1,2 ou 3)
        // inspecionando a coluna que foi alterada
        switch component {
            // Escolha a imagem certa, criando o nome a partir da linha selecionada
            case 0:
                nivelUm.image = UIImage(named: "l1_\(row)")
            case 1:
                nivelDois.image = UIImage(named: "l2_\(row)")
            case 2:
                nivelTres.image = UIImage(named: "l3_\(row)")
            default: break
        }
        
    }
    
    
    
    // Criamos a lista de opões como variável do objeto
    // de modo que possamos utilizá-la para responder ao picker
    let opcoes = [
        ["Francês","Ciabatta","Sírio"], // opcoes[0], três itens
        ["Frango","H.200g"], // opcoes[1], dois itens
        ["Cheddar","Prato","Salada"] // opcoes[2], três itens
    ]
    
    @IBAction func tapFrango(_ sender: AnyObject) {
        // Pão francês, frango, salada
        selecionarCombinação(pão: 0, carne: 0, extra: 2)
    }
    
    @IBAction func tapDiet(_ sender: AnyObject) {
        // Ciabatta, frango, prato
        selecionarCombinação(pão: 1, carne: 0, extra: 1)
    }
    
    @IBAction func tapSalada(_ sender: AnyObject) {
        // Pão sírio, carne, salada
        selecionarCombinação(pão: 2, carne: 1, extra: 2)
    }
    
    @IBAction func tapCarne(_ sender: AnyObject) {
        // Pão ciabatta, hamburger e cheddar
        selecionarCombinação(pão: 1, carne: 1, extra: 0)
    }
    
    
    @IBOutlet weak var meuPicker: UIPickerView!
    
    
    func selecionarCombinação(pão:Int, carne:Int, extra:Int){
        
        // Chamamos o picker, selecionando via código cada uma das três colunas
        meuPicker.selectRow(pão, inComponent: 0, animated: true)
        meuPicker.selectRow(carne, inComponent: 1, animated: true)
        meuPicker.selectRow(extra, inComponent: 2, animated: true)
        
        // Avisamos nossa classe que o picker mudou de posição
        // de modo que a imagem troque
        pickerView(meuPicker, didSelectRow: pão, inComponent: 0)
        pickerView(meuPicker, didSelectRow: carne, inComponent: 1)
        pickerView(meuPicker, didSelectRow: extra, inComponent: 2)
        
    }
    
    
    // Implementando o Datasource do Picker View
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return opcoes.count // componentesd = meu número de opções
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return opcoes[component].count // Quantos itens tem nessa lista?
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return opcoes[component][row]
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        criarBarraDeTitulo(comVFL: false)
        
    }
    
    // Mudando a barra de status para texto na cor branc
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    
    // VFL (Visual Format Language)
    func criarBarraDeTitulo(comVFL usoVFL:Bool){
        
        // Vamos criar uma view com fundo preto para usar de barra de titulo
        let fundo = UIView()
        fundo.backgroundColor = UIColor.black
        
        // Vamos avisar o UIKit que não quereremos as constraints que vem de fábrica
        // Vamos criar as nossas
        fundo.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(fundo)
        
        // A mesma coisa para o título
        let titulo              = UILabel()
        titulo.textColor        = UIColor.white
        titulo.text             = "Hamburgeria"
        // weight = bold
        titulo.font             = UIFont.systemFont(ofSize: 20, weight: 2.0)
        titulo.textAlignment    = .center
        
        titulo.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(titulo)
        
        // Se não estiver usando Visual Format Language
        if !usoVFL {
            
            // Vamos criar um vetor para colocar todas as nossas constraints,
            // de modo que elas possam ser ativadas todas ao mesmo tempo
            var limitadores:[NSLayoutConstraint] = []
            
            limitadores.append(contentsOf: [
                
                // Adicionando espaço na esquerda com zero
                NSLayoutConstraint(item: fundo, attribute: .leading, relatedBy: .equal, toItem: self.view, attribute: .leading, multiplier: 1.0, constant: 0.0),
                
                // Adicionando espaço no topo com zero
                NSLayoutConstraint(item: fundo, attribute: .top, relatedBy: .equal, toItem: self.view, attribute: .top, multiplier: 1.0, constant: 0.0),
                
                // Adicionando espaço a direita com zero
                NSLayoutConstraint(item: fundo, attribute: .trailing, relatedBy: .equal, toItem: self.view, attribute: .trailing, multiplier: 1.0, constant: 0.0),
                
                // Definindo a altura da barra como 64 pontos
                NSLayoutConstraint(item: fundo, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 64),
                
                // Alinhando o titulo no centro horizontal
                NSLayoutConstraint(item: titulo, attribute: .centerX, relatedBy: .equal, toItem: fundo, attribute: .centerX, multiplier: 1.0, constant: 0.0),
                
                // Alinhando o titulo no centro vertical + 10
                NSLayoutConstraint(item: titulo, attribute: .centerY, relatedBy: .equal, toItem: fundo, attribute: .centerY, multiplier: 1.0, constant: 10)
                
            ])
            
            NSLayoutConstraint.activate(limitadores)
            
        } else {

            // Criamos um mapa dizendo para a ferramenta qual view tem cada nome
            let views = ["fundo" : fundo, "titulo" : titulo]
            var limitadores:[NSLayoutConstraint] = []
            
            for regra in [
                "H:|-0-[fundo]-0-|", // horizontalmente, sem margens e grudado na lateral
                "V:|-0-[fundo(==64)]", // grudado no topo, 64 de altura
                "H:|-10-[titulo]-10-|", // horizontalmente, 10 pt de margem
                "V:|-20-[titulo(==44)]" // Titulo, margem 20 pt no topo, altura de 44
                ] {
                    
                    limitadores.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: regra, options: NSLayoutFormatOptions(), metrics: nil, views: views))
            
            }
            
            NSLayoutConstraint.activate(limitadores)
            
        }
        
    }


}

