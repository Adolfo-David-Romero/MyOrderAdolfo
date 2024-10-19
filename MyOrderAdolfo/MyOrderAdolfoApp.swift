//
//  MyOrderAdolfoApp.swift
//  MyOrderAdolfo
//
//  Created by David Romero on 2024-10-17.
//  Student ID: 991555778

import SwiftUI

@main
struct MyOrderAdolfoApp: App {
    let persistenceController = PersistenceController.shared
    @StateObject var viewModel = PizzaOrderViewModel()


    var body: some Scene {
        WindowGroup {
            OrderView()
                .environmentObject(viewModel)
        }
    }
}
