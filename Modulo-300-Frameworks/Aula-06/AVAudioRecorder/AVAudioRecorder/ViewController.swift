//
//  ViewController.swift
//  AVAudioRecorder
//
//  Created by Swift on 18/02/17.
//  Copyright © 2017 Ken Aramaki. All rights reserved.
//

import UIKit
// Importando o framework AVFoundation
import AVFoundation

class ViewController: UIViewController {

    // MARK: - Outlets
    
    // MARK: - Propriedades
    
    // Criando nosso gravador de áudio
    var meuPlayer : AVAudioPlayer!
    var gravador : AVAudioRecorder!
    
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print(pathDocuments)
        print(pathArquivo)
    
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    // MARK: - Métodos
    
    // MARK: - Actions

    @IBAction func gravar(_ sender: UIButton) {
        
        // Criando uma URL a partir do nosso pathArquivo
        let urlAudio = URL(fileURLWithPath: pathArquivo)
        
        /* A gravação de áudio requer um dicionário de configuração
         
         Qualidade, número de canais, bit rate, sample rate
         
         */
        
        let dicionarioConfiguracoes : Dictionary<String, AnyObject> = [AVEncoderAudioQualityKey : AVAudioQuality.min.rawValue as AnyObject, AVEncoderBitRateKey : 16 as AnyObject, AVNumberOfChannelsKey : 2 as AnyObject, AVSampleRateKey : 44100.0 as AnyObject]
        
        do {
            
            try self.gravador = AVAudioRecorder(url: urlAudio, settings: dicionarioConfiguracoes)
            
        } catch {}
        
        // Criando a Audio Session
        let audioSession = AVAudioSession.sharedInstance()
        
        //
        
        do {
            
          try audioSession.setCategory(AVAudioSessionCategoryPlayAndRecord)
            
        } catch {}
        
        do {
            
            try audioSession.setActive(true)
            
        }catch{}
        
        // Preparando para gravar 
        self.gravador.prepareToRecord()
        
        // Efetuando a gravação
        self.gravador.record()
        
        
    }
 
    @IBAction func pararGravacao(_ sender: UIButton) {
        
        // Verificando se ele está instanciado
        if let _ = self.gravador {
            // Caso esteja
            
            // Verificando se o gravador está gravando
            if self.gravador.isRecording {
                // Caso o mesmo esteja gravando
                
                // Paramos a gravação
                self.gravador.stop()
                
            }
            
        }
    }

    @IBAction func reproduzir(_ sender: UIButton) {
        
        // Verificando se o arquivo existe
        if FileManager.default.fileExists(atPath: pathArquivo){
            // Caso o arquivo exista
            
            // Verificando se o usuário ainda não está efetuando uma gravação
            
            // Verificando se o gravador está instanciado
            if let _ = self.gravador {
                
                // Verificando se ele está gravando
                if self.gravador.isRecording {
                    
                    // Caso ele esteja gravando paramos a gravação antes de reproduzir
                    self.gravador.stop()
                    
                }

            }

            let urlAudio = URL(fileURLWithPath: pathArquivo)
            
            // Iniciando o nosso player baseado na URL
            do {
                
                try self.meuPlayer = AVAudioPlayer(contentsOf: urlAudio)
                
            } catch{}
            
            // Resgatando a instância compartilhada da nossa session de áudio
            
            let audioSession = AVAudioSession.sharedInstance()
            
            // Setando a categoria da nossa session de audio
            
            do {
                
                try audioSession.setCategory(AVAudioSessionCategoryPlayAndRecord)
                
            }catch{}
            
            // Ativando a session de audio
            
            do {
            
                try audioSession.setActive(true)
                
            }catch{}
            
            // Preparando para executar o áudio
            self.meuPlayer.prepareToPlay()
            
            // Executando o áudio
            self.meuPlayer.play()
            
            
        } else {
            // Caso o arquivo não exista
            
            let alerta = UIAlertController(title: "Alerta! Audio não existente", message: "Mermão, não encontrei nenhum áudio para se reproduzir. Por favor, grave algo primeiro", preferredStyle: .alert)
            
            let acaoOK = UIAlertAction(title: "OK", style: .default, handler: nil)
            
            alerta.addAction(acaoOK)
            
            self.present(alerta, animated: true, completion: nil)
            
        }
    
    }
    
    @IBAction func pararReproducao(_ sender: UIButton) {
        
        // Verificando se ele está instanciado
        if let _ = self.meuPlayer {
            // Caso ele esteja isntanciado
            
            // Verificando se está em reprodução
            if self.meuPlayer.isPlaying {
                
                // Caso ele esteja
                
                // Paramos a execução
                self.meuPlayer.stop()
                
            }
            
        }
    
    }
    
}

