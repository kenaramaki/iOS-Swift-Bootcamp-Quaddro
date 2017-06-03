//
//  ViewController.swift
//  NSURLSessinClasseAPI
//
//  Created by Árthur Ken Aramaki Mota on 08/04/17.
//  Copyright © 2017 Árthur Ken Aramaki Mota. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - Propriedades
    
    // MARK: - Outlets
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
    
    }

    
    // MARK: - Métodos
    
    // MARK: - Actions
    @IBAction func requisitarGet(_ sender: UIButton) {
        
        API.requisitarGet { (dicionario, error) in
            
            if error == nil {
                
                print(dicionario)
                
            } else {
                
                print("\(error?.localizedDescription)")
                
            }
            
        }
        
    }
    
    
    @IBAction func requisitarPut(_ sender: UIButton) {
        
        API.requisitarPut { (dicionario, error) in
            
            if error == nil {
                
                print(dicionario)
                
            } else {
                
                print("\(error?.localizedDescription)")
                
            }
            
        }
        
        
    }

    
    @IBAction func requisitarPost(_ sender: UIButton) {
        
        API.requisitarPost { (dicionario, error) in
            
            if error == nil {
                
                print(dicionario)
                
            } else {
                
                print("\(error?.localizedDescription)")
            }
            
        }
        
        
        
    }
    
    
    @IBAction func requisitarDelete(_ sender: UIButton) {
        
        API.requisitarDelete { (dicionario, error) in
            
            if error == nil {
                
                print(dicionario)
                
            } else {
                
                print("\(error?.localizedDescription)")
            }
            
        }
        
    }
    
    
}

