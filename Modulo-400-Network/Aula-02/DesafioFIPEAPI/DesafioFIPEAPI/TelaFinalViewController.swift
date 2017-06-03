//
//  TelaFinalViewController.swift
//  DesafioFIPEAPI
//
//  Created by Árthur Ken Aramaki Mota on 08/04/17.
//  Copyright © 2017 Árthur Ken Aramaki Mota. All rights reserved.
//

import UIKit

class TelaFinalViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var labelAno: UILabel!
    @IBOutlet weak var labelMarca: UILabel!
    @IBOutlet weak var labelVeiculo: UILabel!
    @IBOutlet weak var labelCombustivel: UILabel!
    @IBOutlet weak var labelValor: UILabel!
    
    // MARK: - Propriedades

    
    // MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        print(idVeiculoEspecifico)
        fazerRequisicao()
        
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // MARK: - Métodos
    
    func fazerRequisicao() {
        
        let url = URL(string: "http://fipeapi.appspot.com/api/1/carros/veiculo/\(idMarcaEscolhida)/\(idVeiculoEscolhido)/\(idVeiculoEspecifico).json")!
        
        let sessao = URLSession(configuration: URLSessionConfiguration.default)
        
        let tarefa : URLSessionDataTask = sessao.dataTask(with: url) { (data, response, error) in
            
            if error == nil {
                
                
                if let dataTemp = data {
                
                    var dicionario : [String : AnyObject] = [:]
                    
                    do {
                        
                        dicionario = try JSONSerialization.jsonObject(with: dataTemp, options: JSONSerialization.ReadingOptions.allowFragments) as! [String : AnyObject]
                        
                        print(dicionario)
                        
                        DispatchQueue.main.async {
                            
                            self.labelValor.text        = dicionario["preco"] as? String
                            self.labelAno.text          = dicionario["ano_modelo"] as? String
                            self.labelCombustivel.text  = dicionario["combustivel"] as? String
                            self.labelMarca.text        = dicionario["marca"] as? String
                            self.labelVeiculo.text      = dicionario["veiculo"] as? String

                        }
                        
                    }catch {}
                    
                } else {
                    
                    // TODO: Tratativa erro data nula
                    
                }
                
                
            } else {
                
                // TODO: Tratativa erro request
                
            }
            
            
        }
        
        tarefa.resume()
        
    }
    
    // MARK: - Actions
    
    
}
