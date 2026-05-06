//
//  ForgotPasswordView.swift
//  CalixyAI
//
//  Created by Ibrahim Kolchi on 03.05.26.
//
import SwiftUI

struct ForgotPasswordView: View {
    @StateObject private var viewModel = ForgotPasswordViewModel()
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {
                
                // MARK: - Header
                VStack(alignment: .leading, spacing: 8) {
                    Text("Forgot password?")
                        .font(.system(size: 32, weight: .bold))
                        .foregroundColor(.primaryDark)
                    
                    Text("Enter your email address and we'll send you instructions to reset your password.")
                        .font(.system(size: 16))
                        .foregroundColor(.gray)
                        .fixedSize(horizontal: false, vertical: true)
                }
                .padding(.top, 60)
                .padding(.horizontal, 24)
                
                // MARK: - Email Input
                VStack(alignment: .leading, spacing: 8) {
                    Text("EMAIL ADDRESS")
                        .font(.system(size: 12, weight: .semibold))
                        .foregroundColor(.gray)
                    
                    HStack {
                        Image(systemName: "envelope")
                            .foregroundColor(.gray)
                        
                        TextField("e.g. name@wellness.com", text: $viewModel.email)
                            .keyboardType(.emailAddress)
                            .autocapitalization(.none)
                    }
                    .padding(16)
                    .background(Color.white)
                    .cornerRadius(12)
                    .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color(.systemGray5), lineWidth: 1))
                }
                .padding(.top, 32)
                .padding(.horizontal, 24)
                
                // MARK: - Secure Authentication Card
                HStack(spacing: 12) {
                    ZStack {
                        Circle()
                            .fill(Color.accentGreen)
                            .frame(width: 44, height: 44)
                        Image(systemName: "lock.shield.fill")
                            .foregroundColor(.white)
                    }
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Secure Authentication")
                            .font(.system(size: 14, weight: .bold))
                            .foregroundColor(.primaryDark)
                        
                        Text("Your data remains encrypted and private.")
                            .font(.system(size: 13))
                            .foregroundColor(.gray)
                    }
                }
                .padding(16)
                .background(Color.white)
                .cornerRadius(16)
                .padding(.top, 24)
                .padding(.horizontal, 24)
                
                // MARK: - Send Instructions Button
                Button(action: { viewModel.sendInstructions() }) {
                    Text("Send Instructions →")
                        .font(.system(size: 18, weight: .semibold))
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .frame(height: 56)
                        .background(Color.primaryDark)
                        .cornerRadius(30)
                }
                .padding(.top, 32)
                .padding(.horizontal, 24)
                
                // MARK: - Back to Login
                Button(action: { dismiss() }) {
                    Text("← Back to Login")
                        .font(.system(size: 15, weight: .semibold))
                        .foregroundColor(.accentGreen)
                }
                .frame(maxWidth: .infinity)
                .padding(.top, 16)
                .padding(.bottom, 40)
                
                // MARK: - CalixyAI Watermark
                Text("CalixyAI")
                    .font(.system(size: 14, weight: .medium))
                    .foregroundColor(.gray.opacity(0.5))
                    .frame(maxWidth: .infinity)
                    .padding(.bottom, 24)
            }
            .frame(minHeight: UIScreen.main.bounds.height * 0.85)
        }
        .background(Color.surfaceLight)
        .navigationBarHidden(true)
    }
}
