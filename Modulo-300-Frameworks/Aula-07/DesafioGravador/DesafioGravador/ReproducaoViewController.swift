//
//  ReproducaoViewController.swift
//  DesafioGravador
//
//  Created by Swift on 04/03/17.
//  Copyright © 2017 Ken Aramaki. All rights reserved.
//

import UIKit
// Importando o franework
import AVFoundation

class ReproducaoViewController: UIViewController {
    
    // MARK: - Outlets
    
    // MARK: - Propriedades
    var meuPlayer : AVAudioPlayer!
    var nomeEscolhido : String?
    
    
    // MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //print(nomeEscolhido)

    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    // MARK: - Métodos
    
    
    
    // MARK: - Actions
    @IBAction func reproduzir(_ sender: UIButton) {
   
        // Criando a URL a partir dos dados resgatados
        let URLAudio = URL(fileURLWithPath: (pathDocuments as NSString).appendingPathComponent(nomeEscolhido! + ".caf"))
        
        // Iniciando o nosso player
        self.meuPlayer = try? AVAudioPlayer(contentsOf: URLAudio)
        
        // Criando a Audio Session
        let audioSession = AVAudioSession.sharedInstance()
        
        do {
            
            try audioSession.setCategory(AVAudioSessionCategoryPlayback)
            
        }catch{}
        
        
        do {
            
            try audioSession.setActive(true)
            
        }catch{}
    
        // 
        self.meuPlayer.prepareToPlay()
        self.meuPlayer.play()
        
    }
    
    @IBAction func parar(_ sender: UIButton) {
   
        if let _ = self.meuPlayer {
            
            if self.meuPlayer.isPlaying {
                
                self.meuPlayer.stop()
                
            }
            
        }
        
    }
    
    
    
}
