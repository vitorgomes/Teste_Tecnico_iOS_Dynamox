//
//  ScoreDataModel.swift
//  Teste_Tecnico_iOS_Dynamox
//
//  Created by Vitor Gomes on 26/02/24.
//

import Foundation
import SwiftData

@Model
class ScoreDataModel{
    var userName: String
    var score: Int
    
    init(userName: String, score: Int) {
        self.userName = userName
        self.score = score
    }
}
