//
//  QuizView.swift
//  Teste_Tecnico_iOS_Dynamox
//
//  Created by Vitor Gomes on 22/02/24.
//

import SwiftUI

struct QuizView: View {
    let screenSize = UIScreen.main.bounds
    let userName: String
    
    // Quiz variables
    @State private var question: Question?
    @State private var selectedAnswerIndex: Int = 0
    @State private var result: Bool?
    @State private var questionsAnswered: Int = 0
    @State private var score: Int = 0
    @State private var isQuizCompleted: Bool = false
    let quizManager = QuizManager()
    
    var body: some View {
        VStack {
            if let question = question {
                Text(question.statement)
                    .padding()
                
                Picker(selection: $selectedAnswerIndex, label: Text("Respostas")) {
                    ForEach(0..<question.options.count, id: \.self) { index in
                        Text(question.options[index]).tag(index)
                    }
                }
                .pickerStyle(.inline)
                .padding()
                
                Button(action: submitAnswer) {
                    Text("Responder")
                        .frame(width: screenSize.width * 0.8, height: 48, alignment: .center)
                }
                .frame(width: screenSize.width * 0.8, height: 48, alignment: .center)
                .background(Color(.blue))
                .foregroundColor(.white)
                .padding()
                
                if let result = result {
                    Text(result ? "Resposta correta!" : "Resposta incorreta.")
                        .padding()
                }
            } else {
                ProgressView("Carregando...")
                    .onAppear(perform: fetchQuestion)
            }
        }
        .frame(width: screenSize.width * 0.8, height: screenSize.height * 1)
        .navigationTitle("Perguntas e Respostas")
        .navigationBarTitleDisplayMode(.inline)
        .fullScreenCover(isPresented: $isQuizCompleted) {
            ScoreView(userName: userName, score: score)
        }
    }
    
    func fetchQuestion() {
        quizManager.fetchQuestions { fetchedQuestion, error in
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
            
        quizManager.submitAnswer(questionId: question.id, answer: selectedAnswer) { result, error in
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
                        fetchQuestion()
                    }
                }
                
                
            }
        }
    }
}

#Preview {
    NavigationStack {
        QuizView(userName: "User")
    }
}


