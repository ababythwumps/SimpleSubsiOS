//
//  AppViewModel.swift
//  SimpleSubsiOS
//
//  Created by Michael Kao on 10/23/25.
//

import Foundation
import Combine

final class AppViewModel: ObservableObject {
	@Published var user: User = User(id: UUID().uuidString, firstName: "John", lastName: "Doe", email: "john.doe@lwhs.org", grade: 10, allergies: ["peanuts"], presets: [])
	@Published var upcomingOrders: [Order] = []
	
	var breadOptions = ["Dutch Crunch", "Sourdough Roll", "Ciabatta", "Sliced Wheat", "Sliced Sourdough", "Gluten Free", "No Bread"]
	var meatOptions = ["No Meat", "Turkey", "Roast Beef", "Salami", "Ham", "Tuna Salad", "Egg Salad"]
	var cheeseOptions = ["No Cheese", "Provolone", "Swiss", "Cheddar", "Fresh Mozzarella"]
	var condimentsOptions = ["Lettuce", "Vin/Olive Oil", "Roasted Red Pepper", "Jalapenos", "Pickles", "Hummus", "Mayo", "Tomatoes", "Basil", "Red Onions", "Pepperoncini", "Pesto", "Artichoke Hearts", "Mustard"]
	var extrasOptions = ["Bacon", "Avocado"]
}
