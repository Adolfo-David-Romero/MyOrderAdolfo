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
    
    @State var newQuantity:Int = 1
    var body: some View {
        VStack{
            List{
                Text("\(order.pizza_type!), Order #: \(order.id?.uuidString ?? "N/A")").font(.largeTitle)
                Text("Order Time: \(order.timestamp!, formatter: viewModel.itemFormatter)").font(.subheadline)
            }
            List{
                Text("Pizza type: \(order.pizza_type!)").font(.callout)
                Text("Quantity: \(order.quantity)")
                Text("Pizza Size: \(order.size!)").font(.callout)
                Text("Pizza Crust: \(order.crust!)").font(.callout)
            }
            Stepper(value: $newQuantity, in: 1...50, step: 1) {
                Text("Select Quantity: \(newQuantity)")
            }
            
            
        }.navigationTitle("Pizza Order Info \(order.id?.uuidString ?? "N/A")").toolbar{
            
        }
    }
}


