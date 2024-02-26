//
//  ScoreViewModel.swift
//  Teste_Tecnico_iOS_Dynamox
//
//  Created by Vitor Gomes on 26/02/24.
//

import SwiftUI

class ScoreViewModel: ObservableObject {
    @Published var userName: String
    @Published var score: Int
    
    init(userName: String, score: Int) {
        self.userName = userName
        self.score = score
    }
}
