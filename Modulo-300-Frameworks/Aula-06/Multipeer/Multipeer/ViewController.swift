//
//  ViewController.swift
//  Multipeer
//
//  Created by Swift on 18/02/17.
//  Copyright © 2017 Ken Aramaki. All rights reserved.
//

import UIKit
import MultipeerConnectivity

class ViewController: UIViewController, MCBrowserViewControllerDelegate, MCSessionDelegate, UITextFieldDelegate {

    
    // MARK: - Outlets
    @IBOutlet weak var textViewConversa: UITextView!
    @IBOutlet weak var textFieldMensagem: UITextField!
    
    // MARK: - Propriedades
    
    // Disponibiliza uma interface padrão para permitir o usuário escolher quem adicionará na session
    var browserViewController : MCBrowserViewController!
    
    // Provê uma interface padrão que permite ao usuário aceitar os convites de conexão
    var advertiser : MCAdvertiserAssistant!
    
    // Cria uma session que permite a comunicação entre os devices conectados
    var minhaSession : MCSession!
    
    // Identificador único para os devices da sessão
    var meuPeerID : MCPeerID!
    
    
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Ligando o delegate da nossa text field
        self.textFieldMensagem.delegate = self
        
        // Limpando o texto da nossa text view
        self.textViewConversa.text = nil
        
        // Iniciando nosso peer ID
        //self.meuPeerID = MCPeerID(displayName: UIDevice.current.name)
        self.meuPeerID = MCPeerID(displayName: "Ken")
    
        // INICICANDO a session
        self.minhaSession = MCSession(peer: self.meuPeerID)
        
        //
        self.minhaSession.delegate = self
        
        // INICIANDO o nosso navegador
        self.browserViewController = MCBrowserViewController(serviceType: "chat", session: self.minhaSession)
        
        // Ligando o delegate
        self.browserViewController.delegate = self
        
        // Iniciando o nosso advertiser 
        self.advertiser = MCAdvertiserAssistant(serviceType: "chat", discoveryInfo: nil, session: self.minhaSession)
        
        
    }
  
    
    // MARK: - Métodos
    func trataMensagem (_ umaMensagem : String, doPeer umPeerID : MCPeerID) {
        
        var textoFinal = ""
        
        // Montando a lógica da exibição da mensagem
        
        if umPeerID == self.meuPeerID {
            
            textoFinal = "\nEu: \(umaMensagem)"
            
        } else {
            
            textoFinal = "\n\(umPeerID.displayName) : \(umaMensagem)"
            
        }
        
        self.textViewConversa.text! += textoFinal
        
    }
    
    func enviarMensagem() {
        
        // Pegando a mensagem
        let mensagem = self.textFieldMensagem.text!
        
        // Limpandoa textField
        self.textFieldMensagem.text = ""
        
        // Convertendo o texto para Data
        let data = mensagem.data(using: String.Encoding.utf8, allowLossyConversion: true)!
        
        do {
            
            try self.minhaSession.send(data, toPeers: self.minhaSession.connectedPeers, with: MCSessionSendDataMode.reliable)
            
        }catch{}
        
        // Chamamos o método que trata a mensagem a partir do peer local
        self.trataMensagem(mensagem, doPeer: self.meuPeerID)
        
    }
    
    
    // MARK: - Actions
    @IBAction func navegar(_ sender: UIButton) {
        
        // Mostrando o nosso browser
        self.present(self.browserViewController, animated: true, completion: nil)
        
        // Ativando o nosso advertiser
        self.advertiser.start()
        
    }
    
    // MARK: - Métodos do MCBrowserViewControllerDelegate
    
    func browserViewControllerDidFinish(_ browserViewController: MCBrowserViewController) {
        
        print("Apertou Done")
        
        // Retirando o controller de tela
        browserViewController.dismiss(animated: true, completion: nil)
    
    }
    
    func browserViewControllerWasCancelled(_ browserViewController: MCBrowserViewController) {
        
        print("Apertou cancelar")
        
        // Retirando o controller da tela
        browserViewController.dismiss(animated: true, completion: nil)
        
    }
    
    
    // MARK: - Métodos de UITextFieldDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if !(self.textFieldMensagem.text!.isEmpty) {
            
            self.enviarMensagem()
            
        }
        
        self.textFieldMensagem.resignFirstResponder()
        
        return true
        
    }
    
    // MARK: - Métodos de MCSessionDelegate
    func session(_ session: MCSession, didReceive data: Data, fromPeer peerID: MCPeerID) {
        
        // Convertendo a mensagem para string
        
        let mensagem = NSString(data: data, encoding: String.Encoding.utf8.rawValue) as? String
        
        //
        
        DispatchQueue.main.async {
            
            self.trataMensagem(mensagem!, doPeer: peerID)

        }
        
    }
    
    
    func session(_ session: MCSession, didReceive stream: InputStream, withName streamName: String, fromPeer peerID: MCPeerID) {
        
        
        
    }
    
    func session(_ session: MCSession, didStartReceivingResourceWithName resourceName: String, fromPeer peerID: MCPeerID, with progress: Progress) {
        
        
    }
    
    func session(_ session: MCSession, didFinishReceivingResourceWithName resourceName: String, fromPeer peerID: MCPeerID, at localURL: URL, withError error: Error?) {
        
        
    }
    
    func session(_ session: MCSession, peer peerID: MCPeerID, didChange state: MCSessionState) {
        
        
        
    }
    
    
    

}

