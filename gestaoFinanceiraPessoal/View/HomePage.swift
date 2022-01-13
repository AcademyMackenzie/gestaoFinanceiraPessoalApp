//
//  HomePage.swift
//  gestaoFinanceiraPessoal
//
//  Created by Raphael Alkamim on 13/01/22.
//

import SwiftUI

struct HomePage: View {
    var moneySymbol: String
    var transactionsTitle: String
    
    var body: some View {
        ZStack(){
            Color("ViewBackgroundColor").ignoresSafeArea()
            
            VStack(){
                
                
                HStack(){
                    SavedMoneyButton(title: "Guardado", moneySymbol: moneySymbol, value: 1000, chartValue: 60)
                    
                    VStack(){
                        IncomingButton(title: "Entrada", moneySymbol: moneySymbol, value: 100000)
                        OutgoingButton(title: "Saída", moneySymbol: moneySymbol, value: 1000)
                    }
                }
                
                Text(transactionsTitle).font(.system(size: 28)).bold()
                    .foregroundColor(Color("BasicFontColor"))
                    .frame(alignment: .leading)
                
                List(){
                    
                }
            }
            
        }
    }
}

struct HomePage_Previews: PreviewProvider {
    static var previews: some View {
        HomePage(moneySymbol: "R$", transactionsTitle: "Últimas Transações")
    }
}

