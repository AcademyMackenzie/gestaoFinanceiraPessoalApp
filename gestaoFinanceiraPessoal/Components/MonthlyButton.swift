//
//  MonthlyButton.swift
//  gestaoFinanceiraPessoal
//
//  Created by Raphael Alkamim on 19/01/22.
//

import SwiftUI

struct MonthlyButton: View {
    
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            VStack {
                
                Text("Messsssssss")
            }
            .frame(width: 310, height: 200)
            .background(Color("ElementsBackgroundColor"))
            .cornerRadius(10)
            .shadow(color: Color("ShadowColor"), radius: 0.8, x: 0.5, y: 0.5)
        }
    }
}

struct MonthlyButton_Previews: PreviewProvider {
    static var previews: some View {
        MonthlyButton() {
            
        }
    }
}
