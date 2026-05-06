//
//  ResetPasswordViewModel.swift
//  CalixyAI
//
//  Created by Ibrahim Kolchi on 03.05.26.
//
import SwiftUI
import Combine

final class ResetPasswordViewModel: ObservableObject {
    
    // MARK: - Input
    @Published var newPassword: String = ""
    @Published var confirmPassword: String = ""
    @Published var isNewPasswordVisible: Bool = false
    @Published var isConfirmPasswordVisible: Bool = false
    
    // MARK: - State
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil
    @Published var isPasswordReset: Bool = false
    
    // MARK: - Validation
    var hasMinLength: Bool { newPassword.count >= 8 }
    var hasSymbol: Bool { newPassword.contains(where: { "!@#$%^&*".contains($0) }) }
    var hasNumber: Bool { newPassword.contains(where: { $0.isNumber }) }
    
    // MARK: - Actions
    func resetPassword() {
        // API çağırışı buraya
    }
}
