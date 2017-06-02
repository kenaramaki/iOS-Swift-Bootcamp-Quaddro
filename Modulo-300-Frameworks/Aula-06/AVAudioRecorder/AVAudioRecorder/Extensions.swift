//
//  Extensions.swift
//  AVAudioRecorder
//
//  Created by Swift on 18/02/17.
//  Copyright © 2017 Ken Aramaki. All rights reserved.
//

import Foundation

extension String {
    
    func appendingPathComponent(string : String) -> String {
        
        return (self as NSString).appendingPathComponent(string)
        
    }
    
    
}
