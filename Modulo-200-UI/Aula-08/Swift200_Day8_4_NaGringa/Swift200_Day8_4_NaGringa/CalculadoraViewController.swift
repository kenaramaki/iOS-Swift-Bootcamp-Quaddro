//
//  CalculadoraViewController.swift
//  Swift200_Day8_4_NaGringa
//
//  Created by Swift on 29/10/16.
//  Copyright © 2016 Swift. All rights reserved.
//

import UIKit

class CalculadoraViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    
    @IBOutlet weak var valorUSD: UITextField!
    @IBOutlet weak var cotacao: UITextField!
    @IBOutlet weak var iofMoedaEst: UITextField!
    @IBOutlet weak var iofCompraInt: UITextField!
    
    @IBOutlet weak var pickerImposto: UIPickerView!
    @IBOutlet weak var valorConvertido: UILabel!
    
    @IBAction func tapCredito(_ sender: UISwitch) {
    }
    
    
    
    

    // Número de colunas do picker
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // Número de linhas do picker
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return App.instancia.cidades.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return App.instancia.cidades.keys.sorted()[row]
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //print("\(App.instancia.cidades.values)")
        //print("\(App.instancia.cidades.keys)")
        
    }

}
