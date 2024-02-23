//
//  ScoreView.swift
//  Teste_Tecnico_iOS_Dynamox
//
//  Created by Vitor Gomes on 22/02/24.
//

import SwiftUI

struct ScoreView: View {
    let screenSize = UIScreen.main.bounds
    let userName: String
    let score: Int
    
    var body: some View {
        VStack {
            Text("**\(userName)** sua pontuaçao foi de: **\(score)** pontos")
                .padding(.bottom, 8)

            // TODO: Not working. I believe it is because i am using fullScreenCover modifier on QuizView and some how is messing up NavigationStack order
            NavigationLink(destination: HomeView()) {
                Text("Reiniciar")
                    .frame(width: screenSize.width * 0.8, height: 48)
                    .background(Color(.blue))
                    .foregroundColor(.white)
            }
        }
        .frame(width: screenSize.width * 0.8)
        .navigationTitle("Pontuação")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        ScoreView(userName: "User", score: 0)
    }
}
