//
//  Main.swift
//  Angel Rings
//
//  Created by Vicky Zheng on 9/22/22.
//

import Foundation
import SwiftUI

class Main: ObservableObject {
    @Published var activated = false
    
    func getCaution() -> String {
        return activated ? "Exit Caution Mode" : "Enter Caution Mode"
    }
    
    func getState() -> String {
        return activated ? "Deactivate" : "Activate"
    }
    
    func getColor() -> (Color, Color) {
        if activated {
            return (Color(red: 0.9529, green: 0.7960, blue: 0.2706), Color(red: 0.9686, green: 0.8863, blue: 0.6039))
        } else {
            return (Color.white, Color(red: 0.9922, green: 0.9686, blue: 0.8863))
        }
    }
    
    func getCurrentInstructions() -> String {
        if activated {
            return "Tap your watch twice to confirm\nsafety when your device buzzes."
        } else {
            return "Activate caution mode for your device\nto check in to see if you are still safe\nevery 15 minutes."
        }
    }
}
