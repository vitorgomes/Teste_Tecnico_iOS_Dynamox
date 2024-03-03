//
//  ScoreView.swift
//  Teste_Tecnico_iOS_Dynamox
//
//  Created by Vitor Gomes on 22/02/24.
//

import SwiftUI
import SwiftData

struct ScoreView: View {
    let screenSize = UIScreen.main.bounds
    let userName: String
    let score: Int
    
    @Query private var players: [ScoreDataModel]
    
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
                    ForEach(players) { player in
                        HStack {
                            Text("**Player:** \(player.userName)")
                            Spacer()
                            Text("**Score:** \(player.score)")
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
