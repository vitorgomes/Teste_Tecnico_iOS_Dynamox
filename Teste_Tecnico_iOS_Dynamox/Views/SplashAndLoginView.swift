//
//  Splash2View.swift
//  Teste_Tecnico_iOS_Dynamox
//
//  Created by Vitor Gomes on 02/03/24.
//

import SwiftUI

struct SplashAndLoginView: View {
    
    let screenSize = UIScreen.main.bounds
    @State private var shouldAnimate: Bool = false
    @State private var shouldShowText: Bool = false
    @State private var presentLoginView: Bool = false
    @State private var moveUpHStack: Bool = false
    
    @State private var isQuizViewPresented = false
    @State private var userName = ""
    
    var body: some View {
        NavigationStack {
            ZStack {
                Image("splashBackground")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                    .frame(height: screenSize.height * 1) // I believe it was related to the screenshot i took from DynaPredict App but somehow .resizable() + .scaledToFill() + .ignoresSafeArea() was not filling the bottom safe area, so i had to add .frame(height)
                
                // TODO: Need to refactor this if else condition creating a dedicated custom view for the animated logo only
                if moveUpHStack {
                    VStack {
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
                                    .font(.system(size: 25))
                                    .foregroundColor(.white)
                                    .bold()
                                    .offset(x: shouldShowText ? -65 : 0, y: 0)
                                    .animation(
                                        Animation.easeInOut(duration: 1.0)
                                            .delay(1.5)
                                    )
                                    .onAppear {
                                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                                            presentLoginView = true
                                            moveUpHStack = true
                                        }
                                    }
                            }
                        }
                        VStack {
                        }
                        .frame(height: screenSize.height * 0.5)
                        NavigationLink(destination: QuizView(userName: userName), isActive: $isQuizViewPresented) {
                            EmptyView()
                        }
                    }
                } else {
                    VStack {
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
                                    .onAppear {
                                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                                            presentLoginView = true
                                            moveUpHStack = true
                                        }
                                    }
                            }
                        }
                    }
                    NavigationLink(destination: QuizView(userName: userName), isActive: $isQuizViewPresented) {
                        EmptyView()
                    }
                }
            }
            .sheet(isPresented: $presentLoginView) {
                LoginView(userName: $userName, isSheetPresented: $presentLoginView, isQuizViewPresented: $isQuizViewPresented)
                    .presentationDetents([.medium])
            }
            .navigationBarHidden(true)
        }
    }
}

#Preview {
    SplashAndLoginView()
}
