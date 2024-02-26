//
//  BlueBackgroundWhiteTitleEightyPercentWidthViewSizeStyle.swift
//  Teste_Tecnico_iOS_Dynamox
//
//  Created by Vitor Gomes on 26/02/24.
//

import SwiftUI

extension View {
    func blueBackgroundWhiteTitleEightyPercentWidthViewSizeStyle() -> some View {
        self
            .frame(width: UIScreen.main.bounds.width * 0.8, height: 48, alignment: .center)
            .background(Color.blue)
            .foregroundColor(.white)
    }
}
