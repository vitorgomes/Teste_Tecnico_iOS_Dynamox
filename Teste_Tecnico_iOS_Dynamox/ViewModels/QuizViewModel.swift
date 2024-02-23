//
//  QuizViewModel.swift
//  Teste_Tecnico_iOS_Dynamox
//
//  Created by Vitor Gomes on 23/02/24.
//

import Foundation

class QuizViewModel: ObservableObject {
    @Published var question: Question?
    @Published var selectedAnswerIndex: Int = 0
    @Published var result: Bool?
    @Published var score: Int = 0
    @Published var isQuizCompleted: Bool = false
    @Published var questionsAnswered: Int = 0
    
    private let quizManager: QuizManager
    
    init(quizManager: QuizManager) {
        self.quizManager = quizManager
    }
    
    func fetchQuestion() {
        quizManager.fetchQuestions { [weak self] fetchedQuestion, error in
            guard let self = self else { return }
            if let error = error {
                print("Erro ao buscar pergunta: \(error)")
            } else if let fetchedQuestion = fetchedQuestion {
                self.question = fetchedQuestion
            }
        }
    }
    
    func submitAnswer() {
        guard let question = question else { return }
        let selectedAnswer = question.options[selectedAnswerIndex]
            
        quizManager.submitAnswer(questionId: question.id, answer: selectedAnswer) { [weak self] result, error in
            guard let self = self else { return }
            if let error = error {
                print("Erro ao submeter resposta: \(error)")
            } else if let result = result {
                self.result = result
                
                if result {
                    self.score += 1
                }
                
                self.questionsAnswered += 1
                
                if self.questionsAnswered >= 10 {
                    self.isQuizCompleted = true
                } else {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        self.question = nil
                        self.result = nil
                        self.fetchQuestion()
                    }
                }
            }
        }
    }
}
