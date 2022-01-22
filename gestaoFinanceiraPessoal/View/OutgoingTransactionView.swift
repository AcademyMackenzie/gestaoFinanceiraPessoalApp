//
//  OutgoingTransactionView.swift
//  gestaoFinanceiraPessoal
//
//  Created by Raphael Alkamim on 14/01/22.
//

import SwiftUI
import CloudKit

struct OutgoingTransactionView: View {
    
    @EnvironmentObject var appData : AppData
    
    var categories: [String] = ["Nenhuma", "Alimentação", "Compras", "Educação", "Moradia", "Saúde", "Viagens"]
    var frequence: [String] = ["Nenhuma","Diariamente", "Semanalmente", "Mensalmente", "Anualmente"]
    var wallets: [String] = ["Padrão"]
    var date: String = "Data"
    
    @State private var transactionValue: Double = 0
    @State private var transactionDate = Date()
    @State private var nameInserted: String = ""
    @State private var descriptionInserted: String = ""
    @State private var numberOfRepetition: Int = 0
    @State private var selectionCategoriesPicker: String = "Nenhuma"
    @State private var selectionFrequencePicker: String = "Nenhuma"
    @State private var selectionTransactionOrigin: String = "Padrão"
    @State private var transactionType: String = "outgoing"
    
    
    @State private var showingAlert = false
    
    @Environment(\.dismiss) var dismiss
    
    
    let formatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.locale = Locale(identifier: "pt_BR")
        formatter.minimumFractionDigits = 2
        return formatter
    }()
    
    var body: some View {
        
        
        NavigationView {
            ZStack {
                Color("SheetBackgroundColor").ignoresSafeArea()
                VStack {
                    
                    HStack {
                        Text("R$").font(.system(size: 36)).bold()
                            .foregroundColor(Color("RedColor"))
                            .padding(.leading,10)
                        
                        TextField("",value: $transactionValue, formatter: formatter)
                            .font(.system(size: 36, weight: .bold))
                            .foregroundColor(Color("RedColor"))
                            .multilineTextAlignment(.trailing)
                            .keyboardType(.decimalPad)
                            
                        
                        Text("-").font(.system(size: 36)).bold()
                            .foregroundColor(Color("RedColor"))
                            .padding(.trailing,10)
                    }
                    .frame(width: 330, height: 80)
                    .background(Color("DisplayColor"))
                    .cornerRadius(10)
                    
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
                                Picker(selection: $selectionCategoriesPicker, label: Text("Categoria")) {
                                    ForEach(categories, id: \.self){
                                        Text($0)
                                    }
                                }
                                .pickerStyle(.automatic)
                                
                                
                                Picker(selection: $selectionTransactionOrigin, label: Text("Origem da Transação")) {
                                    ForEach(wallets, id: \.self){
                                        Text($0)
                                    }
                                }
                                .pickerStyle(.automatic)
                                
                            }
                            Section() {
                                Picker(selection: $selectionFrequencePicker, label: Text("Frequência")) {
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
            .navigationBarTitle(Text("Nova Saída"))
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button ("Salvar"){
                        
                        //Lógica -------- BD//
                        self.appData.insertTransaction(value: transactionValue, name: nameInserted, description: descriptionInserted, date: transactionDate, category: selectionCategoriesPicker, origenDestination: selectionTransactionOrigin, frequency: selectionFrequencePicker, repetition: numberOfRepetition, type: transactionType //, wallet: self.wallet)
                        )
                        dismiss()
                        
                        print(self.nameInserted, transactionValue, descriptionInserted, transactionType, transactionDate, selectionCategoriesPicker, selectionTransactionOrigin, selectionFrequencePicker, numberOfRepetition)
                    }
                    .foregroundColor(.blue)
                    
                
                .foregroundColor(Color("BasicFontColor"))
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    Button ("Cancelar", role: .cancel) {
                        showingAlert = true
                        //dismiss()
                    }.alert("Tem certeza que deseja cancelar?", isPresented: $showingAlert) {
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

//struct OutgoingTransactionView_Previews: PreviewProvider {
//    static var previews: some View {
//        OutgoingTransactionView()
//    }
//}
