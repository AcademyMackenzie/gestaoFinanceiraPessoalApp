//
//  SavedMoneyButton.swift
//  gestaoFinanceiraPessoal
//
//  Created by Raphael Alkamim on 12/01/22.
//

import SwiftUI

struct SavedMoneyButton: View {
    var title: String
    var moneySymbol: String
    var value: Double
    var chartValue: Double
    
    var body: some View {
        VStack(){
            
            HStack(){
                Text(title).font(.system(size: 13))
                    .frame(width: 100, height: 15, alignment: .leading)
                    .foregroundColor(Color("BasicFontColor"))
                
                
                Spacer()
                Image(systemName: "plus.circle.fill")
                    .frame(width: 15, height: 15, alignment: .trailing)
                    .foregroundColor(Color("BlueColor"))
                
                
            }
            .frame(width: 130, height: 15, alignment: .center)
            .padding(.top, 15)
            
            
            HStack(){
                Text(moneySymbol).font(.system(size: 17).bold())
                    .frame(width: 25, height: 20, alignment: .leading)
                    .foregroundColor(Color("BlueColor"))
                
                
                Text(String(value)).font(.system(size: 17).bold())
                    .frame(width: 95, height: 20, alignment: .leading)
                    .foregroundColor(Color("BlueColor"))
                
                
            }
            .frame(width: 130, height: 20, alignment: .bottom)
            .padding(.bottom, 10)
            
            Spacer()
            
            HStack(){
                SavedChart(valueSaved: 100, percentageSaved: chartValue)
            }
            .padding(.bottom, 10)
            
        }
        .frame(width: 140, height: 140)
        .background(Color("ElementsBackgroundColor"))
        .cornerRadius(10)
        .shadow(color: Color("ShadowColor"), radius: 0.8, x: 0.5, y: 0.5)
    }
    
}

struct SavedMoneyButton_Previews: PreviewProvider {
    static var previews: some View {
        SavedMoneyButton(title: "Guardado", moneySymbol: "R$", value: 100, chartValue: 15)
    }
}
