//
//  UIColor+Ext.swift
//  WorkoutApp
//
//  Created by Vitaliy Talalay on 24.03.2024.
//

import class UIKit.UIColor
import struct UIKit.CGFloat
import class Foundation.Scanner

extension UIColor {
    convenience init(hex: String) {
        let hexSanitized = hex.trimmingCharacters(in: .alphanumerics.inverted)
        
        var rgb: UInt64 = 0
        
        var r: CGFloat = 0.0
        var g: CGFloat = 0.0
        var b: CGFloat = 0.0
        var a: CGFloat = 255.0
        
        let length = hexSanitized.count
        
        guard Scanner(string: hexSanitized).scanHexInt64(&rgb) else { self.init() ; return }
        
        switch length {
        // Shades of gray
        case 2:
            let gray = CGFloat(rgb & 0xFF)
            (r, g, b) = (gray, gray, gray)
            
        // RGB (12-bit)
        case 3:
            r = CGFloat(rgb >> 8) * 17
            g = CGFloat(rgb >> 4 & 0xF) * 17
            b = CGFloat(rgb & 0xF) * 17
            
        // Gray with alpha
        case 4:
            let gray = CGFloat((rgb & 0x00FF) >> 8)
            (r, g, b) = (gray, gray, gray)
            a = CGFloat(rgb & 0x00FF)
            
        // RGB (24-bit)
        case 6:
            r = CGFloat((rgb & 0xFF0000) >> 16)
            g = CGFloat((rgb & 0x00FF00) >> 8)
            b = CGFloat(rgb & 0x0000FF)
            
        // ARGB (32-bit)
        case 8:
            r = CGFloat((rgb & 0xFF000000) >> 24)
            g = CGFloat((rgb & 0x00FF0000) >> 16)
            b = CGFloat((rgb & 0x0000FF00) >> 8)
            a = CGFloat(rgb & 0x000000FF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }
        
        self.init(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: a / 255.0)
    }
}
