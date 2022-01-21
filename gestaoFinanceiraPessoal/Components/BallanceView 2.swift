//
//  BallanceView.swift
//  gestaoFinanceiraPessoal
//
//  Created by Raphael Alkamim on 17/01/22.
//

import SwiftUI

struct BallanceView: View {
    var savedValue: Double
    var month: String
    var ballanceValue: Double
    
    var body: some View {
        
        VStack() {
            HStack() {
                Text("Guardado")
                    .font(.system(size: 15))
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text("R$")
                    .font(.system(size: 15)).bold()
                    .foregroundColor(Color("BlueColor"))
                Text(String(savedValue))
                    .font(.system(size: 15)).bold()
                    .foregroundColor(Color("BlueColor"))
            }
            
            HStack() {
                Text("Balanço de \(month)")
                    .font(.system(size: 15))
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text("R$")
                    .font(.system(size: 24)).bold()
                    .foregroundColor(Color("SavedMoneyChartColor"))
                Text(String(ballanceValue))
                    .font(.system(size: 24)).bold()
                    .foregroundColor(Color("SavedMoneyChartColor"))
            }
            
        }
    }
}

struct BallanceView_Previews: PreviewProvider {
    static var previews: some View {
        BallanceView(savedValue: 10000, month: "Janeiro", ballanceValue: 10000)
    }
}
