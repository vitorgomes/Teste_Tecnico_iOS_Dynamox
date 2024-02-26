//
//  SplashView.swift
//  Teste_Tecnico_iOS_Dynamox
//
//  Created by Vitor Gomes on 26/02/24.
//

import SwiftUI

struct SplashView: View {
    let screenSize = UIScreen.main.bounds
    
    @State private var scaleFactor: CGFloat = 1.0
    @State private var showHomeView = false
    
    var body: some View {
        VStack {
            Image("dynamox_logo")
                .resizable()
                .scaledToFit()
                .frame(width: screenSize.width * 0.5 * scaleFactor, height: screenSize.height * 0.5 * scaleFactor, alignment: .center)
                .onAppear {
                    withAnimation(.easeInOut(duration: 2)) {
                        scaleFactor *= 1.2
                    }
                }
        }
        .navigationBarHidden(true)
        .onReceive(Timer.publish(every: 2, on: .main, in: .common).autoconnect()) { _ in
            self.showHomeView = true
        }
        .fullScreenCover(isPresented: $showHomeView) {
            HomeView()
        }
    }
}

#Preview {
    SplashView()
}
