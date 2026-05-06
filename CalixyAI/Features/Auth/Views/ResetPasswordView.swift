//
//  ResetPasswordSwift.swift
//  CalixyAI
//
//  Created by Ibrahim Kolchi on 03.05.26.
//
import SwiftUI

struct ResetPasswordView: View {
    @StateObject private var viewModel = ResetPasswordViewModel()
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {
                
                // MARK: - Header
                VStack(alignment: .leading, spacing: 8) {
                    Text("Reset password.")
                        .font(.system(size: 32, weight: .bold))
                        .foregroundColor(.primaryDark)
                    
                    Text("Create a new, strong password for your CalixyAI account.")
                        .font(.system(size: 16))
                        .foregroundColor(.gray)
                        .fixedSize(horizontal: false, vertical: true)
                }
                .padding(.top, 40)
                .padding(.horizontal, 24)
                
                // MARK: - New Password
                VStack(alignment: .leading, spacing: 8) {
                    Text("NEW PASSWORD")
                        .font(.system(size: 12, weight: .semibold))
                        .foregroundColor(.gray)
                    
                    HStack {
                        Group {
                            if viewModel.isNewPasswordVisible {
                                TextField("Password", text: $viewModel.newPassword)
                            } else {
                                SecureField("Password", text: $viewModel.newPassword)
                            }
                        }
                        Button {
                            viewModel.isNewPasswordVisible.toggle()
                        } label: {
                            Image(systemName: viewModel.isNewPasswordVisible ? "eye.slash" : "eye")
                                .foregroundColor(.gray)
                        }
                    }
                    .padding(16)
                    .background(Color.white)
                    .cornerRadius(12)
                    .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color(.systemGray5), lineWidth: 1))
                }
                .padding(.top, 32)
                .padding(.horizontal, 24)
                
                // MARK: - Confirm Password
                VStack(alignment: .leading, spacing: 8) {
                    Text("CONFIRM NEW PASSWORD")
                        .font(.system(size: 12, weight: .semibold))
                        .foregroundColor(.gray)
                    
                    HStack {
                        Group {
                            if viewModel.isConfirmPasswordVisible {
                                TextField("Password", text: $viewModel.confirmPassword)
                            } else {
                                SecureField("Password", text: $viewModel.confirmPassword)
                            }
                        }
                        Button {
                            viewModel.isConfirmPasswordVisible.toggle()
                        } label: {
                            Image(systemName: viewModel.isConfirmPasswordVisible ? "eye.slash" : "eye")
                                .foregroundColor(.gray)
                        }
                    }
                    .padding(16)
                    .background(Color.white)
                    .cornerRadius(12)
                    .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color(.systemGray5), lineWidth: 1))
                }
                .padding(.top, 20)
                .padding(.horizontal, 24)
                
                // MARK: - Password Requirements
                HStack(spacing: 8) {
                    RequirementChip(text: "8+ Characters", isMet: viewModel.hasMinLength)
                    RequirementChip(text: "One symbol", isMet: viewModel.hasSymbol)
                    RequirementChip(text: "One number", isMet: viewModel.hasNumber)
                }
                .padding(.top, 16)
                .padding(.horizontal, 24)
                
                // MARK: - Update Password Button
                Button(action: { viewModel.resetPassword() }) {
                    Text("Update Password →")
                        .font(.system(size: 18, weight: .semibold))
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .frame(height: 56)
                        .background(Color.primaryDark)
                        .cornerRadius(30)
                }
                .padding(.top, 32)
                .padding(.horizontal, 24)
                
                // MARK: - Security Quote Card
                VStack(alignment: .leading, spacing: 12) {
                    Text("❝❝")
                        .font(.system(size: 24, weight: .bold))
                        .foregroundColor(.accentGreen)
                    
                    Text("\"Your security is the foundation of your digital wellness journey.\"")
                        .font(.system(size: 15, weight: .medium))
                        .foregroundColor(.accentGreen)
                        .italic()
                    
                    HStack(spacing: 8) {
                        Rectangle()
                            .fill(Color.accentGreen)
                            .frame(width: 3, height: 32)
                        
                        VStack(alignment: .leading, spacing: 2) {
                            Text("CALIXYAI SECURITY PROTOCOL")
                                .font(.system(size: 11, weight: .bold))
                                .foregroundColor(.primaryDark)
                            Text("ENCRYPTED END-TO-END")
                                .font(.system(size: 11))
                                .foregroundColor(.gray)
                        }
                    }
                }
                .padding(20)
                .background(Color.white)
                .cornerRadius(16)
                .padding(.top, 24)
                .padding(.horizontal, 24)
                .padding(.bottom, 40)
            }
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
                Text("CalixyAI")
                    .font(.system(size: 18, weight: .semibold))
                    .foregroundColor(.accentGreen)
            }
        }
    }
}

// MARK: - Requirement Chip
struct RequirementChip: View {
    let text: String
    let isMet: Bool
    
    var body: some View {
        HStack(spacing: 4) {
            Image(systemName: isMet ? "checkmark.circle.fill" : "circle")
                .font(.system(size: 12))
                .foregroundColor(isMet ? .white : .gray)
            Text(text)
                .font(.system(size: 12, weight: .medium))
                .foregroundColor(isMet ? .white : .gray)
        }
        .padding(.horizontal, 10)
        .padding(.vertical, 6)
        .background(isMet ? Color.accentGreen : Color.white)
        .cornerRadius(20)
        .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color(.systemGray4), lineWidth: isMet ? 0 : 1))
    }
}
