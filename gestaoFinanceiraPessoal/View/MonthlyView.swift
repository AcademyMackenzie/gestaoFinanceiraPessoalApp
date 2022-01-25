//
//  MonthlyView.swift
//  gestaoFinanceiraPessoal
//
//  Created by Raphael Alkamim on 14/01/22.
//

import SwiftUI


struct MonthlyView: View {
    
    @EnvironmentObject var appData: AppData
    @State var selectedTransaction = Set<TransactionViewModel>()
    
    var incomingValue: Double {
        var sum: Double = 0
        for totalOutgoing in appData.listTransactions {
            if totalOutgoing.transactionType == "incoming" {
                sum += totalOutgoing.transactionValue
            }
            
        }
        return sum
    }
    
    var outgoingValue: Double {
        var sum: Double = 0
        for totalOutgoing in appData.listTransactions {
            if totalOutgoing.transactionType == "outgoing" {
                sum += totalOutgoing.transactionValue
            }
        }
        return sum
    }
    
    
    var balanceValue: Double {
        var total = incomingValue - outgoingValue
        return total
    }
    
    var savedValue: Double = 0
    var month: String = "Janeiro"
    
    
    let formatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.locale = Locale(identifier: "pt_BR")
        formatter.minimumFractionDigits = 2
        return formatter
    }()
    
    
    
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
                                
                                
                                Text(String(outgoingValue))
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
                                    
                                        .swipeActions(edge: .trailing) {
                                            Button {
                                                //Func delete cloudkit
                                                appData.deleteFunc(ID: transaction.id ) { result in
                                                    switch result {
                                                    case.success(let id):
                                                        //"O que fazer quando deu certo a deleção"
                                                        print("")
                                                    case.failure(let error):
                                                        // deu ruim e agora?
                                                        print("")
                                                    }
                                                }
                                                
                                                
                                            } label: {
                                                Label("Apagar", systemImage: "trash")
                                            }
                                            
                                            .tint(.red)
                                        }
                                }
                                
                            }
                            
                        }.listStyle(.insetGrouped)
                        
                        
                    }
                    VStack() {
                        BallanceView(savedValue: 1000, month: "\(month)", ballanceValue: balanceValue)
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

//struct MonthlyView_Previews: PreviewProvider {
//    static var previews: some View {
//        MonthlyView
//    }
//}
