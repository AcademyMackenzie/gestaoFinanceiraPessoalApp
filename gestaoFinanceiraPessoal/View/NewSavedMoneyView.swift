//
//  NewSavedMoneyView.swift
//  gestaoFinanceiraPessoal
//
//  Created by Raphael Alkamim on 17/01/22.
//

import SwiftUI

struct NewSavedMoneyView: View {
    
    @EnvironmentObject var appData: AppData
    
    var categories: [String] = ["Nenhuma", "Alimentação", "Compras", "Educação", "Moradia", "Saúde", "Viagens"]
    @State private var wantToSave: Double = 0
    
    @State private var nameInserted: String = ""
    @State var selectionCategoryPicker: String = "Nenhuma"
    
   
    @State var showingAlert = false
    
    @Environment(\.dismiss) var dismiss
    
    
    let formatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.locale = Locale(identifier: "pt_BR")
        formatter.minimumFractionDigits = 2
        return formatter
    }()
    
    var body: some View {
        
        NavigationView {
            ZStack {
                Color("SheetBackgroundColor").ignoresSafeArea()
                VStack {
                    
                    HStack {
                        Text("R$").font(.system(size: 36)).bold()
                            .foregroundColor(Color("BlueColor"))
                            .padding(.leading,10)
                        
                        TextField("",value: $wantToSave, formatter: formatter)
                            .font(.system(size: 36, weight: .bold))
                            .foregroundColor(Color("BlueColor"))
                            .multilineTextAlignment(.trailing)
                            .keyboardType(.decimalPad)
                            
                        
                        Text("+").font(.system(size: 36)).bold()
                            .foregroundColor(Color("BlueColor"))
                            .padding(.trailing,10)
                    }
                    .frame(width: 330, height: 80)
                    .background(Color("DisplayColor"))
                    .cornerRadius(10)
                    
                    
                    VStack(){
                        
                        Form {
                            Section() {
                                
                                TextField("Nome", text: $nameInserted).foregroundColor(Color("BasicFontColor"))
                                
                            }
                            
                            Section() {
                                Picker(selection: $selectionCategoryPicker, label: Text("Categoria").foregroundColor(Color("BasicFontColor"))) {
                                    ForEach(categories, id: \.self){
                                        Text($0)
                                    }.foregroundColor(.gray)
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
                    Button ("Salvar"){
                        
                        //Lógica
                        self.appData.insertGoals(name: self.nameInserted, value: self.wantToSave, category: self.selectionCategoryPicker, savedMoney: 0)
                        
                        dismiss()
                    }
                    .foregroundColor(.blue)
                    
                    .foregroundColor(Color("BasicFontColor"))
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    Button ("Cancelar", role: .cancel) {
                        showingAlert = true
                        //dismiss()
                    }.alert("Tem certeza que deseja cancelar?",isPresented: $showingAlert){
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


struct NewSavedMoneyView_Previews: PreviewProvider {
    static var previews: some View {
        NewSavedMoneyView()
    }
}
