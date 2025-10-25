//
//  AppViewModel.swift
//  SimpleSubsiOS
//
//  Created by Michael Kao on 10/23/25.
//

import Foundation
import Combine

final class AppViewModel: ObservableObject {
	@Published var user: User = User(id: UUID().uuidString, firstName: "John", lastName: "Doe", email: "john.doe@lwhs.org", grade: 10, allergies: ["peanuts"])
	@Published var upcomingOrders: [Order] = [Order(id: UUID().uuidString, user: User(id: UUID().uuidString, firstName: "John", lastName: "Doe", email: "john.dow@lhws.org", grade: 10, allergies: ["peanuts", "vegetarian"]), date: Date(), sandwhich: Sandwhich(bread: "Dutch Crunch", meat: "Turkey", cheese: "none", condiments: ["Pesto", "Mayo"], extras: [], chips: true))]
}
