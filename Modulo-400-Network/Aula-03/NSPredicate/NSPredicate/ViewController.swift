//
//  ViewController.swift
//  NSPredicate
//
//  Created by Árthur Ken Aramaki Mota on 22/04/17.
//  Copyright © 2017 Árthur Ken Aramaki Mota. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var arrayStrings = ["Lilica", "Lili", "Garibaldo", "Florencio", "Felipe", "Lucia"]
    
    var arrayInteiros = [0,0,1,2,3,4,5,6,7]

    override func viewDidLoad() {
        super.viewDidLoad()

        // -------------- Comparações Básicas ----------------
        
        // = , == : Igual
        
        let predicateIgual = NSPredicate(format: "self == 0")
        let arrayFiltradoIgual = (self.arrayInteiros as NSArray).filtered(using: predicateIgual)
        print(arrayFiltradoIgual)
        
        
        // --------------
        
        // <= , =< : Menor Igual
        
        let predicateMenorIgual = NSPredicate(format: "self <= 4")
        let arrayFiltradoMenorIgual = (self.arrayInteiros as NSArray).filtered(using: predicateMenorIgual)
        print(arrayFiltradoMenorIgual)
    
        // --------------
        
        // >= , => : Maior Igual
        
        let predicateMaiorIgual = NSPredicate(format: "self >= 3")
        let arrayFiltradoMaiorIgual = (self.arrayInteiros as NSArray).filtered(using: predicateMaiorIgual)
        print(arrayFiltradoMaiorIgual)
        
        // --------------
        
        // <  : Menor
        
        let predicateMenor = NSPredicate(format: "self < 4")
        let arrayFiltradoMenor = (self.arrayInteiros as NSArray).filtered(using: predicateMenor)
        print(arrayFiltradoMenor)
        
        // --------------
        
        // > : Maior
        
        let predicateMaior = NSPredicate(format: "self > 3")
        let arrayFiltradoMaior = (self.arrayInteiros as NSArray).filtered(using: predicateMaior)
        print(arrayFiltradoMaior)
        
        // --------------
        
        // !=, <> : Diferente
        
        let predicateDiferente = NSPredicate(format: "self != 3")
        let arrayFiltradoDiferente = (self.arrayInteiros as NSArray).filtered(using: predicateDiferente)
        print(arrayFiltradoDiferente)
        
        // --------------
        
        // BETWEEN : Intervalo de valores
        
        let predicateBETWEEN = NSPredicate(format: "self BETWEEN {1,6}")
        let arrayFiltradoBETWEEN = (self.arrayInteiros as NSArray).filtered(using: predicateBETWEEN)
        print(arrayFiltradoBETWEEN)
        
        
        
        // -------------- Comparações Compostas Básicas ----------------

        // AND, && : Operador Lógico AND
        let predicateAND = NSPredicate(format: "self BETWEEN {1,6} && self > 3")
        let arrayFiltradoAND = (self.arrayInteiros as NSArray).filtered(using: predicateAND)
        print(arrayFiltradoAND)
        
        
        // --------------
        
        // OR, || : Operador Lógico OR
        
        let predicateOR = NSPredicate(format: "self BETWEEN {1,3} || self > 6")
        let arrayFiltradoOR = (self.arrayInteiros as NSArray).filtered(using: predicateOR)
        print(arrayFiltradoOR)
        
        
        // --------------
        
        // NOT, ! : Operador Lógico NOT
        
        let predicateNOT = NSPredicate(format: "! (self BETWEEN {1,3})")
        let arrayFiltradoNOT = (self.arrayInteiros as NSArray).filtered(using: predicateNOT)
        print(arrayFiltradoNOT)
        
        
        // -------------- Comparação de Strings ----------------

        // BEGINSWITH : Inicia com determinada expressão
        
        let argumentoBEGINSWITH = "L"
        let predicateBEGINSWITH = NSPredicate(format: "self BEGINSWITH[cd] %@", argumentoBEGINSWITH)
        let arrayFiltradoBEGINSWITH = (self.arrayStrings as NSArray).filtered(using: predicateBEGINSWITH)
        print(arrayFiltradoBEGINSWITH)
        
        // --------------
        
        // ENDSWITH : Termina com determinada expressão
        
        let argumentoENDSWITH = "O"
        let predicateENDSWITH = NSPredicate(format: "self ENDSWITH[cd] %@", argumentoENDSWITH)
        let arrayFiltradoENDSWITH = (self.arrayStrings as NSArray).filtered(using: predicateENDSWITH)
        print(arrayFiltradoENDSWITH)
        
        // --------------
        
        // CONTAINS : Contém determinada expressão
        
        let argumentoCONTAINS = "li"
        let predicateCONTAINS = NSPredicate(format: "self CONTAINS[cd] %@", argumentoCONTAINS)
        let arrayFiltradoCONTAINS = (self.arrayStrings as NSArray).filtered(using: predicateCONTAINS)
        print(arrayFiltradoCONTAINS)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

