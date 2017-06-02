//
//  QuadradoView.swift
//  Swift200_Day2_2_UISlider
//
//  Created by Swift on 24/09/16.
//  Copyright © 2016 Quaddro. All rights reserved.
//

import UIKit

class QuadradoView: UIView, AquelesQueMudamDeCor {
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        ContaGotasViewController.apresentaCom(self, corInicial: backgroundColor!)
    }

    func recebeNovaCor(cor: UIColor) {
        backgroundColor = cor
    }
    
}
