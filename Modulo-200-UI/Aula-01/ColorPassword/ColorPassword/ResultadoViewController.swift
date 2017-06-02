//
//  ResultadoViewController.swift
//  ColorPassword
//
//  Created by Swift on 10/09/16.
//  Copyright © 2016 Quaddro. All rights reserved.
//

import UIKit

class ResultadoViewController: UIViewController {

    @IBOutlet weak var tentativasLabel: UILabel!
    
    var totalDeTentativas:Int?
    
    @IBAction func voltar(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tentativasLabel.text = "\(totalDeTentativas ?? 1)"

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
