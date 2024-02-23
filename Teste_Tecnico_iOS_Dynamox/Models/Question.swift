//
//  Question.swift
//  Teste_Tecnico_iOS_Dynamox
//
//  Created by Vitor Gomes on 23/02/24.
//

import Foundation

struct Question: Codable {
    let id: String
    let statement: String
    let options: [String]
}
