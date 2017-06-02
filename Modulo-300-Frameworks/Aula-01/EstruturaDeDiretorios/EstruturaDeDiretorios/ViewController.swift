//
//  ViewController.swift
//  EstruturaDeDiretorios
//
//  Created by Swift on 14/01/17.
//  Copyright © 2017 Ken Aramaki. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    /*
     
     Sandbox
     
     O sistema de arquivos em iOS é convencionado de forma que aplicativos tenham execuções independentes, para manter este sistema simples o usuário do dispositivo não tem acesso direto a este sistema de arquivos.
     
     Interações de um App iOS com o sistema de arquivos são limitadas principalmente para os diretórios dentro do aplicativo. Durante a instalação de um novo aplicativo o instalador cria uma série de recipientes (containers) para o mesmo, cada container tem uma função específica.
     
     Bundle Container - Recursos iniciais 
     
     Cloud Container - Recursos do iCloud
     
     Data Container
                    - tmp: Recursos temporários
     
                    - Library: Recursos da aplicação
     
                    - Documents: Recursos de compartilhamento com o usuário
     
    */

    //============================================
    
    // Antes de acessar qualquer diretório é necessário conhecer a localização. O primeiro passo é acessar a pasta raíz da aplicação e a partir dela podemos acessar suas subpastas.
    
    
    // Acessando a pasta raíz
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let caminhoParaSandbox = NSHomeDirectory()
        //print("Caminho: \(caminhoParaSandbox)")
        
        /*
        
         cmd + shift + g -> Para acessar uma pasta através do caminho
         
        */
    
        
        // Criando o caminho até o diretório documents
        let caminhoParaPastaDocuments = (caminhoParaSandbox as NSString).appendingPathComponent("Documents")
        print("Documents: \(caminhoParaPastaDocuments)")
        
        
        /*
        
         Além de usar a estrutura padronizada, você precisará em diversas situações, remover, renomear, criar ou efetuar outras ações em arquivos ou diretórios.
         
         O Objeto responsável pelas interaçoes é o (NS)FileManager. Ele permite examinar o conteúdo de um elemento do sistema e realizar as respectivas alterações.
         
        */
        
        
        // Criando um objeto de FileManager
        
        let gerenciadorDeArquivos = FileManager.default
        
        // ============================ Criando subdiretórios dentro do diretório Documents ============================
        
        
        let home = NSHomeDirectory()
        let pathDocuments = (home as NSString).appendingPathComponent("Documents")
        let pathSubdiretorio = (pathDocuments as NSString).appendingPathComponent("Subdiretorio")
        
        print("Subdiretório: \(pathSubdiretorio)")
        
        
        do{
            
            try gerenciadorDeArquivos.createDirectory(atPath: pathSubdiretorio, withIntermediateDirectories: false, attributes: nil)
            
        }catch{}
        
        
        // ======================== Verificando a existência de um arquivo ==============================
        
        if gerenciadorDeArquivos.fileExists(atPath: pathSubdiretorio){
            
            print("Arquivo existe")
        
        }else{
            
            print("Arquivo não existe")
            
        }
        
        
        // ======================== Apagando arquivos ou diretórios ============================
        
        
        do{
            
            try gerenciadorDeArquivos.removeItem(atPath: pathSubdiretorio)
        
        }catch{}
        
        
        // ======================= Movendo arquivos ou diretórios ==========================
                // Criando dois novos diretórios
        let pathSubdiretorio2 = (pathDocuments as NSString).appendingPathComponent("Subdiretorio2")
        
        do{
            
            try gerenciadorDeArquivos.createDirectory(atPath: pathSubdiretorio2, withIntermediateDirectories: false, attributes: nil)
            
        }catch{}
        
        
        
        let pathSubdiretorio3 = (pathDocuments as NSString).appendingPathComponent("Subdiretorio3")
        
        do {
            
            try gerenciadorDeArquivos.createDirectory(atPath: pathSubdiretorio3, withIntermediateDirectories: false, attributes: nil)
            
        }catch {}
        
        
        // Movendo os diretórios
        
        do{
            
            try gerenciadorDeArquivos.moveItem(atPath: pathSubdiretorio3, toPath: (pathSubdiretorio2 as NSString).appendingPathComponent("Subdiretorio3"))
            
        }catch{}
        
        
        // =========================== Copiando arquivos ou diretórios ====================
        
        let pathSubdiretorioParaSerCopiado = (pathDocuments as NSString).appendingPathComponent("SubdiretorioParaSerCopiado")
        
        do {
            
            try gerenciadorDeArquivos.createDirectory(atPath: pathSubdiretorioParaSerCopiado, withIntermediateDirectories: false, attributes: nil)
            
        }catch{}
        
        
        //
        
        do {
            
            try gerenciadorDeArquivos.copyItem(atPath: pathSubdiretorioParaSerCopiado, toPath: (pathDocuments as NSString).appendingPathComponent("SubdiretorioQueFoiCopiado"))
            
        }catch{}
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

