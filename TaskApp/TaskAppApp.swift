//
//  TaskAppApp.swift
//  TaskApp
//
//  Created by Илья Подлесный on 23.04.2021.
//

import SwiftUI

@main
struct TaskAppApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
