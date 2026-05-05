//
//  RegisterView.swift
//  CalixyAI
//
//  Created by Ibrahim Kolchi on 03.05.26.
//
import SwiftUI
import AuthenticationServices

struct RegisterView: View {
    @StateObject private var viewModel = RegisterViewModel()
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {
                
                // MARK: - Header
                VStack(alignment: .leading, spacing: 8) {
                    Text("Create your account.")
                        .font(.system(size: 32, weight: .bold))
                        .foregroundColor(.black)
                    
                    Text("Join CalixyAI and start your wellness journey.")
                        .font(.system(size: 16, weight: .regular))
                        .foregroundColor(.gray)
                        .fixedSize(horizontal: false, vertical: true)
                }
                .padding(.top, 40)
                .padding(.horizontal, 24)
                
                // MARK: - Form Fields
                VStack(spacing: 20) {
                    
                    // Full Name
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Full Name")
                            .font(.system(size: 14, weight: .semibold))
                            .foregroundColor(.black)
                        
                        TextField("Enter your full name", text: $viewModel.fullName)
                            .padding(16)
                            .background(Color.white)
                            .cornerRadius(12)
                            .overlay(
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(Color(.systemGray5), lineWidth: 1)
                            )
                    }
                    
                    // Email
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Email")
                            .font(.system(size: 14, weight: .semibold))
                            .foregroundColor(.black)
                        
                        TextField("name@example.com", text: $viewModel.email)
                            .keyboardType(.emailAddress)
                            .autocapitalization(.none)
                            .padding(16)
                            .background(Color.white)
                            .cornerRadius(12)
                            .overlay(
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(Color(.systemGray5), lineWidth: 1)
                            )
                    }
                    
                    // Password
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Password")
                            .font(.system(size: 14, weight: .semibold))
                            .foregroundColor(.black)
                        
                        HStack {
                            Group {
                                if viewModel.isPasswordVisible {
                                    TextField("Password", text: $viewModel.password)
                                } else {
                                    SecureField("Password", text: $viewModel.password)
                                }
                            }
                            .padding(.leading, 16)
                            
                            Button(action: {
                                viewModel.isPasswordVisible.toggle()
                            }) {
                                Image(systemName: viewModel.isPasswordVisible ? "eye.slash" : "eye")
                                    .foregroundColor(.gray)
                                    .padding(.trailing, 16)
                            }
                        }
                        .frame(height: 52)
                        .background(Color.white)
                        .cornerRadius(12)
                        .overlay(
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(Color(.systemGray5), lineWidth: 1)
                        )
                    }
                }
                .padding(.top, 32)
                .padding(.horizontal, 24)
                
                // MARK: - Sign Up Button
                Button(action: { viewModel.register() }) {
                    Text("Sign Up")
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
                    Text("OR")
                        .font(.system(size: 13, weight: .medium))
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
                    
                    // Google Sign Up bunu sdkya tulluyacig heleki bele qalsin
                    Button(action: { viewModel.signInWithGoogle() }) {
                        HStack(spacing: 12) {
                            Image(systemName: "globe")
                                .font(.system(size: 18, weight: .medium))
                                .foregroundColor(.black)
                            Text("Sign up with Google")
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
                    
                    // Apple Sign In
                    Button(action: { viewModel.signInWithApple() }) {
                        HStack(spacing: 12) {
                            Image(systemName: "apple.logo")
                                .font(.system(size: 18, weight: .medium))
                                .foregroundColor(.white)
                            Text("Sign up with Apple")
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
                
                // MARK: - Log In Link
                HStack(spacing: 4) {
                    Text("Already have an account?")
                        .font(.system(size: 15))
                        .foregroundColor(.gray)
                    Button(action: { dismiss() }) {
                        Text("Log In")
                            .font(.system(size: 15, weight: .semibold))
                            .foregroundColor(.accentGreen)
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.top, 20)
                
                // MARK: - Terms icine pox olmus heleki yoxdu
                Group {
                    Text("By signing up, you agree to our ")
                        .foregroundColor(.gray)
                    + Text("Terms of Service")
                        .foregroundColor(.accentGreen)
                        .underline()
                    + Text(" and Privacy Policy.")
                        .foregroundColor(.gray)
                }
                .font(.system(size: 12))
                .multilineTextAlignment(.center)
                .padding(.top, 8)
                .padding(.horizontal, 32)
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
