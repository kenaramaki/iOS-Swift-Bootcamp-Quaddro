//
//  ViewController.swift
//  JSON
//
//  Created by Swift on 11/02/17.
//  Copyright © 2017 Ken Aramaki. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let urlJson =  Bundle.main.url(forResource: "arquivo", withExtension: "json")!
        
        let jsonData : Data = try! Data(contentsOf: urlJson)
        
        do {
        
            let jsonParseNSArray = try JSONSerialization.jsonObject(with: jsonData, options: .allowFragments) as! NSArray
            
            let jsonParse = try JSONSerialization.jsonObject(with: jsonData, options: .allowFragments) as! [[String:String]]
            
            print(jsonParse)
            print(jsonParseNSArray)
        
        }catch{
            
        }
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

