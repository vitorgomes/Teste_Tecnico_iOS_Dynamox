//
//  LoginView.swift
//  Teste_Tecnico_iOS_Dynamox
//
//  Created by Vitor Gomes on 02/03/24.
//

import SwiftUI

struct LoginView: View {
    
    let screenSize = UIScreen.main.bounds
    @Binding var userName: String
    @Binding var isSheetPresented: Bool
    @Binding var isQuizViewPresented: Bool
    
    var body: some View {
        
        NavigationStack {
            Spacer()
            
            VStack(alignment: .center, spacing: 0) {
                Text("Olá!")
                    .bold()
                    .foregroundStyle(Color("defaultBlue"))
                    .font(.system(size: 24))
                    .padding([.bottom, .top], 32)
                
                TextField("Digite seu nome ou apelido", text: $userName)
                    .frame(width: screenSize.width * 0.9, height: 48)
                
                Divider()
                    .frame(width: screenSize.width * 0.9)
                    .padding(.bottom, 16)
                
                Button {
                    isSheetPresented = false
                    isQuizViewPresented = true
                } label: {
                    Text("INICIAR")
                        .dynamoxBlueBackgroundWhiteTitleEightyPercentWidthViewSizeStyleRoundedRectangleShape()
                }
                
                Spacer()
                
                Text("Versão 1.0")
                    .foregroundStyle(.gray)
            }
            .frame(width: screenSize.width * 1, height: screenSize.height * 0.51)
            .background(Color(.white))
        }
        
    }
}

#Preview {
    LoginView(userName: .constant("user"), isSheetPresented: .constant(false), isQuizViewPresented: .constant(false))
}
