//
//  SavedChart.swift
//  gestaoFinanceiraPessoal
//
//  Created by Raphael Alkamim on 13/01/22.
//

import SwiftUI

struct SavedChart: View {
    var valueSaved:Double
    var percentageSaved: Double
    
    var body: some View {
        
        VStack(){
            ZStack(){
                Rectangle()
                    .foregroundColor(Color("SavedMoneyChartColor"))
                    .frame(width: percentageSaved)
                    
                
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
            .frame(width: 100, alignment: .center)
        }
    }
    
}

struct SavedChart_Previews: PreviewProvider {
    static var previews: some View {
        SavedChart(valueSaved: 100, percentageSaved: 10)
    }
}
