//
//  BlueBackgroundWhiteTitleEightyPercentWidthViewSizeStyle.swift
//  Teste_Tecnico_iOS_Dynamox
//
//  Created by Vitor Gomes on 26/02/24.
//

import SwiftUI

extension View {
    func dynamoxBlueBackgroundWhiteTitleEightyPercentWidthViewSizeStyleRoundedRectangleShape() -> some View {
        self
            .frame(width: UIScreen.main.bounds.width * 0.9, height: 48, alignment: .center)
            .bold()
            .foregroundStyle(.white)
            .background(Color("defaultBlue"))
            .clipShape(RoundedRectangle(cornerRadius: 10.0))
    }
}
