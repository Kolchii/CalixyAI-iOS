//
//  View+CornerRadius.swift
//  CalixyAI
//
//  Created by Ibrahim Kolchi on 03.05.26.
//

// Yalnız müəyyən künclərə corner radius vermək üçün custom extension acmisam exi.
// Məsələn: .cornerRadius(30, corners: [.topLeft, .topRight])
import SwiftUI

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}

struct RoundedCorner: Shape {
    var radius: CGFloat
    var corners: UIRectCorner
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        )
        return Path(path.cgPath)
    }
}
