//
//  OrderDisplayView.swift
//  SimpleSubsiOS
//
//  Created by Michael Kao on 10/23/25.
//

import SwiftUI

struct OrderDisplayView: View {
	var order: Order
	
	var screenWidth: CGFloat = 50
	var screenHeight: CGFloat = 50
	
	var body: some View {
		ZStack {
			HStack {
				Spacer()
				
				RoundedRectangle(cornerRadius: 35)
					.frame(width: screenWidth * 0.8, height: screenHeight/6)
					.foregroundStyle(.quinary)
				
				Spacer()
			}
			
			VStack {
				Text(order.date, format: Date.FormatStyle().month(.abbreviated).day(.twoDigits))
					.font(.title2)
					.bold()
					.padding(.trailing, screenWidth/2)
				
				Text("\(order.user.allergies.count > 0 ? order.user.allergies.joined(separator: ", ") : "no allergies")")
				
				Text("\(order.sandwhich.bread), \(order.sandwhich.cheese), \(order.sandwhich.chips ? "chips" : "no chips")")
				Text("\(order.sandwhich.condiments.joined(separator: ", ")),")
				Text("\(order.sandwhich.extras.count > 0 ? order.sandwhich.extras.joined(separator: ", ") : "no extras")")
			}
		}
	}
}

#Preview {
	OrderDisplayView(order: Order(id: UUID().uuidString, user: User(id: UUID().uuidString, firstName: "John", lastName: "Doe", email: "example@gmail.com", grade: 10, allergies: []), date: Date(), sandwhich: Sandwhich(bread: "Dutch Crunch", meat: "Turkey", cheese: "None", condiments: ["Pesto", "Mayo"], extras: [], chips: true))/*, screenWidth: 50, screenHeight: 50*/)
}
