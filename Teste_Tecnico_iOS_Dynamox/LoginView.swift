//
//  LoginView.swift
//  Teste_Tecnico_iOS_Dynamox
//
//  Created by Vitor Gomes on 02/03/24.
//

import SwiftUI

struct LoginView: View {
    
    let screenSize = UIScreen.main.bounds
    @State private var userName: String = ""
    
    var body: some View {
        Spacer()
        
        VStack(alignment: .center) {
            Text("Olá!")
                .font(.system(size: 24))
                .padding(.bottom, 24)
            
            TextField("DIGITE SEU NOME OU APELIDO", text: $userName)
                .frame(width: screenSize.width * 0.9, height: 48)
                .border(.secondary)
                .clipShape(RoundedRectangle(cornerRadius: 10.0))
                .padding(.bottom, 8)
            
            Button {
                
            } label: {
                Text("INICIAR")
                    .foregroundStyle(.white)
                    .frame(width: screenSize.width * 0.9, height: 48)
                    .background(.black)
                    .clipShape(RoundedRectangle(cornerRadius: 10.0))
            }
        }
        .frame(width: screenSize.width * 1, height: screenSize.height * 0.5)
        .background(.blue)
        .clipShape(RoundedRectangle(cornerRadius: 15.0))
    }
}

#Preview {
    LoginView()
}
