//
//  SplashView.swift
//  CalixyAI
//
//  Created by Ibrahim Kolchi on 03.05.26.
//

import SwiftUI

struct SplashView: View {
    @State private var isActive = false
    var body: some View {
        NavigationLink(destination: LanguageSelectionView(), isActive: $isActive) { EmptyView() }
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
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    isActive = true
                }
            }
        
    }
}
