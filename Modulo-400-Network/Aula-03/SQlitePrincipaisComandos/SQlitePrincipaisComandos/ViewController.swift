//
//  ViewController.swift
//  SQlitePrincipaisComandos
//
//  Created by Árthur Ken Aramaki Mota on 22/04/17.
//  Copyright © 2017 Árthur Ken Aramaki Mota. All rights reserved.
//

import UIKit

//
let caminhoSandBox = NSHomeDirectory()
let pathDocuments = (caminhoSandBox as NSString).appendingPathComponent("Documents")
let pathArquivo = (pathDocuments as NSString).appendingPathComponent("arquivo.sqlite")
//

var dataBase : OpaquePointer? = nil

class ViewController: UIViewController {
    
    // MARK: - Propriedade
    
    // MARK: - Outlets
    
    // MARK: - View Life Cycle
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(pathDocuments)

        // Verificando se o arquivo existe
        if FileManager.default.fileExists(atPath: pathArquivo){
            // Caso exista
            
            // Tentando abrir o bnaco
            if sqlite3_open(pathArquivo, &dataBase) == SQLITE_OK{
                // Caso o banco seja aberto
                
                print("Banco aberto com sucesso")

                
                
                
            } else {
                // Caso o banco não seja aberto
                print("Erro ao abrir o banco")
            }
            
            
        } else {
            // Caso não exista
            
            // Criamos o banco
            
            if sqlite3_open(pathArquivo, &dataBase) == SQLITE_OK {
                // Caso o banco tenha sido criado
                print("Banco criado com sucesso")
                
                // Caso o banco seja criado, colocamos nele nossa tabela
                let comando = "create table if not exists ALUNOS (id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, nome TEXT, idade INTEGER)"
                
                // Criando a tabela
                if sqlite3_exec(dataBase, comando, nil, nil, nil) == SQLITE_OK{
                    // Caso a tabela tenha sido criada com sucesso
                    
                    print("Tabela criada com sucesso")
                    
                    
                } else {
                    // Caso teha dado erro ao criar a tabela
                    print("Erro ao criar a table: \(sqlite3_errmsg(dataBase))")
                }
                
            } else {
                // Caso tenha ocorrido algum problema
                print("Erro ao criar o banco")
            }
            
        }
    
    }

    // MARK: - Métodos
    
    func inserirRegistroNoBanco(comNome nome : String, eIdade idade : Int) {
        
        let queryInsercao = "INSERT INTO ALUNOS VALUES (NULL, '\(nome)', \(idade))"
        
        if sqlite3_exec(dataBase, queryInsercao, nil, nil, nil) ==  SQLITE_OK{
            
            print("Registro inserido com sucesso")
            
        } else {
            
            print("Erro ao inserir registro")
            
        }
        
    }
    
    // MARK: - Actions
    @IBAction func selectTudo(_ sender: UIButton) {
        
        let query = "select * from ALUNOS"
        
        var resultado : OpaquePointer? = nil
        
        // Função que executa uma ação com retorno
        
        if sqlite3_prepare_v2(dataBase, query, -1, &resultado, nil) == SQLITE_OK{
            
            // Laço que executaremos para cada retorno
            while sqlite3_step(resultado) == SQLITE_ROW {
                
                // Resgatando os valores 
                let codigo = sqlite3_column_int(resultado, 0)
                
                let resultadoNome = sqlite3_column_text(resultado, 1)
                let nome = String(cString: resultadoNome!)
                
                let idade = sqlite3_column_int(resultado, 2)
                
                print("Nome: \(nome)\nID: \(codigo)\nIdade: \(idade)")
                
            }
            
            // Tirando o statement de memória
            sqlite3_finalize(resultado)
            
            
        } else {
            
            print("Erro na função prepare_v2")
            
        }
    }
    
    @IBAction func selectWhere(_ sender: UIButton) {
    
        let query = "select * from ALUNOS WHERE idade = 26"
        
        var resultado : OpaquePointer? = nil
        
        // Função que executa uma ação com retorno
        
        if sqlite3_prepare_v2(dataBase, query, -1, &resultado, nil) == SQLITE_OK{
            
            // Laço que executaremos para cada retorno
            while sqlite3_step(resultado) == SQLITE_ROW {
                
                // Resgatando os valores
                let codigo = sqlite3_column_int(resultado, 0)
                
                let resultadoNome = sqlite3_column_text(resultado, 1)
                let nome = String(cString: resultadoNome!)
                
                let idade = sqlite3_column_int(resultado, 2)
                
                print("Nome: \(nome)\nID: \(codigo)\nIdade: \(idade)")
                
            }
            
            // Tirando o statement de memória
            sqlite3_finalize(resultado)
            
            
        } else {
            
            print("Erro na função prepare_v2")
            
        }
    
        
    }
    
    @IBAction func selectWehereLike(_ sender: UIButton) {
    
        let query = "select * from ALUNOS WHERE nome LIKE 'K%'"
        
        var resultado : OpaquePointer? = nil
        
        // Função que executa uma ação com retorno
        
        if sqlite3_prepare_v2(dataBase, query, -1, &resultado, nil) == SQLITE_OK{
            
            // Laço que executaremos para cada retorno
            while sqlite3_step(resultado) == SQLITE_ROW {
                
                // Resgatando os valores
                let codigo = sqlite3_column_int(resultado, 0)
                
                let resultadoNome = sqlite3_column_text(resultado, 1)
                let nome = String(cString: resultadoNome!)
                
                let idade = sqlite3_column_int(resultado, 2)
                
                print("Nome: \(nome)\nID: \(codigo)\nIdade: \(idade)")
                
            }
            
            // Tirando o statement de memória
            sqlite3_finalize(resultado)
            
            
        } else {
            
            print("Erro na função prepare_v2")
            
        }
        
        
    }
    
    @IBAction func updateRegistro(_ sender: UIButton) {
    
        // Além de inserir novos registros podemos também alterar registros em nosso banco de dados com o comando UPDATE
        
        // Criando nossa query
        let query = "UPDATE ALUNOS SET nome = 'Quem' WHERE id = 2"
        
        if sqlite3_exec(dataBase, query, nil, nil, nil) == SQLITE_OK {
            
            print("Update feito com sucesso")
            
        } else {
            
            print("Erro no update")
            
        }
    
    }

    @IBAction func deleteRegistro(_ sender: UIButton) {
    
        // Criando nossa query
        let query = "DELETE FROM ALUNOS WHERE id = 4"
        
        if sqlite3_exec(dataBase, query, nil, nil, nil) == SQLITE_OK {
            
            print("Registro deletado com sucesso")
            
        } else {
            
            print("Erro ao deletar")
            
        }
        
        
    }
    
}

