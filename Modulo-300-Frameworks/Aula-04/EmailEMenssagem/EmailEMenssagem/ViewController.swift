//
//  ViewController.swift
//  EmailEMenssagem
//
//  Created by Swift on 04/02/17.
//  Copyright © 2017 Ken Aramaki. All rights reserved.
//

import UIKit
// Importando o framework ao projeto
import MessageUI

// Adotando o nosso delegate
class ViewController: UIViewController, MFMailComposeViewControllerDelegate, MFMessageComposeViewControllerDelegate {

    // MARK: - Outlets
    
    // MARK: - Propriedades
    
    // MARK: - ViewLifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    // MARK: - Métodos
    
    // MARK: - Actions
    
    @IBAction func enviarEmail(_ sender: UIButton) {
        
        // Verificando se o usuário pode enviar emails
        if MFMailComposeViewController.canSendMail() {
            
            // Caso possa
            
            // Criando o nosso objeto responsável pela criação do nosso e-mail
            let mailCompose = MFMailComposeViewController()
            
            // --------- Fazendo o preenchimento dos campos do nosso e-mail -------------
            
            // Método que define o objeto responsável pelo assunto do email
            mailCompose.setSubject("Interesse na vaga aberta")
            
            // Método que define o corpo do e-mail
            mailCompose.setMessageBody("<strong><i> Boa tarde, gostaria de ne candidatar a vaga de diretor da Apple. Soube que recentemente a vaga blá blá </i></strong>", isHTML: true)
            
            // Método que define os destinatários
            let arrayDestinatarios = ["rh@apple.com", "trabalheconosco@apple.com", "recrutamento@apple.com"]
            mailCompose.setToRecipients(arrayDestinatarios)
            
            // Método que define quem estará em cópia no email
            let arrayCopia = ["zuck@face.com", "bill@microsoft.com", "tim@bolacha.com"]
            mailCompose.setCcRecipients(arrayCopia)
            
            // Método que define quem estará em cópia oculta no e-mail
            let arrayCopiaOculta = ["edwardsnooden@msa.com.br", "baidu@baidu.com"]
            mailCompose.setBccRecipients(arrayCopiaOculta)
            
            // Anexando umn arquivo
            let imagemData = UIImagePNGRepresentation(UIImage(named: "foto.png")!)!
            mailCompose.addAttachmentData(imagemData, mimeType: "image/png", fileName: "Imagem")
            
            mailCompose.mailComposeDelegate = self
            
            //
            
            self.present(mailCompose, animated: true, completion: nil)
            
            // -------------------------------------------------------------------------
            
            
            
            
            
        } else {
            
            // Caso não possa
            let alerta = UIAlertController(title: "Alerta!", message: "Não é possivel enviar e-mails no momento", preferredStyle: .alert)
            let acaoOK = UIAlertAction(title: "OK", style: .default, handler: nil)
            alerta.addAction(acaoOK)
            self.present(alerta, animated: true, completion: nil)
            
        }
        
    }
    
    @IBAction func enviarMensagem(_ sender: UIButton) {
        
        // Verificação se é possível fazer envio da mensagem
        if MFMessageComposeViewController.canSendText(){
            // Caso seja possível
            
            // Criamos o objeto da classe reponsável por escrever mensagem
            let messageCompose = MFMessageComposeViewController()
            
            // Propriedade que define o corpo da menssagem
            messageCompose.body = "E ae, beleza?"
            
            messageCompose.messageComposeDelegate = self
            
            
        } else {
            // Caso não seja possível
            
            let alerta = UIAlertController(title: "Alerta", message: "Não é possível enviar mensagem no momento", preferredStyle: .alert)
            let acaoOK = UIAlertAction(title: "OK", style: .default, handler: nil)
            alerta.addAction(acaoOK)
            self.present(alerta, animated: true, completion: nil)
            
        }
        
    }
    
    
    // MARK: - Métodos de MFMailComposeViewControllerDelegate
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        
        // O parâmetro result concentra as ações possíveis em relação ao email
        switch result {
        case .sent:
            print("E-mail enviado com sucesso")
        case .failed:
            print("Falha no envio do e-mail")
        case .cancelled:
            print("Envio cancelado")
        case .saved:
            print("E-mail salvo")
//        default:
//            break
        }
        
        controller.dismiss(animated: true, completion: nil)
        
    }
    
    
    // MARK: - Métodos de MFMessageComposeViewControllerDelegate
    
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
        
        switch result {
        case .sent:
            print("Menssagem enviada")
        case .failed:
            print("Falha no envio da menssagem")
        case .cancelled:
            print("Envio da menssagem cancelado")
//        default:
//            break
        }
        
        controller.dismiss(animated: true, completion: nil)
        
    }
    
}

