//
//  ViewController.swift
//  Swift200_Day7_1_DatePickerAlertView
//
//  Created by Swift on 22/10/16.
//  Copyright © 2016 Swift. All rights reserved.
//

import UIKit
import AudioToolbox

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var botãoUm: UIButton!
    @IBOutlet weak var botãoDois: UIButton!
    @IBOutlet weak var botãoTrês: UIButton!
    
    @IBOutlet weak var meuPicker: UIPickerView!
    
    // Vidas do jogador
    // Quantas vezes ele pode girar
    var rodadasRestantes = 0
    
    // Implementando os métodos de delegate
    // e datasource do picker
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3 // 3 porque temos 3 rodinhas para girar
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 50 // São 10 itens diferentes em cada rodinha
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Movevr as rodinhas (0, 1 e 2) para uma posição
        // que dê para ver em cima e embaixo
        meuPicker.selectRow(15, inComponent: 0, animated: false)
        meuPicker.selectRow(15, inComponent: 1, animated: false)
        meuPicker.selectRow(15, inComponent: 2, animated: false)
        
        
        
    }
    
    func gira(rodinha:Int){
        
        // Recuperamos qual a posição atual desta rodinha 
        // para poder acrescentar e evitar de girar ao contrário
        var seleçãoAtual = meuPicker.selectedRow(inComponent: rodinha)
        
        // Volto o picker para o mesmo desenho, só que mais para cima
        // eliminando o risco de chegar no fim
        let  mesmoDesenhoMaisPraCima = seleçãoAtual%10 + 10
        meuPicker.selectRow(mesmoDesenhoMaisPraCima, inComponent: rodinha, animated: false)
        seleçãoAtual = mesmoDesenhoMaisPraCima
        
        // Gera um número aleatório de um até dez
        let aleatorio   = Int(arc4random()%10) + 1
        
        meuPicker.selectRow(seleçãoAtual + aleatorio, inComponent: rodinha, animated: true)
        
        
        
    }
    
    
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        
        if let viewQueOPickerFezDaUltimaVezQuePassouAqui = view {
            return viewQueOPickerFezDaUltimaVezQuePassouAqui
        }else{
            
            // Estes são nossos itens, vamos sempre retornar dentro da faixa
            // de 10, ou seja, row%10
            let titulo = ["💩","👾","🤖","👹","👽","💀","🦄","🐦","🌚","🌞"][row%10]
            
            // Configuramos nosso campo de texto
            let texto = UILabel()
            texto.text                  = titulo
            texto.layer.cornerRadius    = 5
            texto.layer.borderColor     = UIColor.black.cgColor
            texto.layer.borderWidth     = 1
            texto.textAlignment         = .center
            texto.backgroundColor       = UIColor.white
            texto.clipsToBounds         = true
            
            return texto
            
        }
        
    }
    
    @IBAction func tapTrocaTodos(_ sender: UIButton) {
        gira(rodinha: 0)
        gira(rodinha: 1)
        gira(rodinha: 2)
        
        rodadasRestantes = 3
        botãoUm.isEnabled = true
        botãoDois.isEnabled = true
        botãoTrês.isEnabled = true
        
        validaSeTodasRodinhasSãoIguais()
        
    }
    
    @IBAction func tapGira(_ sender: UIButton){
        gira(rodinha: sender.tag)
        validaSeTodasRodinhasSãoIguais()

        
        rodadasRestantes -= 1
        if rodadasRestantes == 0{
            botãoUm.isEnabled = false
            botãoDois.isEnabled = false
            botãoTrês.isEnabled = false
        }
     
        
        
    }
    
    
    // Se todas forem iguais, vamos vibrar o celular
    // para avisar que o jogador ganhou
    func validaSeTodasRodinhasSãoIguais(){
        
        let item1 = meuPicker.selectedRow(inComponent: 0)
        let item2 = meuPicker.selectedRow(inComponent: 1)
        let item3 = meuPicker.selectedRow(inComponent: 2)
        
        if item1 == item2 && item2 == item3 {
            
            AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
            botãoUm.isEnabled = false
            botãoDois.isEnabled = false
            botãoTrês.isEnabled = false
        }
        
    }
    
}

