//
//  PizzaOrderViewModel.swift
//  MyOrderAdolfo
//
//  Created by David Romero on 2024-10-18.
//

import Foundation
import CoreData
class PizzaOrderViewModel : ObservableObject {
    @Published var pizzaOrders : [PizzaOrder] = []
    let viewContext : NSManagedObjectContext
    
    init(){
        viewContext = PersistenceController().container.viewContext
        
        fetchPizzaOrders()
    }
    func fetchPizzaOrders(){
        let request = NSFetchRequest<PizzaOrder>(entityName: "PizzaOrder")
        do {
            pizzaOrders =  try viewContext.fetch(request)
            print("fetchPizzaOrders: Fetched Succesfully")
        }catch{
            print("fetchPizzaOrders: Error")
        }
    }
    fileprivate func SaveData() {
        do {
            try viewContext.save()
            print("SaveData: Save Success")
        }catch{
            print("SaveData: Save Fail")
        }
    }
    func addPizzaOrder(size: String, pizzaType: String, crust: String, quantity: Int){
        let pizzaOrder = PizzaOrder(context: viewContext)
        
        pizzaOrder.id = UUID()
        pizzaOrder.timestamp = Date()
        
        //User Defined order
        pizzaOrder.size = size
        pizzaOrder.pizza_type = pizzaType
        pizzaOrder.crust = crust
        pizzaOrder.quantity = Int64(quantity)
        
        SaveData()
        fetchPizzaOrders()
        print("addPizzaOrder: Succesfully added order")
    }
    func deletePizzaOrder( indexSet : IndexSet){
        for index in indexSet {
            let pizzaOrder = pizzaOrders[index]
            viewContext.delete(pizzaOrder)
            SaveData()
            fetchPizzaOrders()
        }
        print("deletePizzaOrder: Succesfully deleted order")
    }
    func updatePizzaOrder( id : UUID, newQuantity : Int){
        for pizzaOrder in pizzaOrders {
            if pizzaOrder.id == id{
                pizzaOrder.quantity = Int64(newQuantity)
            }
        }
        
        SaveData()
        fetchPizzaOrders()
        print("updatePizzaOrder: Succesfully updated order, Quantity \(newQuantity)")
    }
    let itemFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .medium
        return formatter
    }()


}
