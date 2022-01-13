//
//  IncomingTransactionView.swift
//  gestaoFinanceiraPessoal
//
//  Created by Raphael Alkamim on 13/01/22.
//

import SwiftUI

struct IncomingTransactionView: View {
    var date: String = "Data"
    @State var transactionDate = Date()
    @State private var nameInserted = ""
    @State private var descriptionInserted = ""
    
    
    var body: some View {
        
        
        NavigationView {
            ZStack {
                Color("ViewBackgroundColor").ignoresSafeArea()
                VStack {
                    TransactionDisplay(moneySymbol: "R$", transactionSymbol: "+", transactionColor: "GreenColor", transactionValue: 10000)
                    
                    
                    VStack() {
                        
                        Form {
                            Section() {
                                DatePicker(selection: $transactionDate, in: ...Date(), displayedComponents: .date) {
                                    Text(date)
                                }
                            }
                        }
                    }
                    
                    Form {
                        Section() {
                            TextField("Nome", text: $nameInserted)
                            TextField("Descrição", text: $descriptionInserted)
                        }
                    }
                    
                    Form {
                        Section() {

                        }
                    }
                    
                    
                }
                
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


struct IncomingTransactionView_Previews: PreviewProvider {
    static var previews: some View {
        IncomingTransactionView()
    }
}
