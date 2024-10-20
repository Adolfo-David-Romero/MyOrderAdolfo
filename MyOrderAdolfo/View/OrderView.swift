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
    @State private var selectedQuantity = 1
    
    @EnvironmentObject var viewModel: PizzaOrderViewModel
    @State private var isNavigate = false
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
                    Picker("Select Quantity", selection: $selectedQuantity) {
                        ForEach(1...50, id: \.self) { number in
                            Text("\(number)").tag(number)
                        }
                    }
                }
                
            }.navigationTitle("Order").toolbar{
                ToolbarItem(placement: .bottomBar){
                    NavigationLink(destination: PizzaListView()){
                        Text("Complete Order").padding().background(Color.blue).foregroundColor(.white).cornerRadius(8)
                    }.onAppear(){
                        viewModel.addPizzaOrder(size: selectedSize.rawValue, pizzaType: selectedTopping.rawValue, crust: selectedCrust.rawValue, quantity: Int(selectedQuantity))
                    }
                    
                }
                
            }
            
        }
    }
}

#Preview {
    OrderView()
}
