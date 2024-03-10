//
//  ScoreView.swift
//  Teste_Tecnico_iOS_Dynamox
//
//  Created by Vitor Gomes on 22/02/24.
//

import SwiftUI
import RealmSwift

struct ScoreView: View {
    @ObservedResults(ScoreDataModel.self) var scoresDataModel
    
    let screenSize = UIScreen.main.bounds
    let userName: String
    let score: Int
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("**\(userName)** sua pontuaçao foi de: **\(score)** pontos")
                    .padding(.bottom, 8)

                NavigationLink(destination: SplashAndLoginView()) {
                    Text("REINICIAR")
                        .dynamoxBlueBackgroundWhiteTitleEightyPercentWidthViewSizeStyleRoundedRectangleShape()
                        .padding()
                }
                
                Text("**Tabela de Scores**")
                
                List {
                    ForEach(scoresDataModel, id: \.id) { scoreDataModel in
                        HStack {
                            Text("**Player:** \(scoreDataModel.userName)")
                            Spacer()
                            Text("**Score:** \(scoreDataModel.score)")
                        }
                    }
                }
            }
        }
        .frame(width: screenSize.width * 0.9)
        .navigationTitle("Pontuação")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    NavigationStack {
        ScoreView(userName: "User", score: 0)
    }
}
