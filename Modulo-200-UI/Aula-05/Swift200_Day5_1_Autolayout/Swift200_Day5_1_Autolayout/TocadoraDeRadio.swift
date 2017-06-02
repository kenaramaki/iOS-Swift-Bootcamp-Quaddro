//
//  TocadoraDeRadio.swift
//  Swift200_Day5_1_Autolayout
//
//  Created by Swift on 08/10/16.
//  Copyright © 2016 Quaddro. All rights reserved.
//

import Foundation
import AVFoundation // Audio e Video
import MediaPlayer

class TocadoraDeRadio {
    
    enum Estilo {
        case Rock, Pop, Ecletica, Eletronica
    }
    
    // Objeto do sistema que vai tocar nossas radios
    var player:AVPlayer?
    
    func mudarDeEstação (novoEstilo: Estilo){
        
        let endereçoNaInterwebs:String
        
        // Buscamos o endereço na internet da radio
        switch novoEstilo {
        case .Rock:
            endereçoNaInterwebs = "http://11254q.ls.azioncdn.net/1254q/a/kissfm2.sdp/playlist.m3u8"
        case .Pop:
            endereçoNaInterwebs = "http://antena1.newradio.it/stream?1475840621661.aac"
        case .Ecletica:
            endereçoNaInterwebs = "http://200.144.185.21:8007/radiousp-128.mp3"
        case .Eletronica:
            endereçoNaInterwebs = "http://aac.97fm.com.br:80/energia"
        }
        
        // Mandamos o player tocar aquele endereço
        if let urlRadio = NSURL(string: endereçoNaInterwebs){
            player = AVPlayer(URL: urlRadio)
            player?.play()
        }
        
    }
    
    
}
