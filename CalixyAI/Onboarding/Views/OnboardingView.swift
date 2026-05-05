//
//  Onboarding.swift
//  CalixyAI
//
//  Created by Ibrahim Kolchi on 06.05.26.
//
import SwiftUI

struct OnboardingView: View {
    @State private var currentPage: Int = 0
    
    let slides: [OnboardingModel] = [
        OnboardingModel(image: "Onboarding1",
                        title: "Know exactly what you eat.",
                        description: "Point your camera at any meal. CalixyAI reads it in seconds."),
        OnboardingModel(image: "Onboarding2",
                        title: "Personalized for your goals.",
                        description: "CalixyAI learns your restrictions, daily energy needs, and local food preferences."),
        OnboardingModel(image: "Onboarding3",
                        title: "Your daily wellness loop.",
                        description: "Track meals, hydration, and supplements in one unified experience.")
    ]
    
    var body: some View {
        ZStack {
            TabView(selection: $currentPage) {
                ForEach(0..<slides.count, id: \.self) { index in
                    VStack(spacing: 20) {
                        Image(slides[index].image)
                            .resizable()
                            .scaledToFit()
                        
                        Text(slides[index].title)
                            .font(.title)
                            .fontWeight(.bold)
                            .multilineTextAlignment(.center)
                        
                        Text(slides[index].description)
                            .font(.subheadline)
                            .foregroundStyle(.gray)
                            .multilineTextAlignment(.center)
                    }
                    .padding()
                    .tag(index)
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            
            VStack {
                // Skip düyməsi — yuxarı sağda
                HStack {
                    Spacer()
                    Button("Skip") {
                        currentPage = slides.count - 1 
                    }
                        .foregroundStyle(Color.primaryDark)
                        .padding(.top, 50)
                        .padding(.trailing)
                }
                
                Spacer()
                
                // Next / Get Started düyməsi — aşağıda
                Button(currentPage == slides.count - 1 ? "Get Started" : "Next →") {
                    if currentPage < slides.count - 1 {
                        currentPage += 1
                    }
                }
                .foregroundStyle(.white)
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.primaryDark)
                .cornerRadius(28)
                .padding()
            }
        }
    }
}
