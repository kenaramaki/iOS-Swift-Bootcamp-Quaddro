//
//  ViewController.swift
//  DesafioCompartilhaPosicao
//
//  Created by Swift on 04/02/17.
//  Copyright © 2017 Ken Aramaki. All rights reserved.
//

// Ponte Metálica: -23.5389038,-46.7736199

import UIKit
import MapKit
import CoreLocation
import MessageUI




class ViewController: UIViewController, CLLocationManagerDelegate, MFMailComposeViewControllerDelegate {

    // MARK: - Outlets
    @IBOutlet weak var mapa: MKMapView!
    
    // MARK: - Propriedades
    
    // Propriedade que define o nosso gerenciador de localização
    var gerenciadorGPS = CLLocationManager()
    var localizacaoAtual = CLLocationCoordinate2D()
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        
        // Verificando se há autorização
        
        if CLLocationManager.authorizationStatus() != CLAuthorizationStatus.authorizedWhenInUse && CLLocationManager.authorizationStatus() != CLAuthorizationStatus.authorizedAlways {
            
            // Caso não tenha solicitado autoziação
            self.gerenciadorGPS.requestWhenInUseAuthorization()
            
        } else {
            
            // Caso já tenha autorização
            
        }
        
        // ------------------------------------
        
        self.gerenciadorGPS.desiredAccuracy = kCLLocationAccuracyBest
        
        // Criando as coordenadas geográficas da Ponte Metálica de Oz City
        let coordenadasPonteMetálica = CLLocationCoordinate2D(latitude:  -23.5389038, longitude: -46.7736199)
        
        // Criando o span
        let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        
        // Criando a região que será exibida inicialmente no mapa
        let regiaoInicial = MKCoordinateRegion(center: coordenadasPonteMetálica, span: span)
        
        // Colocando no mapa a região inicial
        self.mapa.setRegion(regiaoInicial, animated: true)
        
        // Criando pino no mapa
        let pinoPonteMetalica = MKPointAnnotation()
        
        // Atribuindo a propriedade que define o título
        pinoPonteMetalica.title = "Ponte Metálica"
        
        // Propriedade que define a coordenada 
        pinoPonteMetalica.coordinate = coordenadasPonteMetálica
        
        // Método que seta o pino no mapa
        self.mapa.addAnnotation(pinoPonteMetalica)
    
        
        print(localizacaoAtual.longitude)
        print(localizacaoAtual.latitude)
    
        
    }

  

    // MARK: - Métodos
    
    // MARK: - Actions
    
    @IBAction func rastrearPosicao(_ sender: UIBarButtonItem) {
        
     
        // Propriedade que liga o rastreamento do usuário
        self.mapa.showsUserLocation = true
        
        // Atribuindo o delegate
        self.gerenciadorGPS.delegate = self
        
        // Iniciando o processo de verificação
        self.gerenciadorGPS.startUpdatingLocation()
        
    }
    
    @IBAction func compartilhaPosicao(_ sender: UIBarButtonItem) {
        
        // Verificando se o usuário pode enviar e-mails
        if MFMailComposeViewController.canSendMail() {
            
            // Caso possa
            
            // Objeto responsável pela criação do e-mail
            let mailCompose = MFMailComposeViewController()
            
            // Método que define o objeto responsávle pelo assunto do email
            mailCompose.setSubject("Ei! Estou aqui!")
            
            // Método que define o corpo do e-mail
            mailCompose.setMessageBody("Estou na latitude: \(localizacaoAtual.latitude) e na longitude:\(localizacaoAtual.longitude)", isHTML: false)
            
            mailCompose.mailComposeDelegate = self
            
        } else {
            
            // Caso não possa
            let alerta = UIAlertController(title: "Alerta", message: "Não é possível enviar e-mails no momento", preferredStyle: .alert)
            let acaoOK = UIAlertAction(title: "OK", style: .default, handler: nil)
            alerta.addAction(acaoOK)
            self.present(alerta, animated: true, completion: nil)
            
        }
    
    }
    
    // MARK: - Métodos do CLLocationManagerDelegate
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        
        //print(locations.last)
        
        // Resgatando localização
        if let localizacao = locations.last {
            // Criando o span
            let span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
            
            // Criando a refiao que usaremos para setar o mapa
            let regiao = MKCoordinateRegion(center: localizacao.coordinate, span: span)
            
            // Setando a posição do usuário no mapa
            self.mapa.setRegion(regiao, animated: true)
            
            localizacaoAtual = CLLocationCoordinate2D(latitude: localizacao.coordinate.latitude, longitude: localizacao.coordinate.longitude)
            
            print(localizacaoAtual)
            
        }
        
    }
    
    // MARK: - Métodos de MFMailComposeViewControllerDelegate
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        
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

}

