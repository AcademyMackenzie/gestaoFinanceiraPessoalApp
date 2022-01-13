//
//  BasicButton.swift
//  gestaoFinanceiraPessoal
//
//  Created by Raphael Alkamim on 13/01/22.
//

import SwiftUI

struct BasicButton: View {
    var title: String

    var body: some View {
        
        Text(title).font(.system(size: 20)).bold()
            .frame(width: 280, height: 40)
            .background(Color("ButtonColor"))
            .foregroundColor(Color("ViewBackgroundColor"))
            .cornerRadius(10)
            .shadow(color: Color("ShadowColor"), radius: 0.8, x: 0.5, y: 0.5)
    }
}

struct BasicButton_Previews: PreviewProvider {
    static var previews: some View {
        BasicButton(title: "COMEÇAR")
            .preferredColorScheme(.dark)
    }
}
