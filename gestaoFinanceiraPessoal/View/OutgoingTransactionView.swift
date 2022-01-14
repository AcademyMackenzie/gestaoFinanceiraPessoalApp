//
//  OutgoingTransactionView.swift
//  gestaoFinanceiraPessoal
//
//  Created by Raphael Alkamim on 14/01/22.
//

import SwiftUI

struct OutgoingTransactionView: View {
    var categories: [String] = ["Nenhuma", "Alimentação", "Compras", "Educação", "Moradia", "Saúde", "Viagens"]
    var frequence: [String] = ["Nenhuma","Diariamente", "Semanalmente", "Mensalmente", "Anualmente"]
    var wallets: [String] = ["Padrão", "Nu Banck", "Itau", "Santander", "Em casa", "Dollar"]
    var date: String = "Data"
    
    @State var transactionDate = Date()
    @State private var nameInserted: String = ""
    @State private var descriptionInserted: String = ""
    @State var numberOfRepetition: Int = 0
    @State var selectionNonePickers: String = "Nenhuma"
    @State var selectionTransactionDestination: String = "Padrão"
    
    
    var body: some View {
        
        
        NavigationView {
            ZStack {
                Color("ViewBackgroundColor").ignoresSafeArea()
                VStack {
                    TransactionDisplay(moneySymbol: "R$", transactionSymbol: "-", transactionColor: "RedColor", transactionValue: 10000)
                    
                    
                    
                    
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

struct OutgoingTransactionView_Previews: PreviewProvider {
    static var previews: some View {
        OutgoingTransactionView()
    }
}
