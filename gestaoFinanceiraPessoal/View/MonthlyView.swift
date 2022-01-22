//
//  MonthlyView.swift
//  gestaoFinanceiraPessoal
//
//  Created by Raphael Alkamim on 14/01/22.
//

import SwiftUI


struct MonthlyView: View {
    
    @EnvironmentObject var appData: AppData
    
    var incomingValue: Double = 0
    var outgoingValue: Double = 0
    var balanceValue: Double = 0
    var savedValue: Double = 0
    var month: String = "Janeiro"
    
    
    let formatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.locale = Locale(identifier: "pt_BR")
        formatter.minimumFractionDigits = 2
        return formatter
    }()
    
    
    
    var transactions: [TransactionsCellEntities] = []
    
    var moneySymbol: String = "R$"
    var transactionsTitle: String = ""
    
    var body: some View {
        NavigationView {
            
            ZStack() {
                Color("SheetBackgroundColor").ignoresSafeArea()
                VStack() {
                    
                    
                    HStack() {
                        VStack {
                            Text("Entrada")
                                .font(.system(size: 13))
                                .foregroundColor(Color("BasicFontColor"))
                                .frame(maxWidth: .infinity,alignment: .leading)
                            
                            HStack() {
                                Text("R$")
                                    .font(.system(size: 17)).bold()
                                    .foregroundColor(Color("GreenColor"))
                                
                                
                                Text(String(incomingValue))
                                    .font(.system(size: 17)).bold()
                                    .foregroundColor(Color("GreenColor"))
                                    .frame(maxWidth: .infinity,alignment: .leading)
                                
                            }
                            
                        }
                        .frame(width: 150, height: 50, alignment: .leading)
                        .padding(.leading,15)
                        
                        VStack() {
                            Text("Saída")
                                .font(.system(size: 13))
                                .foregroundColor(Color("BasicFontColor"))
                                .frame(maxWidth: .infinity,alignment: .leading)
                            
                            HStack() {
                                Text("R$")
                                    .font(.system(size: 17)).bold()
                                    .foregroundColor(Color("RedColor"))
                                
                                
                                Text(String(incomingValue))
                                    .font(.system(size: 17)).bold()
                                    .foregroundColor(Color("RedColor"))
                                    .frame(maxWidth: .infinity,alignment: .leading)
                            }
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
                            Section(header: Text("Transações de \(month)")) {
                                ForEach(appData.listTransactions) { transaction in
                                    TransactionsCell(title: transaction.transactionName, value: transaction.transactionValue, transactionSymbol: transaction.transactionType).environmentObject(self.appData)
                                    
                                }
                                
                            }
                            
                        }.listStyle(.insetGrouped)
                        
                        
                    }
                    VStack() {
                        BallanceView(savedValue: 1000, month: "\(month)", ballanceValue: 10000)
                    }
                    .padding([.leading, .trailing], 15)
                    .padding(.top, 10)
                    
                    
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
        MonthlyView(incomingValue: 1000000, outgoingValue: 000, balanceValue: 100, savedValue: 10000, month: "Fevereiro")
    }
}
