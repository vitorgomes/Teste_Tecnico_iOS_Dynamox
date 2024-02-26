//
//  ContentView.swift
//  Teste_Tecnico_iOS_Dynamox
//
//  Created by Vitor Gomes on 22/02/24.
//

import SwiftUI

struct HomeView: View {
    let screenSize = UIScreen.main.bounds
    
    @State private var userName: String = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                TextField("Digite seu nome ou apelido", text: $userName)
                    .frame(width: screenSize.width * 0.8, height: screenSize.height * 0.05, alignment: .center)
                    .border(.secondary)
                    .padding()
                
                NavigationLink(destination: QuizView(userName: userName)) {
                    Text("Iniciar")
                        .blueBackgroundWhiteTitleEightyPercentWidthViewSizeStyle()
                }
            }
        }
        .navigationTitle("Início")
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    NavigationStack {
        HomeView()
    }
}
