//
//  MonthlyView.swift
//  gestaoFinanceiraPessoal
//
//  Created by Raphael Alkamim on 14/01/22.
//

import SwiftUI


struct MonthlyView: View {
    var incomingValue: Double
    var outgoingValue: Double
    var balanceValue: Double
    var savedValue: Double
    var month: String = "Janeiro"
    
    
    let transactionsArray: [String] = ["Compra", "Salario", "Aluguel"]
    
    let formatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.locale = Locale(identifier: "pt_BR")
        formatter.minimumFractionDigits = 2
        return formatter
    }()
    
    
    var transactions: [New] = [New(id: "1", transactionName: "Compra", transactionColor: .green, transactionSymbol: "$"),New(id: "2",transactionName: "assadasda", transactionColor: .green, transactionSymbol: "$"), New(id: "3",transactionName: "aaaaaaa", transactionColor: .green, transactionSymbol: "$"),New(id: "1", transactionName: "Compra", transactionColor: .green, transactionSymbol: "$"),New(id: "2",transactionName: "assadasda", transactionColor: .green, transactionSymbol: "$"),New(id: "1", transactionName: "Compra", transactionColor: .green, transactionSymbol: "$"),New(id: "2",transactionName: "assadasda", transactionColor: .green, transactionSymbol: "$"),New(id: "1", transactionName: "Compra", transactionColor: .green, transactionSymbol: "$"),New(id: "2",transactionName: "assadasda", transactionColor: .green, transactionSymbol: "$"),New(id: "1", transactionName: "Compra", transactionColor: .green, transactionSymbol: "$"),New(id: "2",transactionName: "assadasda", transactionColor: .green, transactionSymbol: "$"),]
    
    var moneySymbol: String = "R$"
    var transactionsTitle: String = ""
    
    var body: some View {
        NavigationView {
            
            ZStack() {
                Color("ViewBackgroundColor").ignoresSafeArea()
                VStack() {
                    
                    
                    HStack() {
                        VStack {
                            Text("Entrada")
                                .font(.system(size: 13))
                                .foregroundColor(Color("BasicFontColor"))
                                .frame(maxWidth: .infinity,alignment: .leading)
                            
                            Text(String(incomingValue))
                                .font(.system(size: 17)).bold()
                                .foregroundColor(Color("GreenColor"))
                                .frame(maxWidth: .infinity,alignment: .leading)
                        }
                        .frame(width: 150, height: 50, alignment: .leading)
                        .padding(.leading,15)
                        
                        VStack() {
                            Text("Entrada")
                                .font(.system(size: 13))
                                .foregroundColor(Color("BasicFontColor"))
                            
                                .frame(maxWidth: .infinity,alignment: .leading)
                            
                            Text(String(incomingValue))
                                .font(.system(size: 17)).bold()
                                .foregroundColor(Color("RedColor"))
                                .frame(maxWidth: .infinity,alignment: .leading)
                        }
                        .frame(width: 150, height: 60, alignment: .leading)
                        .padding(.leading,15)
                        
                        
                    }
                    .background(Color("ElementsBackgroundColor"))
                    .frame(width: 337, height: 56)
                    .cornerRadius(10)
                    .padding(.top, 10)
                    
                    
                    VStack() {
                        
                        List {
                            Section(header: Text("Transações de  \(month)")) {
                                ForEach(transactions) { title in
                                    TransactionsCell(title: title.transactionName, value: 10000, transactionSymbol: title.transactionSymbol, transactionColor: title.transactionColor)
                                    
                                }
                                
                            }
                            
                        }.listStyle(.automatic)
                            .bu
                        
                    }
                    
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle(month)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        //action buttons
                    }
                label: {
                    Label("Próximo", systemImage: "arrow.right.circle.fill")
                    
                }
                .foregroundColor(Color("BasicFontColor"))
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        //action
                    }
                label: {
                    Label("Anterior", systemImage: "arrow.left.circle.fill")
                }
                .foregroundColor(Color("BasicFontColor"))
                }
            }
            
            
        }
    }
    
    
}

struct MonthlyView_Previews: PreviewProvider {
    static var previews: some View {
        MonthlyView(incomingValue: 1000000, outgoingValue: 000, balanceValue: 100, savedValue: 10000)
    }
}
