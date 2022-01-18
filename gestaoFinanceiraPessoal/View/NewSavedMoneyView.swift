//
//  NewSavedMoneyView.swift
//  gestaoFinanceiraPessoal
//
//  Created by Raphael Alkamim on 17/01/22.
//

import SwiftUI

struct NewSavedMoneyView: View {
    var categories: [String] = ["Nenhuma", "Alimentação", "Compras", "Educação", "Moradia", "Saúde", "Viagens"]
    var date: String = "Data"
    
    @State private var nameInserted: String = ""
    @State var selectionNonePickers: String = "Nenhuma"

    
    var body: some View {
        
        NavigationView {
            ZStack {
                Color("ViewBackgroundColor").ignoresSafeArea()
                VStack {
                    TransactionDisplay(moneySymbol: "R$", transactionSymbol: "", transactionColor: "BlueColor", transactionValue: 10000)
                    
                    
                    
                    VStack(){
                        
                        Form {
                            Section() {
                                
                                TextField("Nome", text: $nameInserted)
                                
                            }
                            
                            Section() {
                                Picker(selection: $selectionNonePickers, label: Text("Categoria")) {
                                    ForEach(categories, id: \.self){
                                        Text($0)
                                    }
                                }
                                .pickerStyle(.automatic)
                                
                            
                                
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

struct NewSavedMoneyView_Previews: PreviewProvider {
    static var previews: some View {
        NewSavedMoneyView()
    }
}
