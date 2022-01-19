//
//  IncomingTransactionView.swift
//  gestaoFinanceiraPessoal
//
//  Created by Raphael Alkamim on 13/01/22.
//

import SwiftUI

struct IncomingTransactionView: View {
    var categories: [String] = ["Nenhuma", "Alimentação", "Compras", "Educação", "Moradia", "Saúde", "Viagens"]
    var frequence: [String] = ["Nenhuma","Diariamente", "Semanalmente", "Mensalmente", "Anualmente"]
    var wallets: [String] = ["Padrão"]
    var date: String = "Data"
    
    @State var transactionValue: Double = 0
    @State var transactionDate = Date()
    @State private var nameInserted: String = ""
    @State private var descriptionInserted: String = ""
    @State var numberOfRepetition: Int = 0
    @State var selectionNonePickers: String = "Nenhuma"
    @State var selectionTransactionDestination: String = "Padrão"
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        
        
        NavigationView {
            ZStack {
                Color("SheetBackgroundColor").ignoresSafeArea()
                VStack {
                    TransactionDisplay(moneySymbol: "R$", transactionSymbol: "+", transactionColor: "GreenColor", transactionValue: transactionValue)
                    
                    
                    
                    
                    VStack(){
                        
                        Form {
                            Section() {
                                
                                TextField("Nome", text: $nameInserted)
                                TextField("Descrição", text: $descriptionInserted)
                                
                                DatePicker(selection: $transactionDate, in: ...Date(), displayedComponents: .date) {
                                    Text(date)
                                }
                            }
                            
                            Section() {
                                Picker(selection: $selectionNonePickers, label: Text("Categoria")) {
                                    ForEach(categories, id: \.self){
                                        Text($0)
                                    }
                                }
                                .pickerStyle(.automatic)
                                
                                
                                Picker(selection: $selectionTransactionDestination, label: Text("Destino da Transação")) {
                                    ForEach(wallets, id: \.self){
                                        Text($0)
                                    }
                                }
                                .pickerStyle(.automatic)
                                
                            }
                            Section() {
                                Picker(selection: $selectionNonePickers, label: Text("Frequência")) {
                                    ForEach(frequence, id: \.self){
                                        Text($0)
                                    }
                                }
                                .pickerStyle(.automatic)
                                
                                Stepper(value: $numberOfRepetition, in: 0...24) {
                                    if numberOfRepetition > 1 {
                                        Text("Repetições: \(numberOfRepetition)")
                                    } else if numberOfRepetition == 1{
                                        Text("Repetição: \(numberOfRepetition)")
                                    } else {
                                        Text("Repetição: Nenhuma")
                                    }
                                }
                                
                            }
                        }
                        
                    }.frame( alignment: .top)
                    
                    
                    
                    
                }.frame(alignment: .top)
                
            }
            .navigationBarTitle(Text("Nova Entrada"))
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button ("Salvar"){
                        
                        //Lógica -------- BD//
                        
                        dismiss()
                    }
                    .foregroundColor(.blue)
                    
                
                .foregroundColor(Color("BasicFontColor"))
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    Button ("Cancelar", role: .cancel) {
                        dismiss()
                    }
                    .foregroundColor(.red)
                }
            }

        }
        
        
    }
    
}


//struct IncomingTransactionView_Previews: PreviewProvider {
//    static var previews: some View {
//        IncomingTransactionView(, showSheetView: true)
//    }
//}
