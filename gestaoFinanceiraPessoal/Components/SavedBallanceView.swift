//
//  SavedBallanceView.swift
//  gestaoFinanceiraPessoal
//
//  Created by Raphael Alkamim on 17/01/22.
//

import SwiftUI
import Foundation

struct SavedBallenceView: View {
    var goalToSave: Double
    var ballanceSavedMoney: Double
    
    var body: some View {
        
        VStack() {
            HStack() {
                Text("Meta Total")
                    .font(.system(size: 15))
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text("R$")
                    .font(.system(size: 15)).bold()
                    .foregroundColor(Color("SavedMoneyChartColor"))
                Text(String(goalToSave))
                    .font(.system(size: 15)).bold()
                    .foregroundColor(Color("SavedMoneyChartColor"))
            }
            
            HStack() {
                Text("Total Guardado")
                    .font(.system(size: 15))
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text("R$")
                    .font(.system(size: 24)).bold()
                    .foregroundColor(Color("BlueColor"))
                Text(String(ballanceSavedMoney))
                    .font(.system(size: 24)).bold()
                    .foregroundColor(Color("BlueColor"))
            }
            
        }
    }
}

struct SavedBallenceView_Previews: PreviewProvider {
    static var previews: some View {
        SavedBallenceView(goalToSave: 100000, ballanceSavedMoney: 10000)
            .preferredColorScheme(.dark)
    }
}

