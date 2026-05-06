//
//  VerifyEmailViewModel.swift
//  CalixyAI
//
//  Created by Ibrahim Kolchi on 03.05.26.
//
import SwiftUI
import Combine

final class VerifyEmailViewModel: ObservableObject {
    
    // MARK: - Input
    @Published var otpDigits: [String] = Array(repeating: "", count: 6)
    
    // MARK: - State
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil
    
    var otpCode: String {
        otpDigits.joined()
    }
    // MARK: - Actions
    func verify() {
        // API
    }
    
    func resendCode() {
        // Kodu yeniden gonder
    }
}
