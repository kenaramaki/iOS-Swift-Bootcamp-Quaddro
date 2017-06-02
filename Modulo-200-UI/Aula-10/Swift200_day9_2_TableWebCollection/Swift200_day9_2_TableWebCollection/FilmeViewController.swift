//
//  FilmeViewController.swift
//

import UIKit

class FilmeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tabela: UITableView!
    
    // A lista de posters preenche essa varável na tela anterior
    var preSelecionado:Filme?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if preSelecionado != nil {
            
            // se eu for precisar
            self.tabela.alpha = 0.0
        }
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if let pre = preSelecionado{
            
            // Qual indexPath?
            // Encontrar o section, row para selecionar
            var indexPath:IndexPath?
            
            for(section, categoria) in app.filmes.enumerated(){
                for (row, filme) in categoria.lista.enumerated(){
                    if filme.id == pre.id {
                        indexPath = IndexPath(row: row, section: section)
                    }
                }
            }
            
            // tabela -> scroll até o indexPath
            if let i = indexPath{
                tabela.scrollToRow(at: i, at: .top, animated: false)
            }
            
            // Limpar o pré-selecionado
            preSelecionado = nil
            
            // voltar a exibir a imagem
            // animando a opacidade
            UIView.animate(withDuration: 0.2, animations: {
                self.tabela.alpha = 1.0
            })
            
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabela.estimatedRowHeight = 44
        tabela.rowHeight = UITableViewAutomaticDimension
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return app.filmes.count
    }
    
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return app.filmes[section].lista.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt
        indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: "celulaDoFilme") else{
            fatalError("Problema no carregamento da célula da tabela")
        }
        
        guard let celulaFilme = cell as? FilmeTableViewCell else {
            fatalError("Algo deu errado!")
        }
        
        // Recupera o gênero daquela seção e sua lista de filmes
        let genero = app.filmes[indexPath.section]
        let filmesDoGenero = genero.lista
        
        // Dentro da lista de filmes, pega  da linha
        let esseFilme = filmesDoGenero[indexPath.row]
        
        // Preencher a célula
        celulaFilme.atualizar(paraFilme: esseFilme)
        
        return cell
        
    }
    
    // Método para criar os separadores entre as seções da tabela
    // Retorna uma UIView
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        // Vamos utilizar como header um UILabel
        // Configurando o visual pelo código
        let meuHeader = UILabel()
        meuHeader.backgroundColor = UIColor.black.withAlphaComponent(0.8)
        meuHeader.textAlignment = .center
        meuHeader.textColor = UIColor.white
        meuHeader.font = UIFont.boldSystemFont(ofSize: 9)
        
        // Recuperamos o nome do genero
        // e colocamos em caixa alta
        let genero =  app.filmes[section].genero.uppercased()
        meuHeader.text = genero
        
        return meuHeader
        
    }
    
    // Altura do separador de seções
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20
    }
    
    // Toque em uma das células leva para tela de detalhes
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // Primeiro recupero o filme desta seção e linha
        let filme = app.filmes[indexPath.section].lista[indexPath.row]
        
        // Criar uma tela utilizando o arquivo de interface do mesmo nome
        let detalhes        = DetalhesViewController(nibName: "DetalhesViewController", bundle: nil)
        detalhes.endereço   = filme.detalhes
        detalhes.title      = filme.nome
        
        
        // Empilha a tela na navigation controller
        self.navigationController?.pushViewController(detalhes, animated: true)
        
    }
    
}
