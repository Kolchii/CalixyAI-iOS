//
//  VerifyEmailView.swift
//  CalixyAI
//
//  Created by Ibrahim Kolchi on 03.05.26.
//
import SwiftUI

struct VerifyEmailView: View {
    @StateObject private var viewModel = VerifyEmailViewModel()
    @Environment(\.dismiss) private var dismiss
    @FocusState private var focusedField: Int?
    
    var body: some View {
        ScrollView {
            VStack(spacing: 32) {
                
                // MARK: - Icon
                ZStack {
                    Circle()
                        .fill(Color.accentGreen.opacity(0.15))
                        .frame(width: 90, height: 90)
                    Image(systemName: "envelope.fill")
                        .font(.system(size: 36))
                        .foregroundColor(.accentGreen)
                }
                .padding(.top, 40)
                
                // MARK: - Header
                VStack(spacing: 8) {
                    Text("Verify your email.")
                        .font(.system(size: 28, weight: .bold))
                        .foregroundColor(.black)
                    
                    Text("We've sent a 6-digit code to your email address.")
                        .font(.system(size: 16))
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.center)
                }
                
                // MARK: - OTP Boxes
                HStack(spacing: 12) {
                    ForEach(0..<6, id: \.self) { index in
                        TextField("", text: $viewModel.otpDigits[index])
                            .frame(width: 48, height: 56)
                            .multilineTextAlignment(.center)
                            .font(.system(size: 24, weight: .bold))
                            .keyboardType(.numberPad)
                            .background(Color.white)
                            .cornerRadius(12)
                            .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color(.systemGray5), lineWidth: 1))
                            .focused($focusedField, equals: index)
                            .onChange(of: viewModel.otpDigits[index]) { newValue in
                                if newValue.count > 1 {
                                    viewModel.otpDigits[index] = String(newValue.last!)
                                }
                                if newValue.count == 1 && index < 5 {
                                    focusedField = index + 1
                                }
                            }
                    }
                }
                
                // MARK: - Verify Button
                Button(action: { viewModel.verify() }) {
                    Text("Verify")
                        .font(.system(size: 18, weight: .semibold))
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .frame(height: 56)
                        .background(Color.primaryDark)
                        .cornerRadius(30)
                }
                
                // MARK: - Links
                VStack(spacing: 8) {
                    Button("Resend Code") {
                        viewModel.resendCode()
                    }
                    .font(.system(size: 15, weight: .semibold))
                    .foregroundColor(.accentGreen)
                    
                    Button("Change Email") {
                        dismiss()
                    }
                    .font(.system(size: 15))
                    .foregroundColor(.gray)
                }
                
                // MARK: - Security Card
                HStack(spacing: 12) {
                    Image(systemName: "lock.fill")
                        .font(.system(size: 20))
                        .foregroundColor(.accentGreen)
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text("SECURITY FIRST")
                            .font(.system(size: 12, weight: .bold))
                            .foregroundColor(.accentGreen)
                        
                        Text("Your metabolic health data is encrypted and secure with CalixyAI.")
                            .font(.system(size: 13))
                            .foregroundColor(.gray)
                    }
                }
                .padding(16)
                .background(Color.white)
                .cornerRadius(16)
            }
            .padding()
        }
        .background(Color.surfaceLight)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: { dismiss() }) {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.black)
                }
            }
            ToolbarItem(placement: .principal) {
                Text("Verify")
                    .font(.system(size: 18, weight: .semibold))
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                Text("CalixyAI")
                    .font(.system(size: 18, weight: .semibold))
                    .foregroundColor(.accentGreen)
            }
        }
    }
}
