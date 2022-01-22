//
//  TransactionsList.swift
//  gestaoFinanceiraPessoal
//
//  Created by Raphael Alkamim on 13/01/22.
//

import SwiftUI

struct TransactionsCell: View {
    @State var title: String
    @State var value: Double
    @State var transactionSymbol: String
    var moneySymbol: String  = "R$"
    @State var transactionColorName: String = "ColorGreen"
    
    
    var body: some View {
        HStack {
//            Circle()
//                .foregroundColor(Color("ElementsBackgroundColor"))
//                .frame(width: 20, height: 20)
            Text(title).font(.system(size: 16))
                .padding(.leading, 10)
                .frame(width: 150, height: 30, alignment: .leading)
                .foregroundColor(Color("BasicFontColor"))
            
            Spacer()
            
            Text(String(moneySymbol)).font(.system(size: 16))
                .foregroundColor(Color(transactionColorName))
            
            Text(String(value)).font(.system(size: 16))
                .foregroundColor(Color(transactionColorName))
            
            Text(transactionSymbol).bold().font(.system(size: 17)).bold()
                .padding(.trailing, 16)
                .foregroundColor(Color(transactionColorName))
            
            
        }
        
        
        
    }
    
    func transactionColor() {
        if transactionSymbol == "incoming" {
            transactionColorName = "GreenColor"
            transactionSymbol = "+"
            
        } else if  transactionSymbol == "outgoing" {
            transactionColorName = "RedColor"
            transactionSymbol = "-"
            
        } else {
            transactionColorName = "BlueColor"
            transactionSymbol = "+"
        }
        
    }
    
}


struct TransactionsCell_Previews: PreviewProvider {
    static var previews: some View {
        TransactionsCell(title: "Salário", value: 1000000000, transactionSymbol: "+", transactionColorName: "RedColor")
    }
}
