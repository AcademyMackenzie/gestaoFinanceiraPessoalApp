//
//  gestaoFinanceiraPessoalApp.swift
//  gestaoFinanceiraPessoal
//
//  Created by Raphael Alkamim on 12/01/22.
//

import SwiftUI


@main
struct gestaoFinanceiraPessoalApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext).environmentObject(AppData())
        }
    }
}
