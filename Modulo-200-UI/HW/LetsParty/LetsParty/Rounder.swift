//
//  Rounder.swift
//  LetsParty
//
//  Created by Árthur Ken Aramaki Mota on 12/10/16.
//  Copyright © 2016 Ken Aramaki. All rights reserved.
//

import UIKit

// This class rounds views
class Rounder: NSObject {

    
    
    // @IBInspectable tells the interface builder that it can be changed on the storyboard
    @IBInspectable var radius : CGFloat = 10
    
    @IBOutlet var targets : [UIView]? {
        didSet{
            
            // Making sure there is an array with my views conected
            // Otherwise I need no action and just return
            guard let currentTargets = targets else {
                return
            }
            
            // We get each view and round its corners to the size of the radius
            for target in currentTargets {
                target.layer.cornerRadius = radius
            }
        }
    }
    
    
}
