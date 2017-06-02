//
//  AlertView.swift
//  LetsParty
//
//  Created by Árthur Ken Aramaki Mota on 10/10/16.
//  Copyright © 2016 Ken Aramaki. All rights reserved.
//

import Foundation
import UIKit

class AlertView: UIView {

    init(frame: CGRect, warningText: String) {
        super.init(frame: frame)
        
        // The layout
        // Dark background
        backgroundColor = UIColor.blackColor().colorWithAlphaComponent(0.8)
        autoresizingMask = [.FlexibleHeight, .FlexibleWidth]
        
        // The Alert View background
        let alertBackground = UIView(frame: CGRectMake(0,0,200,120))
        alertBackground.backgroundColor = UIColor.whiteColor()
        alertBackground.center = self.center
        alertBackground.autoresizingMask = [.FlexibleTopMargin, .FlexibleLeftMargin, .FlexibleBottomMargin, .FlexibleRightMargin]
        addSubview(alertBackground)
        
        // Adding Alert View label
        let margin:CGFloat = 10
        let warning = UILabel(frame: CGRectMake(margin, margin, alertBackground.frame.size.width - (margin*2), (alertBackground.frame.size.height/2) - margin))
        warning.text = warningText
        warning.numberOfLines = 0
        warning.font = UIFont(name: "Avenir", size: 14)
        alertBackground.addSubview(warning)
        
        // Adding the Alert View button
        let button = UIButton(type: .System)
        let buttonHeight = alertBackground.frame.size.height
        let buttonWidth = alertBackground.frame.size.width
        button.frame = CGRectMake(margin, buttonHeight/2 + margin, buttonWidth - margin * 2, buttonHeight/2 - 2 * margin)
        button.setTitle("I got it!", forState: UIControlState.Normal)
        button.backgroundColor = UIColor(white: 0.92, alpha: 1.0)
        button.addTarget(self, action: "close", forControlEvents: .TouchUpInside)
        alertBackground.addSubview(button)
        
        // Rounding the corners
        alertBackground.layer.cornerRadius = 10
        button.layer.cornerRadius = 10
        
        // Alert View animation
        alpha = 0.0 // -> making it invisible at the beginnig
        
        let destinationPoint = alertBackground.frame
        var startingPoint = destinationPoint
        startingPoint.origin.y -= 90 // Rising 90 points from the start
        
        alertBackground.frame = startingPoint
        
        UIView.animateWithDuration(0.2) {
            self.alpha = 1.0
            alertBackground.frame = destinationPoint
        }
    
    }
    
    // Method that closes the view with an animation
    func close() {
        UIView.animateWithDuration(0.2, animations: {
            self.alpha = 0.0
            }, completion: { _ in
                self.removeFromSuperview()
        })
    }
    
    // This method calls the method 'close()' when you touch oustide the Alert View
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if touches.first?.view == self {
            close()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
