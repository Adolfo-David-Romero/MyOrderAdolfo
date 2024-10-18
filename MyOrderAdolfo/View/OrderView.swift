//
//  OrderView.swift
//  MyOrderAdolfo
//
//  Created by David Romero on 2024-10-17.
//

import SwiftUI

struct OrderView: View {
    @State private var selectedSize: PizzaSizes = .medium
    @State private var selectedTopping: PizzaToppings = .pepperoni
    @State private var selectedCrust: PizzaCrusts = .regular
    @State private var selectedQuantity: Int = 1
    var body: some View {
        NavigationStack{
            VStack{
                List{
                    Picker("Select Pizza Size:", selection: $selectedSize){
                        Text("Small").tag(PizzaSizes.small)
                        Text("Medium").tag(PizzaSizes.medium)
                        Text("Large").tag(PizzaSizes.large)
                    }.pickerStyle(.automatic)
                    Picker("Select Pizza Toppings:", selection: $selectedTopping){
                        Text("Cheese Pizza").tag(PizzaToppings.cheese)
                        Text("Pepperoni Pizza").tag(PizzaToppings.pepperoni)
                        Text("Veggie Pizza").tag(PizzaToppings.veggie)
                        Text("Canadian Pizza").tag(PizzaToppings.canadian)
                        Text("BBQ Chicken Pizza").tag(PizzaToppings.bbq)
                        Text("Anchovy Pizza").tag(PizzaToppings.anchovy)
                    }.pickerStyle(.navigationLink)
                    Picker("Crust:", selection: $selectedCrust){
                        Text("Thin Crust").tag(PizzaCrusts.thin)
                        Text("Medium Crust").tag(PizzaCrusts.regular)
                        Text("Large Crust").tag(PizzaCrusts.thick)
                    }.pickerStyle(.automatic)
                    Stepper(value: $selectedQuantity, in: 1...50, step: 1) {
                        Text("Select Quantity: \(selectedQuantity)")
                    }
                }
                
            }
        }.navigationTitle("Order View")
    }
}

#Preview {
    OrderView()
}
