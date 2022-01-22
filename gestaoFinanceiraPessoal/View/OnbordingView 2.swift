//
//  OnbordingView.swift
//  gestaoFinanceiraPessoal
//
//  Created by Raphael Alkamim on 18/01/22.
//

import SwiftUI

struct OnbordingView: View {
    //@Binding var showOnBoarding: Bool
    
    
    var body: some View {
        ZStack() {
            Color("BackgroundColor").ignoresSafeArea()
            
            VStack() {
                VStack(alignment: .leading) {
                    Text("Bem-Vindo ao")
                        .font(.system(size: 48, design: .rounded))
                        .bold()
                    Text("Nome")
                        .foregroundColor(Color("BlueColor"))
                        .font(.system(size: 48, design: .rounded))
                        .bold()
                    
                    OnBoardingSteps(image: "plus.circle", title: "Title", description: "description")
                    
                    OnBoardingSteps(image: "plus.circle", title: "Title", description: "description")
                    
                    OnBoardingSteps(image: "plus.circle", title: "Title", description: "description")
                    
                    OnBoardingSteps(image: "plus.circle", title: "Title", description: "description")
                }.padding()
                
                VStack() {
                    BasicButton(title: "Começar")
                    //showOnBoarding.toggle()
                }
            }
        }
    }
}


struct OnbordingView_Previews: PreviewProvider {
    static var previews: some View {
        OnbordingView()
            //showOnBoarding: true)
    }
}
