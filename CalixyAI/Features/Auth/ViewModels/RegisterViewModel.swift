//
//  RegisterViewModel.swift
//  CalixyAI
//
//  Created by Ibrahim Kolchi on 03.05.26.
//

import SwiftUI
import Combine

final class RegisterViewModel: ObservableObject {
    
    // MARK: - Input
    @Published var fullName: String = ""
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var isPasswordVisible: Bool = false
    
    // MARK: - State
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil
    @Published var isRegistered: Bool = false
    
    // MARK: - Actions
    func register() {
        // NetworkManager hazır olanda
    }
    
    func signInWithGoogle() {
        // Firebase Google Sign
    }
    
    func signInWithApple() {
        // Apple Sign In
    }
}
