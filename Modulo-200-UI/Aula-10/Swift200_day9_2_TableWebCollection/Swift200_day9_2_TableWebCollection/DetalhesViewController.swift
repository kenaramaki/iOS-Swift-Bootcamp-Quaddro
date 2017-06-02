//
//  DetalhesViewController.swift
//  Swift200_day9_2_TableWebCollection
//
//  Created by Swift on 12/11/16.
//  Copyright © 2016 Luiz Gustavo Lino. All rights reserved.
//

import UIKit

class DetalhesViewController: UIViewController, UIWebViewDelegate {

    @IBOutlet weak var webview: UIWebView!
    @IBOutlet weak var spinner: UIActivityIndicatorView!

    var endereço:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Vamos converter!
        // String? -> String
        // String -> URL?
        // URL? -> URL
        guard let e = endereço,
              let url = URL(string: e) else{
                fatalError("URL inválida")
        }
        
        // Agora de URL para request
        let request = URLRequest(url: url)
        
        // Agora é só repassar para webview!
        webview.loadRequest(request)
        
    }
    
    // Deu certo, esconde o spinner
    func webViewDidFinishLoad(_ webView: UIWebView) {
        spinner.stopAnimating()
    }
    
    // Deu errado, esconde o spinner
    // CUIDADO com iFrames
    func webView(_ webView: UIWebView, didFailLoadWithError error: Error) {
        spinner.stopAnimating()
    }
    
    // Compartilhamento
    @IBAction func tapCompartilhe(){
        
        if let url = webview.request?.url,
            let titulo = self.title {
            
            let texto = "Veja mais sobre: \(titulo)"
            
            // Agora já temos conteúdo para compartilhar:
            // texto e endereço
            
            // Criamos um objeto UIActivityViewController, passando nosso conteúdo interessante
            let shareController = UIActivityViewController(activityItems: [texto, url], applicationActivities: nil)
            
            // Mostramos na tela
            self.present(shareController, animated: true, completion: nil)
            
        }
        
    }
    
    

}
