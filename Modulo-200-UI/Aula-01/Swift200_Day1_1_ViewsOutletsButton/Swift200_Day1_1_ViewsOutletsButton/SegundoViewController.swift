//
//  SegundoViewController.swift
//  Swift200_Day1_1_ViewsOutletsButton
//
//  Created by Swift on 10/09/16.
//  Copyright © 2016 Quaddro. All rights reserved.
//

import UIKit

class SegundoViewController: UIViewController {

    
    @IBOutlet weak var titulo: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        titulo.text = "SEM SINAL"
        
        // Do any additional setup after loading the view.
        
        let cores = [UIColor.whiteColor(),
                     UIColor.yellowColor(),
                     UIColor.cyanColor(),
                     UIColor.greenColor(),
                     UIColor.magentaColor(),
                     UIColor.redColor(),
                     UIColor.blueColor()]
        
        for i in 0..<cores.count {
            let largura = self.view.frame.size.width / CGFloat(cores.count)
            // CGRectMake (posição horizonta, posição vertical, largura, altura)
            let umaView = UIView(frame: CGRectMake(CGFloat(i)*largura, 20, largura, 300))
            umaView.backgroundColor = cores[i]
            self.view.addSubview(umaView)
        }
    }

    @IBAction func fechar(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    //override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
    //}
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        print("2) A tela vai aparecer!")
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        print("2) A tela apareceu")
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        print("2) A tela vai desaparecer!")
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        print("2) A tela desapareceu")
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

