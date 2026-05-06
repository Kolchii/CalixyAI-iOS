//
//  LoginView.swift
//  CalixyAI
//
//  Created by Ibrahim Kolchi on 03.05.26.
//
import SwiftUI

struct LoginView: View {
    @StateObject private var viewModel = LoginViewModel()
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {
                
                // MARK: - Header
                VStack(alignment: .leading, spacing: 8) {
                    Text("Welcome back.")
                        .font(.system(size: 32, weight: .bold))
                        .foregroundColor(.accentGreen)
                    
                    Text("Log in to continue tracking your progress.")
                        .font(.system(size: 16, weight: .regular))
                        .foregroundColor(.gray)
                        .fixedSize(horizontal: false, vertical: true)
                }
                .padding(.top, 40)
                .padding(.horizontal, 24)
                
                // MARK: - Email Input
                VStack(alignment: .leading, spacing: 8) {
                    Text("EMAIL ADDRESS")
                        .font(.system(size: 12, weight: .semibold))
                        .foregroundColor(.gray)
                    
                    HStack {
                        TextField("hello@calixy.ai", text: $viewModel.email)
                            .keyboardType(.emailAddress)
                            .autocapitalization(.none)
                        
                        Image(systemName: "envelope")
                            .foregroundColor(.gray)
                    }
                    .padding(16)
                    .background(Color.white)
                    .cornerRadius(12)
                    .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color(.systemGray5), lineWidth: 1))
                }
                .padding(.top, 32)
                .padding(.horizontal, 24)
                
                // MARK: - Password Input
                VStack(alignment: .leading, spacing: 8) {
                    HStack {
                        Text("PASSWORD")
                            .font(.system(size: 12, weight: .semibold))
                            .foregroundColor(.gray)
                        
                        Spacer()
                        
                        Button("Forgot password?") {
                            // sonra navigation əlavə edəcəyik
                        }
                        .font(.system(size: 12, weight: .semibold))
                        .foregroundColor(.accentGreen)
                    }
                    
                    HStack {
                        Group {
                            if viewModel.isPasswordVisible {
                                TextField("Password", text: $viewModel.password)
                            } else {
                                SecureField("Password", text: $viewModel.password)
                            }
                        }
                        
                        Button {
                            viewModel.isPasswordVisible.toggle()
                        } label: {
                            Image(systemName: viewModel.isPasswordVisible ? "eye.slash" : "eye")
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
                
                // MARK: - Log In Button
                Button(action: { viewModel.login() }) {
                    Text("Log In →")
                        .font(.system(size: 18, weight: .semibold))
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .frame(height: 56)
                        .background(
                            LinearGradient(
                                colors: [.signUpGradientStart, .signUpGradientEnd],
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                        )
                        .cornerRadius(30)
                }
                .padding(.top, 32)
                .padding(.horizontal, 24)
                
                // MARK: - OR Divider
                HStack {
                    Rectangle()
                        .fill(Color(.systemGray4))
                        .frame(height: 1)
                    Text("OR CONTINUE WITH")
                        .font(.system(size: 8, weight: .medium))
                        .foregroundColor(.gray)
                        .padding(.horizontal, 12)
                    Rectangle()
                        .fill(Color(.systemGray4))
                        .frame(height: 1)
                }
                .padding(.top, 24)
                .padding(.horizontal, 24)
                
                // MARK: - Social Buttons
                VStack(spacing: 12) {
                    Button(action: { viewModel.continueWithGoogle() }) {
                        HStack(spacing: 12) {
                            Image(systemName: "globe")
                                .font(.system(size: 18, weight: .medium))
                                .foregroundColor(.black)
                            Text("Continue with Google")
                                .font(.system(size: 16, weight: .semibold))
                                .foregroundColor(.black)
                        }
                        .frame(maxWidth: .infinity)
                        .frame(height: 56)
                        .background(Color.white)
                        .cornerRadius(30)
                        .overlay(
                            RoundedRectangle(cornerRadius: 30)
                                .stroke(Color(.systemGray4), lineWidth: 1.5)
                        )
                    }
                    
                    Button(action: { viewModel.continueWithApple() }) {
                        HStack(spacing: 12) {
                            Image(systemName: "apple.logo")
                                .font(.system(size: 18, weight: .medium))
                                .foregroundColor(.white)
                            Text("Continue with Apple")
                                .font(.system(size: 16, weight: .semibold))
                                .foregroundColor(.white)
                        }
                        .frame(maxWidth: .infinity)
                        .frame(height: 56)
                        .background(Color.black)
                        .cornerRadius(30)
                    }
                }
                .padding(.top, 16)
                .padding(.horizontal, 24)
                
                // MARK: - Sign Up Link
                HStack(spacing: 4) {
                    Text("Don't have an account?")
                        .font(.system(size: 15))
                        .foregroundColor(.gray)
                    Button(action: { dismiss() }) {
                        Text("Sign Up")
                            .font(.system(size: 15, weight: .semibold))
                            .foregroundColor(.accentGreen)
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.top, 20)
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
                Text("Welcome")
                    .font(.system(size: 18, weight: .semibold))
                    .foregroundColor(.black)
            }
        }
    }
}
