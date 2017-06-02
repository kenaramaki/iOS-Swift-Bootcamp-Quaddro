//
//  String+Validações.swift
//  Swift200_Day4_1_TextViewSwitchSegment
//
//  Created by Swift on 01/10/16.
//  Copyright © 2016 Quaddro. All rights reserved.
//

import Foundation


extension String {
    
    func sóNumeros() -> String {
        return String(self.characters.filter {
            return "1234567890".characters.indexOf($0) != nil
        })
    }
    
}

extension NSString {
    
    func sóNumeros() -> String {
        return (self as String).sóNumeros()
    }
}