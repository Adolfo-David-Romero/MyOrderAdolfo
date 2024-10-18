//
//  PizzaListView.swift
//  MyOrderAdolfo
//
//  Created by David Romero on 2024-10-18.
//

import SwiftUI

struct PizzaListView: View {
    @EnvironmentObject var viewModel: PizzaOrderViewModel
    var body: some View {
        NavigationStack{
            VStack{
                List{
                    ForEach(viewModel.pizzaOrders){ order in
                        NavigationLink(destination: PizzaOrderView(order: order)){
                            Text("\(order.pizza_type ?? "N/A")")
                        }
                        
                    }.onDelete(perform: { indexSet in
                        viewModel.deletePizzaOrder(indexSet: indexSet)
                        
                    })
                    
                }.toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        EditButton()
                    }
                    
                }
            }.navigationTitle("Pizza List View")
        }.environmentObject(viewModel)
    }
}

#Preview {
    PizzaListView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
