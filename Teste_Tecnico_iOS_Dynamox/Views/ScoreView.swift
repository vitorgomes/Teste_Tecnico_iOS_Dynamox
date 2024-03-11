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
    
    private let screenSize = UIScreen.main.bounds
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
                        .padding(.bottom, 16)
                }
                
                ZStack {
                    Circle()
                        .trim(from: 0.0, to: 0.7)
                        .stroke(Color.defaultBlue, style: StrokeStyle(lineWidth: 8, lineCap: .round))
                        .frame(width: screenSize.width * 0.4, height: screenSize.height * 0.2)
                        .rotationEffect(.degrees(-215))
                    
                    Text("\(score)")
                        .foregroundStyle(.blue)
                        .font(.system(size: 24))
                        .bold()
                    
                    Circle()
                        .trim(from: 0.0, to: CGFloat(score * 10) / (100 / 0.7))
                        .stroke(Color.blue, style: StrokeStyle(lineWidth: 8, lineCap: .round))
                        .frame(width: screenSize.width * 0.4, height: screenSize.height * 0.2)
                        .rotationEffect(.degrees(-215))
                }
                
                Text("Pontos")
                    .foregroundStyle(.blue)
                    .padding(.bottom, 16)
                
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
