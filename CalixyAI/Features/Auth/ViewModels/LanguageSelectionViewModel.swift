//
//  LanguageSelectionViewModel.swift
//  CalixyAI
//
//  Created by Ibrahim Kolchi on 06.05.26.
//
import SwiftUI
import Combine

final class LanguageSelectionViewModel: ObservableObject {
    
    // MARK: - Input
    @Published var selectedLanguage: String = "EN"
    
    // MARK: - Actions
    func saveLanguage() {
    }
}
