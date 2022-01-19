//
//  SavedChart.swift
//  gestaoFinanceiraPessoal
//
//  Created by Raphael Alkamim on 13/01/22.
//

import SwiftUI

struct SavedChart: View {
    var valueSaved:Double
    var totalToSave: Double
    var widthTotal: Double = 100
    
    var body: some View {
        
        VStack(){
            ZStack(){
                
                if totalToSave == 0 {
                    Rectangle()
                        .foregroundColor(Color("SavedMoneyChartBackground"))
                        .frame(width: (valueSaved*widthTotal)/totalToSave)
                } else {
                    Rectangle()
                        .foregroundColor(Color("SavedMoneyChartColor"))
                        .frame(width: (valueSaved*widthTotal)/totalToSave)
                    
                }
                
                    
                
            }
            .frame(width: 100, height: 30, alignment: .leading)
            .background(Color("SavedMoneyChartBackground"))
            .cornerRadius(5)
            
            HStack(){
                Text("0%").font(.system(size: 7))
                    .frame(alignment: .leading)
                    .foregroundColor(Color("BasicFontColor"))
                
                Spacer()
                Text("100%").font(.system(size: 7))
                    .frame(alignment: .trailing)
                    .foregroundColor(Color("BasicFontColor"))
            }
            .frame(width: widthTotal, alignment: .center)
        }
    }
    
}

struct SavedChart_Previews: PreviewProvider {
    static var previews: some View {
        SavedChart(valueSaved: 100, totalToSave: 1000)
    }
}
