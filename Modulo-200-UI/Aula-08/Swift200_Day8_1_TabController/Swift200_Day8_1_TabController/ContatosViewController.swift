//
//  ContatosViewController.swift
//  Swift200_Day8_1_TabController
//
//  Created by Swift on 29/10/16.
//  Copyright © 2016 Swift. All rights reserved.
//

import UIKit

class ContatosViewController: UIViewController {

    @IBOutlet weak var buutãoVaiVolta: UISwitch!
    
    @IBAction func tapLevaParaAjustes(){
        
        // Primeiro, antes de trocar de tab, garantimos que
        // esta tela tem um tabBarController
        guard let tabs = self.tabBarController?.viewControllers else{
            return
        }
        
        // Com a lista de telas de tabs em mãos,
        // percorremos uma a uma...
        for (indice, controlador) in tabs.enumerated(){
            //... até encontrar a que procuramos
            if controlador is AjustesViewController{
                // e aí mudamos para esta tab
                self.tabBarController?.selectedIndex = indice
            }
        }
    }
    
    @IBAction func tapMostraTab(sender:UISwitch){
        // Fazemos uma animalçao oara esconder ou mostrar
        // a barra, dependendo do estados on/off do switch
        UIView.animate(withDuration: 0.24) {
            self.tabBarController?.tabBar.alpha = sender.isOn ? 1 : 0
        }
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("Contatos vai aparecer")
        
        // quando voltar, preciso saber se meu botão mostra/esconde tab bar está
        // ligado ou desligado e refletir isso no layout
        UIView.animate(withDuration: 0.24) {
            self.tabBarController?.tabBar.alpha = self.buutãoVaiVolta!.isOn ? 1: 0
        }
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("Contatos apareceu")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("Contatos vai desaparcer")
        
        // Quando sair da tela preciso deixar a tab do jeito que encontrei
        UIView.animate(withDuration: 0.24) {
            self.tabBarController?.tabBar.alpha = 1
        }
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("Contatos desapareceu")
    }
    
}
