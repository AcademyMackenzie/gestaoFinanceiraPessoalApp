//
//  SavedMoneyTransactionView.swift
//  gestaoFinanceiraPessoal
//
//  Created by Raphael Alkamim on 17/01/22.
//

import SwiftUI

struct SavedMoneyTransactionView: View {
    
    @State private var selectedItem: SegmetageItensSavedMoney = .save
    
    var body: some View {
        NavigationView {
            
            ZStack {
                Color("ViewBackgroundColor").ignoresSafeArea()
                VStack {
                    
                    Picker("choose save or remove money", selection: $selectedItem) {
                        ForEach(SegmetageItensSavedMoney.allCases, id: \.self) {
                            Text($0.rawValue)
                        }
                    }
                    .pickerStyle(.segmented)
                    .padding()
                    
                    SegmentedFormImplementation(selectedIten: selectedItem)
                }
                
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        //action button
                    }
                label: {
                    Text("Salvar")
                        .foregroundColor(.blue)
                    
                }
                .foregroundColor(Color("BasicFontColor"))
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
    
    var body: some View {
        switch selectedIten {
        case .save:
            TransactionDisplay(moneySymbol: "R$", transactionSymbol: "+", transactionColor: "GreenColor", transactionValue: 1000)
            SegmentedFormSaveMoney()
        case .outgoing:
            TransactionDisplay(moneySymbol: "R$", transactionSymbol: "-", transactionColor: "RedColor", transactionValue: 1000)
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

struct SavedMoneyTransactionView_Previews: PreviewProvider {
    static var previews: some View {
        SavedMoneyTransactionView()
    }
}
