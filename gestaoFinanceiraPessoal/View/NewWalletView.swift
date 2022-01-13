//
//  NewWalletView.swift
//  gestaoFinanceiraPessoal
//
//  Created by Raphael Alkamim on 13/01/22.
//

import SwiftUI


struct NewWalletView: View {
    
    //    init() {
    //        UISegmentedControl.appearance().selectedSegmentTintColor = .blue
    //    }
    
    
    @State private var selectedItem: SegmentedItens = .account
    
    var body: some View {
        NavigationView {
            
            ZStack {
                Color("ViewBackgroundColor").ignoresSafeArea()
                VStack {
                    
                    Picker("Select the wallet preference", selection: $selectedItem) {
                        ForEach(SegmentedItens.allCases, id: \.self) {
                            Text($0.rawValue)
                        }
                    }
                    .pickerStyle(.segmented)
                    .padding()
                    
                    SegmentedImage(selectedIten: selectedItem)
                }
                
            }
            .navigationBarTitleDisplayMode(.inline)
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
    
    var body: some View {
        switch selectedIten {
        case .account:
            Image(systemName: "briefcase.fill")
                .resizable()
                .frame(width: 80, height: 70)
                .foregroundColor(Color("BasicFontColor"))
            Text(textIten[0])
            Segmentedform(
            )
        case .money:
            Image(systemName: "banknote.fill")
                .resizable()
                .frame(width: 100, height: 70)
                .foregroundColor(Color("BasicFontColor"))
            Text(textIten[1])
            Segmentedform()
            
        case .card:
            Image(systemName: "creditcard.fill")
                .resizable()
                .frame(width: 90, height: 70)
                .foregroundColor(Color("BasicFontColor"))
            Text(textIten[2])
            Segmentedform()
        }
    }
}

struct Segmentedform: View {
    var name: String = "Nome"
    var description: String = "Descrição"
    
    @State private var nameInserted = ""
    @State private var descriptionInserted = ""
    
    var body: some View {
        Form {
            Section() {
                TextField(name, text: $nameInserted)
                TextField(description, text: $descriptionInserted)
            }
        }
    }
}


struct NewWalletView_Previews: PreviewProvider {
    static var previews: some View {
        NewWalletView()
            .preferredColorScheme(.light)
    }
}
