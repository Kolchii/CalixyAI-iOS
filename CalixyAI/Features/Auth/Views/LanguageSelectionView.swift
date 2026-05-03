//
//  LanguageSection.swift
//  CalixyAI
//
//  Created by Ibrahim Kolchi on 03.05.26.
//
import SwiftUI

struct LanguageSelectionView: View {
    @State private var selectedLanguage = "EN"
    
    var body: some View {
        VStack(spacing: 0) {
            
            // YUXARI — yaşıl hissə
            VStack(spacing: 8) {
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(.white.opacity(0.1))
                        .frame(width: 90, height: 90)
                    
                    Image("CalixyIconForLanguageScreen")
                        .resizable()
                        .frame(width: 60, height: 60)
                }
                Text("CalixyAI")
                    .foregroundStyle(.white)
                    .fontWeight(.bold)
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical, 80)
            .background(Color.primaryDark)
            
            // AŞAĞI — ağ hissə, yuxarı künclər yuvarlaq
            ScrollView {
                VStack(spacing: 12) {
                    Text("Choose Your Language")
                        .fontWeight(.bold)
                    Text("Select your preferred language for a personalized AI experience")
                        .font(.subheadline)
                        .foregroundStyle(.gray)
                        .multilineTextAlignment(.center)
                    
                    Button { selectedLanguage = "AZ" } label: {
                        HStack {
                            Text("🇦🇿")
                            Text("Azərbaycan")
                            Spacer()
                            Image(systemName: selectedLanguage == "AZ" ? "checkmark.circle.fill" : "circle")
                        }
                        .padding()
                        .background(.white)
                        .cornerRadius(12)
                        .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color.gray.opacity(0.3), lineWidth: 1))
                    }
                    .foregroundStyle(.black)
                    
                    Button { selectedLanguage = "TR" } label: {
                        HStack {
                            Text("🇹🇷")
                            Text("Türkçe")
                            Spacer()
                            Image(systemName: selectedLanguage == "TR" ? "checkmark.circle.fill" : "circle")
                        }
                        .padding()
                        .background(.white)
                        .cornerRadius(12)
                        .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color.gray.opacity(0.3), lineWidth: 1))
                    }
                    .foregroundStyle(.black)
                    
                    Button { selectedLanguage = "EN" } label: {
                        HStack {
                            Text("🇺🇸")
                            Text("English")
                            Spacer()
                            Image(systemName: selectedLanguage == "EN" ? "checkmark.circle.fill" : "circle")
                        }
                        .padding()
                        .background(.white)
                        .cornerRadius(12)
                        .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color.gray.opacity(0.3), lineWidth: 1))
                    }
                    .foregroundStyle(.black)
                    
                    Button { selectedLanguage = "RU" } label: {
                        HStack {
                            Text("🇷🇺")
                            Text("Русский")
                            Spacer()
                            Image(systemName: selectedLanguage == "RU" ? "checkmark.circle.fill" : "circle")
                        }
                        .padding()
                        .background(.white)
                        .cornerRadius(12)
                        .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color.gray.opacity(0.3), lineWidth: 1))
                    }
                    .foregroundStyle(.black)
                    
                    Button { } label: {
                        Text("Continue")
                            .foregroundStyle(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.primaryDark)
                            .cornerRadius(28)
                    }
                    
                    Text("You can change this later in settings")
                        .font(.caption)
                        .foregroundStyle(.gray)
                }
                .padding()
            }
            .background(.white)
            .cornerRadius(30, corners: [.topLeft, .topRight])
        }
        .ignoresSafeArea()
        .navigationBarHidden(true)
    }
}
