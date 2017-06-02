//
//  ViewController.swift
//  AVAudioPlayer
//
//  Created by Swift on 11/02/17.
//  Copyright © 2017 Ken Aramaki. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    
    // MARK: - Outlets
    @IBOutlet weak var labelRate: UILabel!
    
    // MARK: - Propriedades
    var meuPlayer : AVAudioPlayer!
    
    
    // MARK: - View Life Cycle
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.setup()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: - Métodos
    func setup(){
        
        self.labelRate.text = ""
        
        // Criando o caminho para resgate do arquivo
        let pathArquivo = Bundle.main.path(forResource: "opera", ofType: "m4a")
        
        // Transformando o path em URL
        let urlAudio = URL(fileURLWithPath: pathArquivo!)
        
        // Iniciando o nosso audio player
        self.meuPlayer = try? AVAudioPlayer(contentsOf: urlAudio)
        
        // Propriedade que define o número de vezes que o áudio irá correr
        self.meuPlayer.numberOfLoops = 2
        
        
    }
    
    
    
    // MARK: - Actions

    @IBAction func tocar(_ sender: UIButton) {
        
        
        // ---
        
        let audioSession = AVAudioSession.sharedInstance()
        
        do {
            
            try audioSession.setCategory(AVAudioSessionCategoryPlayback)
            
        }catch{}
        
        //
        
        do{
            
            try audioSession.setActive(true)
            
        }catch{}
        
        
        // ---
        
            // Método que prepara o hardware
        self.meuPlayer.prepareToPlay()
        
        //
        self.meuPlayer.enableRate = true
        
        
        //
        
            // Dando o play
        self.meuPlayer.play()
        
        
        
    }
    
    @IBAction func parar(_ sender: UIButton) {
        
        if let _ = self.meuPlayer{
            
            if self.meuPlayer.isPlaying {
                
                self.meuPlayer.stop()
                
            }
            
        }
        
        
    }
    
    @IBAction func alterarRate(_ sender: UISlider) {
        
        if let _ = self.meuPlayer {
            
            self.meuPlayer.rate = sender.value * 4.0
            
            self.labelRate.text = String(format: "Rate: %.2f", sender.value * 4.0)
            
        }
        
        
    }
    
    
}

