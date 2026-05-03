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
        let r = Double((int >> 16) & 0xFF) / 255
        let g = Double((int >> 8) & 0xFF) / 255
        let b = Double(int & 0xFF) / 255
        self.init(red: r, green: g, blue: b)
    }
}
extension Color {
    static let primaryDark = Color(hex: "1B3A2D")
    static let primaryMid = Color(hex: "2D6A4F")
    static let primaryAccent = Color(hex: "52C48A")
    static let surfaceLight = Color(hex: "F5F2EC")
}
