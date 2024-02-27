//
//  QuizView.swift
//  Teste_Tecnico_iOS_Dynamox
//
//  Created by Vitor Gomes on 22/02/24.
//

import SwiftUI

struct QuizView: View {
    @Environment(\.modelContext) var context
    
    let screenSize = UIScreen.main.bounds
    let userName: String
    
    @StateObject var quizViewModel = QuizViewModel(quizManager: QuizManager())
    
    var body: some View {
        NavigationStack {
            VStack {
                if let question = quizViewModel.question {
                    Text(question.statement)
                        .padding()
                    
                    Picker(selection: $quizViewModel.selectedAnswerIndex, label: Text("Respostas")) {
                        ForEach(0..<question.options.count, id: \.self) { index in
                            Text(question.options[index]).tag(index)
                        }
                    }
                    .pickerStyle(.inline)
                    .padding()
                    
                    Button(action: quizViewModel.submitAnswer) {
                        Text("Responder")
                            .frame(width: screenSize.width * 0.8, height: 48, alignment: .center)
                    }
                    .blueBackgroundWhiteTitleEightyPercentWidthViewSizeStyle()
                    .padding()
                    
                    if let result = quizViewModel.result {
                        Text(result ? "Resposta correta!" : "Resposta incorreta.")
                            .padding()
                    }
                } else {
                    ProgressView("Carregando...")
                        .onAppear {
                            if quizViewModel.questionsAnswered == 0 {
                                quizViewModel.fetchQuestion()
                            }
                        }
                }
            }
            .onReceive(quizViewModel.$isQuizCompleted) { isCompleted in
                if isCompleted {
                    addPlayer()
                }
            }

            NavigationLink(destination: ScoreView(userName: userName, score: quizViewModel.score), isActive: $quizViewModel.isQuizCompleted) {
                EmptyView()
            }
        }
        
        .frame(width: screenSize.width * 0.8, height: screenSize.height * 1)
        .navigationTitle("Perguntas e Respostas")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    func addPlayer() {
        let player = ScoreDataModel(userName: userName, score: quizViewModel.score)
        context.insert(player)
    }
}

#Preview {
    NavigationStack {
        QuizView(userName: "User")
    }
}


