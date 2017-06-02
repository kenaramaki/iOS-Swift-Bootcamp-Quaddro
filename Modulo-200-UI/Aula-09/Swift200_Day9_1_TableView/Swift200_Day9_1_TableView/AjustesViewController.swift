//
//  AjustesViewController.swift
//  Swift200_Day9_1_TableView
//
//  Created by Swift on 05/11/16.
//  Copyright © 2016 Swift. All rights reserved.
//

import UIKit

class AjustesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tabela: UITableView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.barStyle = .default
        atualizaSeleção()
    }
    
    // Número de seções na minha tabela
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    // Quantas linhas vou ter para cada seção
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch section {
            // Para cidades, numero de linhas = numero de cidades
            case 0: return App.compartilhado.dados.count
            // Para graus, uma linha (row) só
            default: return 1
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section {
       
        case 0:
            // Vamos pedir para tableview buscar uma célula que tenha um prototype
            // configurado com o identificador de reuso CellCidade
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "CellCidade") else {
                fatalError("Célula não encontrada!")
            }
            
            // Analisamos a chamada para ver de qual linha estamos falando (indexPath vem de parametro)
            let linha = indexPath.row
            
            // Configura o texto para cidade correta
            cell.textLabel?.text = App.compartilhado.dados[linha].nome
            return cell
            
        case 1:
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "CellGraus") else {
                fatalError("Célula de graus não encontrada")
            }
            
            cell.textLabel?.text = "Exibir em Celsius?"
            
            // Botãozinho liga / desliga
            let meuSwitch = UISwitch()
            // Versão manual de uma IBAction
            // essa classe, esse método, quando isso acontecer
            meuSwitch.addTarget(self, action: #selector(trocaGrausCelsius), for: .valueChanged)
            
            // Precisamos configurar com o valor já definido
            meuSwitch.isOn = App.compartilhado.usarCelsius
            
            // Acessoyr view, fica à direita da cell
            cell.accessoryView = meuSwitch
            
            return cell
            
        default: fatalError("Não existe essa seção!")
        }
        
    }
    
    // Função que o switch chama quando trocamos seu valor
    func trocaGrausCelsius(sender:UISwitch) {
        App.compartilhado.usarCelsius = sender.isOn
    }

    // Configurando o title das seções
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section{
            case 0: return "Cidades favoritas"
            case 1: return "Ajustes de métrica"
            default: fatalError("Ops! Que section é essa?")
        }
    }
    
    // MARK: Seleção da cidade
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tabela.cellForRow(at: indexPath) {
            
            // Adicionando a marca de seleção na direita ✔︎
            cell.accessoryType = .checkmark
            
            // Avisamos o app que a cidade favorita mudou!
            App.compartilhado.favoritarCidade(comNome: cell.textLabel?.text ?? "")
        }
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        // Similar à seleção, pego a celula em questão
        // e remove a view da direita
        if let cell = tabela.cellForRow(at: indexPath) {
            cell.accessoryType = .none
        }
    }
    
    // Evitar desmarcar a cell quando dá um tap em celsius
    // que seleciona uma cidade inválida, que dá um crash
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        
        if indexPath.section == 0 {
            return indexPath
        } else {
            return nil
        }
    }
    
    // Essa função vê qual a cidade atualmente selecionada
    // e marca na tabela
    func atualizaSeleção() {
        
        var linhaFavorita = 0
        
        for (i, cidade) in App.compartilhado.dados.enumerated() {
            if cidade.nome == App.compartilhado.dadosDaFavorita().nome {
                linhaFavorita = i
                break
            }
        }
        
        // Sabendo a linha da cidade favorita, slecionamos esta linha
        // e atualizamos a interace para mostrar o check mark
        let indexPath = IndexPath(row: linhaFavorita, section: 0)
        tabela.selectRow(at: indexPath, animated: false, scrollPosition: .none)
        tabela.cellForRow(at: indexPath)?.accessoryType = .checkmark
        
    }
    
    // MARK: Métodos de edição
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        return [
            
            UITableViewRowAction(style: .destructive, title: "Remover", handler: { (action, indexPath) in
                
                // Quando selecionar esse 'remover', vamos capturar a cell
                // e remover a cidade com este nome
                let cell = self.tabela.cellForRow(at: indexPath)
                App.compartilhado.removeCidade(comNome: cell?.textLabel?.text ?? "")
                
                // Depois pedimos para a tableview remover essa linha
                // e atualizamos a seleção na interface
                self.tabela.deleteRows(at: [indexPath], with: .fade)
                self.atualizaSeleção()
                
            })
        ]
    }
    
    // atualiza a seleção após terminar de editar a célula
    func tableView(_ tableView: UITableView, didEndEditingRowAt indexPath: IndexPath?) {
        atualizaSeleção()
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        
        if indexPath.section != 0 {
            return false // Não pode quando está fora da seção de cidades
        } else if tabela.cellForRow(at: indexPath)?.accessoryType == .checkmark{
            return false // não pode quando é a linha selecionada
        } else {
            return true // Tudo bem, é uma cidade
        }
    }
    
}
