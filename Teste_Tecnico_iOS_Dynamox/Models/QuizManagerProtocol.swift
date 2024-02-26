//
//  QuizManagerProtocol.swift
//  Teste_Tecnico_iOS_Dynamox
//
//  Created by Vitor Gomes on 26/02/24.
//

import Foundation

protocol QuizManagerProtocol {
    func fetchQuestions(completion: @escaping (Question?, Error?) -> Void)
    func submitAnswer(questionId: String, answer: String, completion: @escaping (Bool?, Error?) -> Void)
}
