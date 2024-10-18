//
//  MyOrderAdolfoApp.swift
//  MyOrderAdolfo
//
//  Created by David Romero on 2024-10-17.
//

import SwiftUI

@main
struct MyOrderAdolfoApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            OrderView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
