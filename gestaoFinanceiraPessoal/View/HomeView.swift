//
//  HomePage.swift
//  gestaoFinanceiraPessoal
//
//  Created by Raphael Alkamim on 13/01/22.
//

import SwiftUI

struct New : Identifiable {
    var id: String
    
    var transactionName: String
    var transactionColor: Color
    var transactionSymbol: String
    
    
}

struct HomeView: View {
    let transactionsArray: [String] = ["Compra", "Salario", "Aluguel"]
    var transactions: [New] = [New(id: "1", transactionName: "Compra", transactionColor: .green, transactionSymbol: "$"),New(id: "2",transactionName: "assadasda", transactionColor: .green, transactionSymbol: "$"), New(id: "3",transactionName: "aaaaaaa", transactionColor: .green, transactionSymbol: "$"),New(id: "1", transactionName: "Compra", transactionColor: .green, transactionSymbol: "$"),New(id: "2",transactionName: "assadasda", transactionColor: .green, transactionSymbol: "$"),New(id: "1", transactionName: "Compra", transactionColor: .green, transactionSymbol: "$"),New(id: "2",transactionName: "assadasda", transactionColor: .green, transactionSymbol: "$"),New(id: "1", transactionName: "Compra", transactionColor: .green, transactionSymbol: "$"),New(id: "2",transactionName: "assadasda", transactionColor: .green, transactionSymbol: "$"),New(id: "1", transactionName: "Compra", transactionColor: .green, transactionSymbol: "$"),New(id: "2",transactionName: "assadasda", transactionColor: .green, transactionSymbol: "$"),]
    
    var moneySymbol: String = "R$"
    var transactionsTitle: String = "Últimas Transações"
    
    var body: some View {
        NavigationView {
            
            ZStack() {
                Color("ViewBackgroundColor").ignoresSafeArea()
                VStack() {
                    
                    
                    VStack() {
                        HStack(){
                            SavedMoneyButton(title: "Guardado", moneySymbol: moneySymbol, value: 1000, chartValue: 60)
                            
                            VStack(){
                                IncomingButton(title: "Entrada", moneySymbol: moneySymbol, value: 100000)
                                OutgoingButton(title: "Saída", moneySymbol: moneySymbol, value: 1000)
                            }
                        }
                        
                        
                    }
                    
                    VStack() {
                        HStack() {
                            Text(transactionsTitle).font(.system(size: 28)).bold()
                                .foregroundColor(Color("BasicFontColor"))
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.leading, 30)
                                .padding(.top, 20)
                            
                        }
                        
                        List {
                            ForEach(transactions) { title in
                                TransactionsCell(title: title.transactionName, value: 100, transactionSymbol: title.transactionSymbol, transactionColor: title.transactionColor)

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
                    Label("Criar", systemImage: "plus.circle.fill")
                    
                }
                .foregroundColor(Color("BasicFontColor"))
                }
                
                
            }
        }
    }
    
    
}






struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(moneySymbol: "R$", transactionsTitle: "Últimas Transações")
    }
}

