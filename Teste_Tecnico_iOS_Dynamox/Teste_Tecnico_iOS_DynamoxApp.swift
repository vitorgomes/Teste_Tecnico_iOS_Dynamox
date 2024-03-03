//
//  Teste_Tecnico_iOS_DynamoxApp.swift
//  Teste_Tecnico_iOS_Dynamox
//
//  Created by Vitor Gomes on 22/02/24.
//

import SwiftUI
import SwiftData

@main
struct Teste_Tecnico_iOS_DynamoxApp: App {
    var body: some Scene {
        WindowGroup {
            SplashAndLoginView()
        }
        .modelContainer(for: ScoreDataModel.self)
    }
}
