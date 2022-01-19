//
//  HomePage.swift
//  gestaoFinanceiraPessoal
//
//  Created by Raphael Alkamim on 13/01/22.
//

import SwiftUI


struct HomeView: View {
    let transactionsArray: [String] = ["Compra", "Salario", "Aluguel"]
    var transactions: [TransactionsCellEntities] = [
        TransactionsCellEntities(id: "1", transactionName: "Nome Transação", transactionColor: "RedColor", transactionSymbol: "-", transactionValue: 100),
        TransactionsCellEntities(id: "2", transactionName: "Nome Transação", transactionColor: "GreenColor", transactionSymbol: "+", transactionValue: 1000),
        TransactionsCellEntities(id: "3", transactionName: "Nome Transação", transactionColor: "RedColor", transactionSymbol: "-", transactionValue: 900),
        TransactionsCellEntities(id: "4", transactionName: "Nome Transação", transactionColor: "GreenColor", transactionSymbol: "+", transactionValue: 1000),
        TransactionsCellEntities(id: "5", transactionName: "Nome Transação", transactionColor: "BlueColor", transactionSymbol: "+", transactionValue: 100000)]
    
    var moneySymbol: String = "R$"
    var transactionsTitle: String = "Últimas Transações"
    
    @State var showSheetNewWallet = false
    @State var showSheetNewIncoming = false
    @State var showSheetNewOutgoing = false
    @State var showSheetSavedMoney = false
    @State var showSheetMonthlyView = false
    
    var savedTotal: Double = 0
    var incomingTotal: Double = 0
    var outgoingTotal: Double = 0
    
    var alreadySavedTotal: Double = 0
    var goalToSaveTotal: Double = 0
    
    
    
    var body: some View {
        NavigationView {
            
            ZStack() {
                Color("ViewBackgroundColor").ignoresSafeArea()
                VStack() {
                    
                    VStack() {
                        
                        
                        MonthlyButton(){
                            self.showSheetMonthlyView.toggle()
                        }.sheet(isPresented: $showSheetMonthlyView) {
                            MonthlyView()
                        }
                        
                        HStack(){
                            SavedMoneyButton(title: "Guardado", moneySymbol: moneySymbol, valueToSaveTotal: goalToSaveTotal, valueSavedTotal: alreadySavedTotal) {
                                self.showSheetSavedMoney.toggle()
                            }.sheet(isPresented: $showSheetSavedMoney)  {
                                SavedMoneyView()
                            }
                            
                            
                            
                            VStack(){
                                IncomingButton(title: "Entrada", moneySymbol: moneySymbol, value: incomingTotal) {
                                    self.showSheetNewIncoming.toggle()
                                }.sheet(isPresented: $showSheetNewIncoming) {
                                    IncomingTransactionView()
                                }
                                
                                
                                OutgoingButton(title: "Saída", moneySymbol: moneySymbol, value: outgoingTotal) {
                                    self.showSheetNewOutgoing.toggle()
                                }.sheet(isPresented: $showSheetNewOutgoing) {
                                    OutgoingTransactionView()
                                }
                                
                                
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
                                TransactionsCell(title: title.transactionName, value: title.transactionValue, transactionSymbol: title.transactionSymbol, transactionColorName: title.transactionColor)
                                
                            }
                        }
                    }
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        self.showSheetNewWallet.toggle()
                    } label: {
                        Label("Criar", systemImage: "plus.circle.fill")
                        
                    }
                    .sheet(isPresented: $showSheetNewWallet) {
                        NewWalletView()
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

