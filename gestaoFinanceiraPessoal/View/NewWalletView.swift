//
//  NewWalletView.swift
//  gestaoFinanceiraPessoal
//
//  Created by Raphael Alkamim on 13/01/22.
//

import SwiftUI


struct NewWalletView: View {
    @EnvironmentObject var appData: AppData
    
    
    //    init() {
    //        UISegmentedControl.appearance().selectedSegmentTintColor = .blue
    //    }
    
    
    @State private var selectedItem: SegmentedItens = .account
   
    @State private var showingAlert = false
    
    @State private var walletName: String = ""
    @State private var walletDescription: String = ""
    @State private var walletType: String = ""
   
    // Pedir explição paulinha
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            
            ZStack {
                Color("SheetBackgroundColor").ignoresSafeArea()
                VStack {
                    
                    Picker("Select the wallet preference", selection: $selectedItem) {
                        ForEach(SegmentedItens.allCases, id: \.self) {
                            Text($0.rawValue)
                        }
                    }
                    .pickerStyle(.segmented)
                    .padding()
                    
                    SegmentedImage(selectedIten: selectedItem, name: walletName, description: walletDescription)
                    
                    Form {
                        Section() {
                            TextField("Nome", text: $walletName)
                            TextField("Descrição", text: $walletDescription)
                        }
                    }
                }
                
            }
            .navigationBarTitle(Text("Nova Carteira"))
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button ("Criar"){
                        // Lógica BD -----
                        
                        let text = self.walletName.trimmingCharacters(in: .whitespaces)
                        if !text.isEmpty {
                            self.appData.insertWallet(name: walletName, description: walletDescription, type: "\(selectedItem)", value: 0)
                            print(self.walletName, self.walletDescription, self.selectedItem)
                        }
                         
                        
                        dismiss()
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

enum SegmentedItens: String, CaseIterable {
    case account = "Conta"
    case money = "Dinheiro"
    case card = "Cartão"
}

struct SegmentedImage: View {
    var selectedIten: SegmentedItens
    var textIten: [String] = ["Adicione uma nova Conta","Adicione um novo Dinheiro em Espécie","Adicione um novo Cartão"]
    var name: String = ""
    var description: String = ""
    
    var body: some View {
        switch selectedIten {
        case .account:
            Image(systemName: "briefcase.fill")
                .resizable()
                .frame(width: 80, height: 70)
                .foregroundColor(Color("BasicFontColor"))
            Text(textIten[0])
            
            
        case .money:
            Image(systemName: "banknote.fill")
                .resizable()
                .frame(width: 100, height: 70)
                .foregroundColor(Color("BasicFontColor"))
            Text(textIten[1])
            
            
        case .card:
            Image(systemName: "creditcard.fill")
                .resizable()
                .frame(width: 90, height: 70)
                .foregroundColor(Color("BasicFontColor"))
            Text(textIten[2])
            
        }
    }
}



//struct NewWalletView_Previews: PreviewProvider {
//    static var previews: some View {
//        NewWalletView()
//            .preferredColorScheme(.light)
//    }
//}
