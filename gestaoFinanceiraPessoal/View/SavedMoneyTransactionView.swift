//
//  SavedMoneyTransactionView.swift
//  gestaoFinanceiraPessoal
//
//  Created by Raphael Alkamim on 17/01/22.
//

import SwiftUI
import CloudKit


struct SavedMoneyTransactionView: View {
    
    @EnvironmentObject var appData: AppData
    
    @State private var selectedItem: SegmetageItensSavedMoney = .save
    
    @State private var showingAlert = false
    @State private var transactionGoalName = ""
    @State private var transactionGoalType: String = ""
    @State private var transactionGoalValue: Double = 0
    @State private var transactionGoalDate: Date = Date()
    
    @Environment(\.dismiss) var dismiss
    
    let goal: CKRecord.ID
    
    var body: some View {
        NavigationView {
            
            ZStack {
                Color("SheetBackgroundColor").ignoresSafeArea()
                VStack {
                    
                    Picker("choose save or remove money", selection: $selectedItem) {
                        ForEach(SegmetageItensSavedMoney.allCases, id: \.self) {
                            Text($0.rawValue)
                        }
                    }
                    .pickerStyle(.segmented)
                    .padding()
                    
                    SegmentedFormImplementation(selectedIten: selectedItem, transactionValue: transactionGoalValue)
                }
                
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button ("Salvar"){
                        // logica
                        
                        if selectedItem == .save {
                            self.appData.insertTransactionsGoals(name: transactionGoalName, value: transactionGoalValue, date: transactionGoalDate, type: "saved", goal: self.goal)
                         
                        } else {
                            self.appData.insertTransactionsGoals(name: transactionGoalName, value: transactionGoalValue, date: transactionGoalDate, type: "removedSave", goal: self.goal)
                        }
                        
                        dismiss()
                    }
                    .foregroundColor(.blue)
                    
                    
                    .foregroundColor(Color("BasicFontColor"))
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    Button ("Cancelar", role: .cancel) {
                        showingAlert = true
                        //dismiss()
                    }.alert("Tem certeza que deseja cancelar?",isPresented: $showingAlert){
                        Button("Não") {
                            
                        }
                        Button("Sim") {
                            dismiss()
                        }
                    }
                    .foregroundColor(.red)
                }
            }
        }
        
    }
    
}



enum SegmetageItensSavedMoney: String, CaseIterable {
    case save = "Guardar"
    case outgoing = "Retirar"
}

struct SegmentedFormImplementation: View {
    var selectedIten: SegmetageItensSavedMoney
    var transactionValue: Double = 0
    
    var body: some View {
        switch selectedIten {
        case .save:
            TransactionDisplay(moneySymbol: "R$", transactionSymbol: "+", transactionColor: "GreenColor", transactionValue: transactionValue)
            SegmentedFormSaveMoney()
        case .outgoing:
            TransactionDisplay(moneySymbol: "R$", transactionSymbol: "-", transactionColor: "RedColor", transactionValue: transactionValue)
            SegmentedFormSaveMoney()
            
        }
    }
}

struct SegmentedFormSaveMoney: View {
    var name: String = "Nome"
    var date: String = "Data"
    
    @State private var nameInserted = ""
    @State private var descriptionInserted = ""
    @State var transactionDate = Date()
    
    
    var body: some View {
        Form {
            Section() {
                
                TextField("Nome", text: $nameInserted)
                
                DatePicker(selection: $transactionDate, in: ...Date(), displayedComponents: .date) {
                    Text(date)
                }
            }
        }
    }
    
}

//struct SavedMoneyTransactionView_Previews: PreviewProvider {
//    static var previews: some View {
//        SavedMoneyTransactionView(selectedGoal: goal)
//    }
//}
