//
//  SavedMoneyView.swift
//  gestaoFinanceiraPessoal
//
//  Created by Raphael Alkamim on 17/01/22.
//

import SwiftUI

struct SavedMoneyView: View {
    
    @EnvironmentObject var appData : AppData
    
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
                        ForEach(appData.listGoals) { goal in
                            SavedMoneyCell(title: goal.goalName, moneySymbol: "R$", moneyToSave: goal.goalValue, moneyAlreadySaved: goal.goalSaved) {
                                self.showSheetSaveMoneyTransaction.toggle()
                            }.sheet(isPresented: $showSheetSaveMoneyTransaction) {
                                SavedMoneyTransactionView(selectedGoal: goal)
                            }

                        }
                        .listRowBackground(Color("SheetBackgroundColor"))
                        .listRowSeparator(.hidden)
                        
                        .swipeActions(edge: .trailing) {
                            Button {
                                //Func delete cloudkit
                                
                            } label: {
                                Label("Apagar", systemImage: "trash")
                            }
                            
                            .tint(.red)
                        }
                        
                    }
//                    .swipeActions(edge: .trailing, allowsFullSwipe: true) {
//                        func deleteRecord(withID recordID: CKReecord.ID) async throws -> CKRecord.ID
//                    }
                    

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
