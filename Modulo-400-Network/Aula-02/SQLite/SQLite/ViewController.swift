//
//  ViewController.swift
//  SQLite
//
//  Created by Árthur Ken Aramaki Mota on 08/04/17.
//  Copyright © 2017 Árthur Ken Aramaki Mota. All rights reserved.
//

import UIKit

// \o/

// Importação da biblioteica

/*
 
 1 -  Adicionar a library ao projeto
 
 2 - Criar um arquivo de header -> cmd + n / Aba iOS / Source / Header File
 
 3 - Dentro do arquivo realizar o import da  maneira feita em ObjC -> #import<sqlite3.h>
 
 4 - Ir na aba "Build Settings" / Selecionar a opção "All" para que todas as opções sejam mostradas e pesquisar por "Objective-C Bridging Header"
 
 5 - Após encontrar o campo setar o valor como "nomeDaPastaLocal/nomeDoArquivoDeHeader.h", em nosso caso SQLite/Header.h
 
 6 - Após estes processos serem finalizados testar se os comandos da lib já estão disponíveis, como por exemplo "sqlite_open"
 
 */

// Criando o path
//---------------------

var caminhoParaSandBox = NSHomeDirectory()
var pathDocuments = (caminhoParaSandBox as NSString).appendingPathComponent("Documents")
var pathArquivo = (pathDocuments as NSString).appendingPathComponent("arquivo.sqlite")

//---------------------

class ViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var textFieldNome: UITextField!
    @IBOutlet weak var textFieldIdade: UITextField!
    
    // MARK: - Propriedades
    var dataBase : OpaquePointer? = nil
    
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        print(pathDocuments)
        
        // Verificando se o arquivo existe
        if FileManager.default.fileExists(atPath: pathArquivo) {
            
            // Caso o banco exista
            
            // Abrimos o banco
            
            // Sempre que tem "pp" colcoar o "&" antes
            if sqlite3_open(pathArquivo, &dataBase) == SQLITE_OK {
                // Caso o banco tenha sido aberto
                print("Banco aberto com sucesso")
                
            } else {
                // Caso o banco não tenha sido aberto
                print("Erro ao abrir o banco")
                
            }
            
            
        } else {
            
            // Caso o banco não exista
            
            // OBS: usamos o mesmo comando para criar ou abrir o banco
            
            if sqlite3_open(pathArquivo, &dataBase) == SQLITE_OK {
                
                // Caso o banco tenha sido criado
                
                print("Banco criado com sucesso")
                // Montamos as tabelas
                
                let comando = "create table if not exists ALUNOS (id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, nome TEXT, idade INTEGER)"
              
                // Função que executa um comando sqlite sem retorno do banco
                
                if sqlite3_exec(dataBase, comando, nil, nil, nil) == SQLITE_OK {
                    
                    print("Chupa sociedade! Tabela criada com sucesso")
                    
                } else {
                    
                    print("Erro na criação da tabela \(sqlite3_errmsg(dataBase))")
                    
                }
                
                
            } else {
                
                // Caso tenha dado erro no momento da criação
                print("Erro na criação o banco")
                
            }
            
            
        }
        
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override var canBecomeFirstResponder: Bool {
        
        return true
        
    }
    
    
    
    // MARK: - Métodos
    
    // MARK: - Actions
    @IBAction func cadastrar(_ sender: UIButton) {
        
        // Se usuário digitou
        if !(self.textFieldNome.text!.isEmpty || self.textFieldIdade.text!.isEmpty) {
            
            // Resgatamos os valores preenchidos
            let nome = self.textFieldNome.text!
            let idade = self.textFieldIdade.text!.intValue
            
            // Criamos a query para inserir os dados em nosso banco de dados
            
            let query = "insert into ALUNOS values(NULL, '\(nome)', \(idade))"
            
            // Executando o comando no banco
            if sqlite3_exec(dataBase, query, nil, nil, nil) == SQLITE_OK {
                
                // Caso o registro tenha sido inserido
                
                print("Chupa sociedade: Registro inserido com sucesso")
                
                self.textFieldNome.text = nil
                self.textFieldIdade.text = nil
                //
                self.becomeFirstResponder()
                
                
            } else {
                // Caso tenha ocorrido algum problema
                
                print("Erro ao inserir o registro: \(sqlite3_errmsg(dataBase))")
                
            }
            
            
            
        } else {
            
            print("Não preencheu os campos")
            
        }
        
    }
    
    @IBAction func resgatar(_ sender: UIButton) {
        
        // Criando o comando para resgatar os dados
        let query = "select * from ALUNOS"
        
        // Variável que armazenará o valor gerado pelo select
        var resultado : OpaquePointer? = nil
        
        // Função que executaum comando com retorno no banco
        if sqlite3_prepare_v2(dataBase, query, -1, &resultado, nil) == SQLITE_OK {
            
            // Laço para percorrer todos os registros do stmt
            
            while sqlite3_step(resultado) == SQLITE_ROW {
                
                // Resgatando o ID
                let codigo = sqlite3_column_int(resultado, 0)
                
                let resultadoNome = sqlite3_column_text(resultado, 1)
                let nome = String(cString: resultadoNome!)
                
                let idade = sqlite3_column_int(resultado, 2)
                
                print("Nome: \(nome)\nID: \(codigo)\nIdade: \(idade)")
                
            }
            
            // Tira o stmt de memória
            sqlite3_finalize(resultado)
            
            
        } else {
            
            print("Erro no resgate: \(sqlite3_errmsg(dataBase))")
            
        }
        
        
        
    }
    
    
}

extension String {
    
    var intValue : Int {
        
        let conversao = self as NSString
        
        return Int(conversao.intValue)
        
    }
    
}

