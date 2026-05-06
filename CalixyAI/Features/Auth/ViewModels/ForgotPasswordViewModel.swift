//
//  ForgotPasswordViewModel.swift
//  CalixyAI
//
//  Created by Ibrahim Kolchi on 03.05.26.
//

import SwiftUI
import Combine
final class ForgotPasswordViewModel: ObservableObject {
   
    @Published var email: String = ""
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    
    func sendInstructions() {
        // API
    }

}
