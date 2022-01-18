//
//  SavedMoneyView.swift
//  gestaoFinanceiraPessoal
//
//  Created by Raphael Alkamim on 17/01/22.
//

import SwiftUI

struct SavedMoneyView: View {
    var saveds: [SavedMoneyCellEntities] = [SavedMoneyCellEntities(id: "1", savedMoneyName: "Comprar iphone", moneyToSave: 10000, moneyAlreadySaved: 5000), SavedMoneyCellEntities(id: "2", savedMoneyName: "Comprar carregador", moneyToSave: 500, moneyAlreadySaved: 250),SavedMoneyCellEntities(id: "1", savedMoneyName: "Comprar iphone", moneyToSave: 10000, moneyAlreadySaved: 5000), SavedMoneyCellEntities(id: "2", savedMoneyName: "Comprar carregador", moneyToSave: 500, moneyAlreadySaved: 250),SavedMoneyCellEntities(id: "1", savedMoneyName: "Comprar iphone", moneyToSave: 10000, moneyAlreadySaved: 5000), SavedMoneyCellEntities(id: "2", savedMoneyName: "Comprar carregador", moneyToSave: 500, moneyAlreadySaved: 250)]
    
    var goalTotalToSave: Double
    var totalAlreadySaved: Double
    
    var body: some View {
        NavigationView {
            
            ZStack() {
                Color("ViewBackgroundColor")
                
                VStack() {
                    List {
                        ForEach(saveds) { title in
                            SavedMoneyCell(title: title.savedMoneyName, moneySymbol: "R$", moneyToSave: title.moneyToSave, moneyAlreadySaved: title.moneyAlreadySaved)

                        }
                        .listRowBackground(Color("ViewBackgroundColor"))
                        .listRowSeparator(.hidden)
                        
                    }
                    

                    SavedBallenceView(goalToSave: goalTotalToSave, ballanceSavedMoney: totalAlreadySaved)
                        .padding([.leading, .trailing], 15)
                        .padding(.top, 10)
                }
            }
            
            
            
            
            
            
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("Guardado")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        //action button
                    }
                label: {
                    Text("Criar")
                        .foregroundColor(.blue)
                    
                }
                .foregroundColor(Color("BasicFontColor"))
                }
            }
            
        }
    }
}

struct SavedMoneyView_Previews: PreviewProvider {
    static var previews: some View {
        SavedMoneyView(goalTotalToSave: 100000, totalAlreadySaved: 1232)
    }
}
