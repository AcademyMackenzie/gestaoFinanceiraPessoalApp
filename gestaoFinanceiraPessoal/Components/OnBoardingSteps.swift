//
//  SwiftUIView.swift
//  gestaoFinanceiraPessoal
//
//  Created by Raphael Alkamim on 13/01/22.
//

import SwiftUI

struct OnBoardingSteps: View {
    var image: String
    var title: String
    var description: String

    var body: some View {
        HStack {
            Image(systemName: image)
                .font(.system(size: 36, design: .rounded))
                .frame(width: 40, height: 50)
                .padding()
            VStack(alignment: .leading){
                Text(title)
                    .font(.system(size: 18, design: .rounded))
                .bold()
                Text(description)
                    .font(.system(size: 18, design: .rounded))
            }
        }.padding()
    }
}

struct OnBoardingSteps_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingSteps(image: "plus.circle.fill", title: "Controle de entrada", description: "Controle o fluxo de entrada em suas contas.")
    }
}
