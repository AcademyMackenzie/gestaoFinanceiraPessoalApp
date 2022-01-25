//
//  SavedMoneyView.swift
//  gestaoFinanceiraPessoal
//
//  Created by Raphael Alkamim on 17/01/22.
//

import SwiftUI
import CloudKit

struct SavedMoneyView: View {
    
    @EnvironmentObject var appData : AppData
    
    
    var totalAlreadySaved: Double = 0
    
    @State var showSheetNewSavedMoney = false
    @State var showSheetSaveMoneyTransaction = false
    
    @Environment(\.dismiss) var dismiss
    @State var selectedGoal = Set<GoalViewModel>()
    
    var goalTotalToSave: Double {
        var sum: Double = 0
        for totalGoal in appData.listGoals {
            sum += totalGoal.goalValue
        }
        return sum
    }
    
    //    var totalAlreadySaved: Double {
    //
    //
    //
    //        return
    //    }
    
    
    
    var body: some View {
        NavigationView {
            
            ZStack() {
                //Color("ViewBackgroundColor").ignoresSafeArea()
                
                VStack() {
                    List(selection: $selectedGoal) {
                        ForEach(appData.listGoals) { goal in
                            SavedMoneyCell(title: goal.goalName, moneySymbol: "R$", moneyToSave: goal.goalValue, moneyAlreadySaved: goal.goalSaved) {
                                self.showSheetSaveMoneyTransaction.toggle()
                            }.sheet(isPresented: $showSheetSaveMoneyTransaction) {
                                SavedMoneyTransactionView( goal: goal.id).environmentObject(self.appData)
                            }
                            .swipeActions(edge: .trailing) {
                                Button {
                                    //Func delete cloudkit
                                    appData.deleteFunc(ID: goal.id ) { result in
                                        switch result {
                                        case.success(let id):
                                            //"O que fazer quando deu certo a deleção"
                                            print("")
                                        case.failure(let error):
                                            // deu ruim e agora?
                                            print("")
                                        }
                                    }
                                    
                                    
                                } label: {
                                    Label("Apagar", systemImage: "trash")
                                }
                                
                                .tint(.red)
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
