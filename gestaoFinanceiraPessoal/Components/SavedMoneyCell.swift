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
    var moneyToSave: Double
    var moneyAlreadySaved: Double
    
    var action: () -> Void
    
    var body: some View {
        //Button
        Button(action: action) {
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
                    SavedMoneyCellChart(valueSaved: moneyAlreadySaved, totalToSave: moneyToSave)
                }
                .padding(.bottom, 10)
                
            }
            .frame(width: .infinity, height: 140)
            .background(Color("ElementsBackgroundColor"))
            .cornerRadius(10)
            .shadow(color: Color("ShadowColor"), radius: 0.8, x: 0.5, y: 0.5)
        }
    }
}

//struct SavedMoneyCell_Previews: PreviewProvider {
//    static var previews: some View {
//        SavedMoneyCell(title: "Comprar Iphone", moneySymbol: "R$", moneyToSave: 1000, moneyAlreadySaved: 500)
//}
//}
