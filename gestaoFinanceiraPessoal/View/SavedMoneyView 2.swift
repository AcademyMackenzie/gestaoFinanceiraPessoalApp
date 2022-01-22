//
//  SavedMoneyView.swift
//  gestaoFinanceiraPessoal
//
//  Created by Raphael Alkamim on 17/01/22.
//

import SwiftUI

struct SavedMoneyView: View {
    var saveds: [SavedMoneyCellEntities] = [SavedMoneyCellEntities(id: "1", savedMoneyName: "Comprar iphone", moneyToSave: 10000, moneyAlreadySaved: 5000), SavedMoneyCellEntities(id: "2", savedMoneyName: "Comprar carregador", moneyToSave: 500, moneyAlreadySaved: 250),SavedMoneyCellEntities(id: "1", savedMoneyName: "Comprar iphone", moneyToSave: 10000, moneyAlreadySaved: 5000), SavedMoneyCellEntities(id: "2", savedMoneyName: "Comprar carregador", moneyToSave: 500, moneyAlreadySaved: 250),SavedMoneyCellEntities(id: "1", savedMoneyName: "Comprar iphone", moneyToSave: 10000, moneyAlreadySaved: 5000), SavedMoneyCellEntities(id: "2", savedMoneyName: "Comprar carregador", moneyToSave: 500, moneyAlreadySaved: 250)]
    
    var goalTotalToSave: Double = 0
    var totalAlreadySaved: Double = 0
    
    @State var showSheetNewSavedMoney = false
    @State var showSheetSaveMoneyTransaction = false
    
    @Environment(\.dismiss) var dismiss
    
    
    var body: some View {
        NavigationView {
            
            ZStack() {
                //Color("ViewBackgroundColor").ignoresSafeArea()
                
                VStack() {
                    List {
                        ForEach(saveds) { title in
                            SavedMoneyCell(title: title.savedMoneyName, moneySymbol: "R$", moneyToSave: title.moneyToSave, moneyAlreadySaved: title.moneyAlreadySaved) {
                                self.showSheetSaveMoneyTransaction.toggle()
                            }.sheet(isPresented: $showSheetSaveMoneyTransaction) {
                                SavedMoneyTransactionView()
                            }

                        }
                        .listRowBackground(Color("SheetBackgroundColor"))
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
                    Button ("Criar"){
                        self.showSheetNewSavedMoney.toggle()

                    }
                    .sheet(isPresented: $showSheetNewSavedMoney) {
                        NewSavedMoneyView()
                    }
                    .foregroundColor(.blue)
                    
                
                .foregroundColor(Color("BasicFontColor"))
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    Button ("Voltar") {
                        dismiss()
                    }
                    .foregroundColor(.gray)
                }
            }
            
        }
    }
}

//struct SavedMoneyView_Previews: PreviewProvider {
//    static var previews: some View {
//        SavedMoneyView(goalTotalToSave: 100000, totalAlreadySaved: 1232)
//    }
//}
