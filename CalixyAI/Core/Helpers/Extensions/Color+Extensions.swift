//
//  Color+Extensions.swift
//  CalixyAI
//
//  Created by Ibrahim Kolchi on 03.05.26.
//
import SwiftUI

extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3:
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6:
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8:
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue: Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
    
    // primaryDark — tünd yaşıl, əsas rəng (button, arxa fon)
    static let primaryDark = Color(hex: "1B3A2D")
    
    // primaryMid — orta yaşıl (secondary button, progress bar)
    static let primaryMid = Color(hex: "2D6A4F")
    
    // primaryAccent — açıq yaşıl/teal (gradient, highlight, ikon)
    static let primaryAccent = Color(hex: "52C48A")
    
    // surfaceLight — krem/açıq arxa fon rəngi
    static let surfaceLight = Color(hex: "F5F2EC")
    
    // signUpGradientStart — Sign Up düyməsi gradient başlanğıc
    static let signUpGradientStart = Color(hex: "2DC97E")
    
    // signUpGradientEnd — Sign Up düyməsi gradient son
    static let signUpGradientEnd = Color(hex: "25B070")
    
    // accentGreen — Log In linki, Terms rəngi
    static let accentGreen = Color(hex: "2DC97E")
}
