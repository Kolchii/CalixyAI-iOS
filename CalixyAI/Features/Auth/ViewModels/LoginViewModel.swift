//
//  LoginViewModel.swift
//  CalixyAI
//
//  Created by Ibrahim Kolchi on 03.05.26.
//

import SwiftUI
import Combine

final class LoginViewModel: ObservableObject {
    
    // MARK: Input
    
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var isPasswordVisible: Bool = false
    
    // MARK: State
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil
    @Published var isLoggedIn: Bool = false
    
    // MARK: Actions
    func login() {
        
    }
    
    func continueWithGoogle() {
        
    }
    
    func continueWithApple() {
        
    }
}
