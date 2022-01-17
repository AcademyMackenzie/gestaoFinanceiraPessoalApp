//
//  IncomingDisplay.swift
//  gestaoFinanceiraPessoal
//
//  Created by Raphael Alkamim on 13/01/22.
//

import SwiftUI

struct TransactionDisplay: View {
    var moneySymbol: String
    var transactionSymbol: String
    var transactionColor: String
    @State var transactionValue: Double
    
    let formatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.locale = Locale(identifier: "pt_BR")
        formatter.minimumFractionDigits = 2
        return formatter
    }()
    
    var body: some View {
        HStack {
            Text(moneySymbol).font(.system(size: 36)).bold()
                .foregroundColor(Color(transactionColor))
                .padding(.leading,10)
            
            TextField("",value: $transactionValue, formatter: formatter)
                .font(.system(size: 36, weight: .bold))
                .foregroundColor(Color(transactionColor))
                .multilineTextAlignment(.trailing)
                
            
            Text(transactionSymbol).font(.system(size: 36)).bold()
                .foregroundColor(Color(transactionColor))
                .padding(.trailing,10)
        }
        .frame(width: 330, height: 80)
        .background(Color("ElementsBackgroundColor"))
        .cornerRadius(10)
    }
}

struct TransactionDisplay_Previews: PreviewProvider {
    static var previews: some View {
        TransactionDisplay(moneySymbol: "R$", transactionSymbol: "+",transactionColor: "GreenColor", transactionValue: 1100)
    }
}