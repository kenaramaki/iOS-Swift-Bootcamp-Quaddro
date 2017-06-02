//
//  TelaPrincipalViewController.swift
//  DesafioGravador
//
//  Created by Swift on 04/03/17.
//  Copyright © 2017 Ken Aramaki. All rights reserved.
//

import UIKit

class TelaPrincipalViewController: UITableViewController {

    // MARK: - Outlets
    
    // MARK: - Propriedades
    var arrayDadosGravacoes : [String] = []
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Métodos de UITableViewDelegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // Verificando se o indexPath.section corresponde a célula de exclusão
        
        if indexPath.section == 2 {
            
            // Caso seja realmente a section correspondente
            
            // Criamos o gerenciador de arquivos
            let gerenciadorDeArquivos = FileManager.default
            
            if  gerenciadorDeArquivos.fileExists(atPath: pathArquivo){
                
                // Caso tenha arquivos para serem apagados
                
                // Criamos um array a partir da nossa plist gravada
                self.arrayDadosGravacoes = NSArray(contentsOfFile: pathArquivo) as! [String]
                
                // Exibindo o actionSheet para ter certeza que o usuário realmente quer apagar
                let alertaApagar = UIAlertController(title: "Esta ação não pode ser revertida", message: "Deseja realmente apagar todos os dados?", preferredStyle: .actionSheet)
                let acaoCancel = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
                let acaoOK = UIAlertAction(title: "Sim, quero apagar", style: .destructive, handler: { (acao) in
                    
                    // Baseado em nosso array com as informaçãoes que criamos um FOR que percorra todo o array
                    
                    for dado in self.arrayDadosGravacoes {
                        
                        do {
                            
                            try FileManager.default.removeItem(atPath: (pathDocuments as NSString).appendingPathComponent(dado) + ".caf")
                            
                        }catch{}
                        
                    }
                    
                    // Em seguida apagamos o arquivo que armazena as informações (já que não temos mais gravações)
                    do {
                        
                        try FileManager.default.removeItem(atPath: pathArquivo)
                        
                    }catch{}
                    
                    // Mostramos um alerta avisando do sucesso da operação
                    let alertaSucesso = UIAlertController(title: "Sucesso", message: "Operação realizada com sucesso", preferredStyle: .alert)
                    let acaoSucessoOk = UIAlertAction(title: "OK", style: .default, handler: nil)
                    alertaSucesso.addAction(acaoSucessoOk)
                    self.present(alertaSucesso, animated: true, completion: nil)
                })
                
                alertaApagar.addAction(acaoOK)
                alertaApagar.addAction(acaoCancel)
                
                self.present(alertaApagar, animated: true, completion: nil)
                
            } else {
                // Caso não tenha arquivos para serem apagados
                print("Nada salvo")
                
                let alerta = UIAlertController(title: "Alerta", message: "Não há gravações para serem apagadas", preferredStyle: .alert)
                let acaoOk = UIAlertAction(title: "OK", style: .default, handler: nil)
                alerta.addAction(acaoOk)
                self.present(alerta, animated: true, completion: nil)
                
            }
            
            
            
            
            
        }
        
    }
    
    
    // MARK: - Métodos
    
    // MARK: - Actions
    
}
