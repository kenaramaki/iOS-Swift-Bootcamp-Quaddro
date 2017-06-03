//
//  ViewController.swift
//  DesafioFIPEAPI
//
//  Created by Árthur Ken Aramaki Mota on 08/04/17.
//  Copyright © 2017 Árthur Ken Aramaki Mota. All rights reserved.
//


import UIKit

var idMarcaEscolhida = ""
var idVeiculoEscolhido = ""
var idVeiculoEspecifico = ""

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // MARK: Outlets
    
    @IBOutlet weak var tabela: UITableView!
    
    // MARK: Propriedades
    
    var arrayElementos : [[String:AnyObject]] = []
    
    // MARK: View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.setup()
        
        self.fazerRequisicao()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Métodos
    
    func setup(){
        
        self.tabela.delegate = self
        self.tabela.dataSource = self
    }
    
    
    func fazerRequisicao(){
        
        // Criando a URL
        let url = URL(string: "http://fipeapi.appspot.com/api/1/carros/marcas.json")!
        
        let sessao = URLSession(configuration: URLSessionConfiguration.default)
        
        let tarefa : URLSessionDataTask = sessao.dataTask(with: url) { (data, response, error) in
            
            // Verificando se deu erro
            if error == nil {
                // Caso não tenha dado
                
                if let dataTemp = data {
                    
                    
                    do {
                        
                        
                        self.arrayElementos = try JSONSerialization.jsonObject(with: dataTemp, options: JSONSerialization.ReadingOptions.allowFragments) as! [[String : AnyObject]]
                        
                        
                        print(self.arrayElementos)
                        
                        // !!!!
                        DispatchQueue.main.async {
                            
                            self.tabela.reloadData()
                            
                        }

                        
                    } catch {}
                    
                } else {
                    
                    self.criaAlerta(titulo: "Erro!", mensagem: "Xiii Data nula")
                    
                }
                
                
            } else {
                // Caso tenha dado
                self.criaAlerta(titulo: "Erro!", mensagem: "Xiii erro na requisição!")
                
            }
            
        }
        
        tarefa.resume()
    
    }
    
    func criaAlerta(titulo : String, mensagem: String) {
        
        let alerta = UIAlertController(title: titulo, message: mensagem, preferredStyle: UIAlertControllerStyle.alert)
        
        let acaoOk = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        alerta.addAction(acaoOk)
        
        self.present(alerta, animated: true, completion: nil)
        
    }
    
    
    // MARK: Actions
    
    // MARK: Métodos de UITableViewDatasource
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return  self.arrayElementos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "celula", for: indexPath)
        
        //
        
        if let valor = self.arrayElementos[indexPath.row]["fipe_name"]{
            
            cell.textLabel?.text = "\(valor)"
            
        }
        
        
        //
        
        return cell
        
    }
    
    
    
    // MARK: Métodos de UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        idMarcaEscolhida = "\(self.arrayElementos[indexPath.row]["id"]!)"
        self.performSegue(withIdentifier: "segueTelaVeiculos", sender: nil)
        
    }
    
    
}

