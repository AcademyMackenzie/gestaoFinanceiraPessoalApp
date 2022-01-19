//
//  outgoingButton.swift
//  gestaoFinanceiraPessoal
//
//  Created by Raphael Alkamim on 12/01/22.
//

import SwiftUI

struct OutgoingButton: View {
    var title: String
    var moneySymbol: String
    var value: Double
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            VStack(){
                
                HStack(){
                    Text(title).font(.system(size: 13))
                        .frame(width: 100, height: 15, alignment: .leading)
                        .foregroundColor(Color("BasicFontColor"))
                    
                    
                    Spacer()
                    Image(systemName: "plus.circle.fill")
                        .frame(width: 15, height: 15, alignment: .trailing)
                        .foregroundColor(Color("RedColor"))
                    
                    
                }
                .frame(width: 130, height: 15, alignment: .center)
                .padding(.top, 15)
                
                
                HStack(){
                    Text(moneySymbol).font(.system(size: 17).bold())
                        .frame(width: 25, height: 20, alignment: .leading)
                        .foregroundColor(Color("RedColor"))
                    
                    
                    Text(String(value)).font(.system(size: 17).bold())
                        .frame(width: 95, height: 20, alignment: .leading)
                        .foregroundColor(Color("RedColor"))
                    
                    
                }
                .frame(width: 130, height: 20, alignment: .bottom)
                .padding(.bottom, 10)
                
            }
            .frame(width: 150, height: 70)
            .background(Color("ElementsBackgroundColor"))
            .cornerRadius(10)
            .shadow(color: Color("ShadowColor"), radius: 0.8, x: 0.5, y: 0.5)
        }
    }
    
    
}

//struct OutgoingButton_Previews: PreviewProvider {
//    static var previews: some View {
//        OutgoingButton(title: "Saída", moneySymbol: "R$", value: 10000)
//    }
//}
