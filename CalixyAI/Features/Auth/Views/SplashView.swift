//
//  SplashView.swift
//  CalixyAI
//
//  Created by Ibrahim Kolchi on 03.05.26.
//

import SwiftUI

struct SplashView: View {
    var body: some View {
        VStack(spacing: 8) {
            Image("CalixyIcon")
                .resizable()
                .frame(width: 80, height: 80)
            Text("CalixyAI")
                .font(.largeTitle)
                .fontWeight(.bold)
                .cornerRadius(20)
            Text("Your AI Wellness Companion")
                .font(.subheadline)
                .foregroundStyle(.gray)
        } .background(.white)
        
    }
}
