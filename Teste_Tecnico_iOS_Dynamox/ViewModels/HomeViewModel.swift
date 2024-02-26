//
//  HomeViewModel.swift
//  Teste_Tecnico_iOS_Dynamox
//
//  Created by Vitor Gomes on 26/02/24.
//

import SwiftUI

class HomeViewModel: ObservableObject {
    @Published var userName: String = ""
    
    func saveUserName(_ name: String) {
        userName = name
    }
}
