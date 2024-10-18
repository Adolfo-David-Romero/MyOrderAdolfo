//
//  PizzaOrderView.swift
//  MyOrderAdolfo
//
//  Created by David Romero on 2024-10-18.
//

import SwiftUI

struct PizzaOrderView: View {
    @EnvironmentObject var viewModel : PizzaOrderViewModel
    @ObservedObject var order : PizzaOrder
    
    
    @State var newQuantity = 1
    var body: some View {
        VStack(spacing: 0){
            List{
                Text("Order #: \(order.id?.uuidString ?? "N/A")").font(.callout).bold()
                Text("Order Time: \(order.timestamp!)").font(.callout).bold()
                Text("Pizza type: \(order.pizza_type!)").font(.callout)
                Text("Quantity: \(order.quantity)")
                Text("Pizza Size: \(order.size!)").font(.callout)
                Text("Pizza Crust: \(order.crust!)").font(.callout)
                Spacer()
                Stepper(value: $newQuantity, in: 1...50, step: 1) {
                    Text("Select New Quantity: \(newQuantity)").font(.largeTitle).bold()
                }
            }
            
            
            
        }.navigationTitle("Pizza Order Info: \(order.pizza_type!)").toolbar{
            ToolbarItem(placement: .bottomBar){
                Button(
                    action: {
                        viewModel.updatePizzaOrder(id: order.id!, newQuantity: newQuantity)
                    },
                       label: {
                           Text("Update Order")
                       }
                )
            }
        }.onAppear {
            // Initialize the new quantity with the current order quantity
            newQuantity = Int(order.quantity)
        }
    }
}


