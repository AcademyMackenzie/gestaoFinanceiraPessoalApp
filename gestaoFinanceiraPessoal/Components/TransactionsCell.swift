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
    @State var transactionSymbol: String = "incoming"
    var moneySymbol: String  = "R$"
    @State var transactionColorName: String = "BlueColor"
    
    
    var body: some View {
        HStack {
            Text(title).font(.system(size: 16))
                .padding(.leading, 10)
                .frame(width: 150, height: 30, alignment: .leading)
                .foregroundColor(Color("BasicFontColor"))
            
            Spacer()
            
            Text(String(moneySymbol)).font(.system(size: 16))
                .foregroundColor(transactionColor(color: self.transactionSymbol))
            
            Text(String(value)).font(.system(size: 16))
                .foregroundColor(transactionColor(color: self.transactionSymbol))
            
            Text(transactionSymbol(symbol: self.transactionSymbol)).bold().font(.system(size: 17)).bold()
                .padding(.trailing, 16)
                .foregroundColor(transactionColor(color: self.transactionSymbol))
            
            
        }
        
        
        
    }
    
    func transactionColor(color: String) -> Color {
        if color == "incoming" {
            return Color("GreenColor")
            
        } else if  color == "outgoing" {
            return Color("RedColor")
            
        } else {
            return Color("BlueColor")
        }
        
    }
    
    func transactionSymbol(symbol: String) -> String {
        if symbol == "outgoing" {
            return "-"
        } else {
            return "+"
        }
        
    }
    
    
}

//
//struct TransactionsCell_Previews: PreviewProvider {
//    static var previews: some View {
//        TransactionsCell(title: "Salário", value: 1000000000, transactionSymbol: "incoming", transactionColorName: "RedColor")
//    }
//}
