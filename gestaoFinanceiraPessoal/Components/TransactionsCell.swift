//
//  TransactionsList.swift
//  gestaoFinanceiraPessoal
//
//  Created by Raphael Alkamim on 13/01/22.
//

import SwiftUI

struct TransactionsCell: View {
    var title: String
    var value: Double
    var transactionSymbol: String
    var transactionColor: Color
    
    var body: some View {
        HStack {
            Circle()
                .frame(width: 25, height: 25)
            Text(title).font(.system(size: 17))
                .padding(.leading, 15)
                .frame(width: 200, height: 30, alignment: .leading)
                .foregroundColor(Color("BasicFontColor"))

            Spacer()
            
            Text(String(value)).font(.system(size: 17))
                .foregroundColor(transactionColor)
            
            Text(transactionSymbol).bold().font(.system(size: 17)).bold()
                .padding(.trailing, 15)
                .foregroundColor(transactionColor)
            
            
        }
        
        
        
    }
    
}

struct TransactionsCell_Previews: PreviewProvider {
    static var previews: some View {
        TransactionsCell(title: "Salário", value: 100000, transactionSymbol: "+", transactionColor: Color("GreenColor"))
        TransactionsCell(title: "Compra de um carro ", value: 0, transactionSymbol: "-", transactionColor: Color("RedColor"))
    }
}
