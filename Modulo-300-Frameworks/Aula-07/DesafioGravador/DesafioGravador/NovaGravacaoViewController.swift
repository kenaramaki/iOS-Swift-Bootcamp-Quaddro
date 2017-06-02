//
//  NovaGravacaoViewController.swift
//  DesafioGravador
//
//  Created by Swift on 04/03/17.
//  Copyright © 2017 Ken Aramaki. All rights reserved.
//

import UIKit
// Importando o AVFoundation
import AVFoundation

class NovaGravacaoViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var progressTempo: UIProgressView!
    
    // MARK: - Propriedades
    
    // Elemento que fará a gravação
    var meuGravador : AVAudioRecorder!
    
    // Criando o arrau que terá os nomes das gravações
    var arrayGravacoes : [String] = []
    
    
    //  Criando o nosso Timer 
    var timer : Timer!
    
    // Vaor do progresso
    var progresso = 0.0
    
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()


        print(pathDocuments)
        
        // Verificando se o arquivo existe
        if FileManager.default.fileExists(atPath: pathArquivo){
            
            // Caso exista um arquivo salvo, iniciamos nosso array com o mesmo
            self.arrayGravacoes = NSArray(contentsOfFile: pathArquivo) as! Array<String>
            
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // MARK: - Métodos
    
    // Método que atualiza o progressView (disparado pelo timer)
    func atualizaProgress() {
        
        self.progresso = self.progresso + 0.1
        self.progressTempo.setProgress(Float(self.progresso), animated: true)
        
        // 
        
        if self.progresso >= 1 {
            
            self.timer.invalidate()
            
            self.progresso = 0.0
            
            self.progressTempo.progress = 0.0
            
        }
        
    }
    
    
    
    // MARK: - ACtions
    @IBAction func iniciarGravacao(_ sender: UIButton) {
        
        // Quando o usuário inicia uma nova gravação mostramos um alertController para que seja definido o título da gravação
        
        // Criando o alerta
        let alertaComTexto : UIAlertController = UIAlertController(title: "Definição de Título", message: "Defina o título para sua gravação", preferredStyle: .alert)
        
        // Criando as actions
        let acaoOk = UIAlertAction(title: "OK", style: .default) { (acao) in
            
            print("Clicou OK")
            
            // Resgatando o texto escrito pelo usuário
            let textField = alertaComTexto.textFields![0]
            let textoDigitado = textField.text
            
            if textoDigitado!.isEmpty {
                // Caso o usuário não tenha preenchido
                
                self.present(alertaComTexto, animated: true, completion: nil)
                
            } else {
                // Caso o usuário tenah preenchido
                
                // Resgatando o que foi preenchido
                let nomeGravacao = textoDigitado
                
                // Definindo o path para o arquivo de áudio
                let pathGravacao = (pathDocuments as NSString).appendingPathComponent(textoDigitado!) + ".caf"
                
                // Criando um URL a partir do pathGravacao
                let URLAudio = URL(fileURLWithPath: pathGravacao)
                
                // Criando o dicionário de configutações
                let dicionarioConfiguracoes : Dictionary<String,AnyObject> = [AVEncoderAudioQualityKey : AVAudioQuality.min.rawValue as AnyObject, AVEncoderBitRateKey : 16 as AnyObject, AVNumberOfChannelsKey : 2 as AnyObject, AVSampleRateKey : 44100.0 as AnyObject]
                
                
                // Iniciando o gravador de audio
                self.meuGravador = try? AVAudioRecorder(url: URLAudio, settings: dicionarioConfiguracoes) // TODO; Verificar casting [String : AnyObject]
                
                // Audio session
                let audioSession = AVAudioSession.sharedInstance()
                
                do {
                    
                    try audioSession.setCategory(AVAudioSessionCategoryPlayAndRecord)
                    
                }catch{}
                
                do {
                    
                    try audioSession.setActive(true)
                    
                }catch{}
                
                // Preparando para gravar
                self.meuGravador.prepareToRecord()
                // Efetuando a gravação
                self.meuGravador.record(forDuration: 10.0)
                // Salvando o novo objeto no array
                self.arrayGravacoes += [nomeGravacao!]
                
                // Gravando a plist
                let arrayParaSalvar = self.arrayGravacoes as NSArray
                arrayParaSalvar.write(toFile: pathArquivo, atomically: true)
                
                // Zerando o progressView
                self.progressTempo.progress = 0.0
                
                //
                self.timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(NovaGravacaoViewController.atualizaProgress), userInfo: nil, repeats: true)
                
                // TODO: VERIFICAR A NECESSIDADE DO MÉTODO "FIRE"
                
                
            }
            
            
            
        }
        
        let acaoCancelar = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
        
        // Adicionando a textField
        alertaComTexto.addTextField { (textField) in
            
            textField.placeholder = "Qual o título desejado"
            
        }
        
        // Adicionando as actions
        alertaComTexto.addAction(acaoOk)
        alertaComTexto.addAction(acaoCancelar)
        
        // Exibindo o alerta
        self.present(alertaComTexto, animated: true, completion: nil)
        
        
    }
    
    
    @IBAction func pararGravacao(_ sender: UIButton) {
        
        // Verificando se o gravador está instanciado
        if let _ = self.meuGravador{
            
            // Caso esteja 
         
            // Verificamos se o mesmo está gravando
            if self.meuGravador.isRecording {
                
                // Caso esteja 
                
                // Paramos o gravador
                self.meuGravador.stop()
                
                // Paramos o timer 
                self.timer.invalidate()
                
                // Tiramos o timer da memória
                self.timer = nil
                
            }
            
        }
        
    }
    
}
