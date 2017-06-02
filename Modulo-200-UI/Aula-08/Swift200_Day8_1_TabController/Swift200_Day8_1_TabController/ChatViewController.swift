//
//  ChatViewController.swift
//  Swift200_Day8_1_TabController
//
//  Created by Swift on 29/10/16.
//  Copyright © 2016 Swift. All rights reserved.
//

import UIKit

class ChatViewController: UIViewController {

    // awakeFromNib é chamado quando o storyboard carrega
    // nib = xib, formato clássico do interface builder
    override func awakeFromNib() {
        super.awakeFromNib()
        self.tabBarItem.badgeColor = UIColor.black
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("Chat vai aparecer")
        
        // Removendo a badge da TabBar quando entro na tela
        self.tabBarItem.badgeValue = nil
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("Chat apareceu")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("Chat vai desaparcer")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("Chat desapareceu")
        
        // Vamos trocar o valor da badge quando a pessoa sai dessa tela
        // Será um número aleatório, de exemplo
        self.tabBarItem.badgeValue = "\(1 + arc4random()%10)"
    }
    
}
