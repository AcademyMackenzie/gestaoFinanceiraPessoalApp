//
//  HomePage.swift
//  gestaoFinanceiraPessoal
//
//  Created by Raphael Alkamim on 13/01/22.
//

import SwiftUI
import CloudKit


struct HomeView: View {
    var transactions: [TransactionsCellEntities] = []
    
    var moneySymbol: String = "R$"
    var transactionsTitle: String = "Últimas Transações"
    
    //let selectedWallet: WalletViewModel
    
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
    
    @EnvironmentObject var appData: AppData
    
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
                                    IncomingTransactionView(/*wallet: CKRecord.ID(recordName: "Defaut")*/)
                                }
                                
                                
                                OutgoingButton(title: "Saída", moneySymbol: moneySymbol, value: outgoingTotal) {
                                    self.showSheetNewOutgoing.toggle()
                                }.sheet(isPresented: $showSheetNewOutgoing) {
                                    OutgoingTransactionView(/*wallet: CKRecord.ID(recordName: "Defaut")*/)
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
                            ForEach(appData.listTransactions) { transaction in
                                TransactionsCell(title: transaction.transactionName, value: transaction.transactionValue, transactionSymbol: transaction.transactionType).environmentObject(self.appData)
                                
                            }
                        }.listStyle(.automatic)
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
                            .environmentObject(self.appData)
                    }
                    .foregroundColor(Color("BasicFontColor"))
                }
            }
            
            
        }
    }
    
    
}






struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(moneySymbol: "R$", transactionsTitle: "Últimas Transações").environmentObject(AppData())
    }
}

