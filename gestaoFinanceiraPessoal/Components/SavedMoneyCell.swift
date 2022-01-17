//
//  SavedMoneyCell.swift
//  gestaoFinanceiraPessoal
//
//  Created by Raphael Alkamim on 17/01/22.
//

import SwiftUI

struct SavedMoneyCell: View {
    var title: String
    var moneySymbol: String
    var value: Double
    var chartValue: Double
    
    var body: some View {
        //Button
        Button(action:{
            print("oi")
        }) {
            VStack(){
                
                HStack(){
                    Text(title).font(.system(size: 17))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundColor(Color("BasicFontColor"))
                    
                    Image(systemName: "plus.circle.fill")
                        .frame(width: 15, height: 15, alignment: .trailing)
                        .foregroundColor(Color("BlueColor"))
                    
                    
                }
                .frame( alignment: .center)
                .padding([.trailing, .leading], 15)
                .padding(.top, 10)
                
                Spacer()
                
                HStack(){
                    SavedMoneyCellChart(valueSaved: 12, percentageSaved: 12, totalToSave: 100)
                }
                .padding(.bottom, 10)
                
            }
            .frame(width: 300, height: 140)
            .background(Color("ElementsBackgroundColor"))
            .cornerRadius(10)
            .shadow(color: Color("ShadowColor"), radius: 0.8, x: 0.5, y: 0.5)
        }
    }
}

struct SavedMoneyCell_Previews: PreviewProvider {
    static var previews: some View {
        SavedMoneyCell(title: "Comprar Iphone novo ", moneySymbol: "R$", value: 1000, chartValue: 1000)
    }
}
