//
//  AppViewModel.swift
//  SimpleSubsiOS
//
//  Created by Michael Kao on 10/23/25.
//

import Foundation
import Combine

final class AppViewModel: ObservableObject {
	@Published var user: User = User(id: UUID().uuidString, name: "John Doe", email: "john.doe@lwhs.org", allergies: ["peanuts"])
	@Published var upcomingOrders: [Order] = [Order(id: UUID().uuidString, user: User(id: UUID().uuidString, name: "John Doe", email: "john.dow@lhws.org", allergies: ["peanuts"]), date: Date(), sandwhich: Sandwhich(bread: "Dutch Crunch", meat: "Turkey", cheese: "none", condiments: ["Pesto", "Mayo"], extras: [], chips: true))]
}
