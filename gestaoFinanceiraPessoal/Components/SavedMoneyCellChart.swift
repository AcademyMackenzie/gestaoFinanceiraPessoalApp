//
//  SavedMoneyCellChart.swift
//  gestaoFinanceiraPessoal
//
//  Created by Raphael Alkamim on 17/01/22.
//

import SwiftUI

struct SavedMoneyCellChart: View {
    var valueSaved:Double
    var percentageSaved: Double
    var totalToSave: Double = 10000
    
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
            .frame(width: 250, alignment: .center)
            .padding(.bottom, -5)
            
            ZStack(){
                Rectangle()
                    .foregroundColor(Color("SavedMoneyChartColor"))
                    .frame(width: percentageSaved)
                    
                
            }
            .frame(width: 250, height: 40, alignment: .leading)
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
            .frame(width: 250, alignment: .center)
        }
    }
    
}

struct SavedMoneyCellChart_Previews: PreviewProvider {
    static var previews: some View {
        SavedMoneyCellChart(valueSaved: 1000, percentageSaved: 10
        )
    }
}
