//
//  SavedMoneyTransactionView.swift
//  gestaoFinanceiraPessoal
//
//  Created by Raphael Alkamim on 17/01/22.
//

import SwiftUI

struct SavedMoneyTransactionView: View {
    
    @EnvironmentObject var appData: AppData
    let selectedGoal: GoalViewModel
    
    @State private var selectedItem: SegmetageItensSavedMoney = .save
    
    var transactionValue: Double = 0
    
    @State private var showingAlert = false
    
    @Environment(\.dismiss) var dismiss
    
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
                    
                    SegmentedFormImplementation(selectedIten: selectedItem, transactionValue: transactionValue)
                }
                
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button ("Salvar"){
                        // logica
                        
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
