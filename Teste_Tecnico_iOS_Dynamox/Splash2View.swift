//
//  Splash2View.swift
//  Teste_Tecnico_iOS_Dynamox
//
//  Created by Vitor Gomes on 02/03/24.
//

import SwiftUI

struct Splash2View: View {
    
    let screeSize = UIScreen.main.bounds
    @State private var shouldAnimate = false
    @State private var shouldShowText = false
    
    var body: some View {
        ZStack {
            Image("splashBackground")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
                .frame(height: screeSize.height * 1) // I believe it was related to the screenshot i took from DynaPredict App but somehow .resizable() + .scaledToFill() + .ignoresSafeArea() was not filling the bottom safe area, so i had to add .frame(height)
            HStack(alignment: .center) {
                Image("dynaPredictCube")
                    .offset(x: shouldShowText ? -50 : 0, y: 0)
                    .scaleEffect(shouldAnimate ? 0.2 : 0.4)
                    .onAppear {
                        withAnimation(Animation.easeInOut(duration: 1.0).repeatCount(2, autoreverses:  true)) {
                            self.shouldAnimate = true
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                            self.shouldShowText = true
                        }
                    }
                if shouldShowText {
                    Text("Quiz")
                        .foregroundColor(.white)
                        .bold()
                        .offset(x: shouldShowText ? -65 : 0, y: 0)
                        .animation(
                            Animation.easeInOut(duration: 1.0)
                                .delay(1.5)
                        )
                }
            }
        }
    }
}

#Preview {
    Splash2View()
}
