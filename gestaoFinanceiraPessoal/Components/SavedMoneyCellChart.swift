//
//  SavedMoneyCellChart.swift
//  gestaoFinanceiraPessoal
//
//  Created by Raphael Alkamim on 17/01/22.
//

import SwiftUI

struct SavedMoneyCellChart: View {
    var valueSaved:Double
    var totalToSave: Double
    var widthTotal: Double = 250
    
    var body: some View {
        
        VStack(){
            HStack(){
                Text("0").font(.system(size: 10)).bold()
                    .foregroundColor(Color("BlueColor"))
                    .frame(alignment: .leading)
                
                Spacer()
                Text(String(totalToSave)).font(.system(size: 10)).bold()
                    .foregroundColor(Color("BlueColor"))
                    .frame(alignment: .trailing)
            }
            .frame(width: widthTotal, alignment: .center)
            .padding(.bottom, -5)
            
            ZStack(){
                Rectangle()
                    .foregroundColor(Color("SavedMoneyChartColor"))
                    .frame(width: (valueSaved*widthTotal)/totalToSave)
                    
                
            }
            .frame(width: widthTotal, height: 40, alignment: .leading)
            .background(Color("SavedMoneyChartBackground"))
            .cornerRadius(5)
            
            HStack(){
                Text("0%").font(.system(size: 9))
                    .frame(alignment: .leading)
                    .foregroundColor(Color("BasicFontColor"))
                
                Spacer()
                Text("100%").font(.system(size: 9))
                    .frame(alignment: .trailing)
                    .foregroundColor(Color("BasicFontColor"))
            }
            .frame(width: widthTotal, alignment: .center)
        }
    }
    
}

struct SavedMoneyCellChart_Previews: PreviewProvider {
    static var previews: some View {
        SavedMoneyCellChart(valueSaved: 100, totalToSave: 1000)
    }
}
