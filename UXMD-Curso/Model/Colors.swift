//
//  Colors.swift
//  UXMD-Curso
//
//  Created by Murilo Teixeira on 31/08/24.
//

import Foundation
import SwiftUI

enum Colors: String {
    
    case highlight = "#6750A4"
    case textHigh = "#001E2F"
    case textMedium = "#74777F"
    case primary = "#65558F"
    
    var color: Color {
        Color(hex: rawValue)
    }
}

extension Color {
    init(hex: String) {
        let trimmedHex = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        var hexSanitized = trimmedHex
        if hexSanitized.hasPrefix("#") {
            hexSanitized.removeFirst()
        }
        
        var rgb: UInt64 = 0
        Scanner(string: hexSanitized).scanHexInt64(&rgb)
        
        let red = Double((rgb >> 16) & 0xFF) / 255.0
        let green = Double((rgb >> 8) & 0xFF) / 255.0
        let blue = Double(rgb & 0xFF) / 255.0
        
        self.init(red: red, green: green, blue: blue)
    }
}
