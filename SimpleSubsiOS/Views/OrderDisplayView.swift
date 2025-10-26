//
//  OrderDisplayView.swift
//  SimpleSubsiOS
//
//  Created by Michael Kao on 10/23/25.
//

import SwiftUI

struct OrderDisplayView: View {
	var order: Order
	
	var screenWidth: CGFloat = 405
	var screenHeight: CGFloat = 880
	
	var body: some View {
		ExpandableView(thumbnail: ThumbnailView {
			Text(order.date, format: Date.FormatStyle().month(.abbreviated).day(.twoDigits))
				.font(.title2)
				.bold()
				.frame(width: screenWidth * 0.4, height: screenHeight/15)
				.padding(.trailing, screenWidth * 0.5)
		}, expanded: ExpandedView {
			VStack {
				Text(order.date, format: Date.FormatStyle().month(.abbreviated).day(.twoDigits))
					.font(.title2)
					.bold()
					.padding(.trailing, screenWidth/2)
					.padding(.top, -6.5)
				
				Text("\(order.user.allergies.count > 0 ? order.user.allergies.joined(separator: ", ") : "no allergies")")
				
				Text("\(order.sandwhich.bread), \(order.sandwhich.cheese), \(order.sandwhich.chips ? "chips" : "no chips")")
				Text("\(order.sandwhich.condiments.joined(separator: ", ")),")
				Text("\(order.sandwhich.extras.count > 0 ? order.sandwhich.extras.joined(separator: ", ") : "no extras")")
				
				HStack {
					Button {
						
					} label: {
						ZStack {
							RoundedRectangle(cornerRadius: 20)
								.frame(width: screenWidth * 0.25, height: screenHeight/20)
								.foregroundStyle(.gray)
							
							Text("Edit")
								.foregroundStyle(.primary)
								.font(.headline)
								.bold()
						}
					}.buttonStyle(.plain)
					
					Button {
						
					} label: {
						ZStack {
							RoundedRectangle(cornerRadius: 20)
								.frame(width: screenWidth * 0.25, height: screenHeight/20)
								.foregroundStyle(.secondary)
								.foregroundStyle(.red)
							
							Text("Delete")
								.foregroundStyle(.white)
								.font(.headline)
								.bold()
						}
					}.buttonStyle(.plain)
				}
			}
				.padding(.horizontal, 45)
				.padding(.vertical)
		}, thumbnailViewBackgroundColor: Color(.lightGray).opacity(0.3), expandedViewBackgroundColor: Color(.lightGray).opacity(0.3))
	}
}

#Preview {
	OrderDisplayView(order: Order(id: UUID().uuidString, user: User(id: UUID().uuidString, firstName: "John", lastName: "Doe", email: "example@gmail.com", grade: 10, allergies: []), date: Date(), sandwhich: Sandwhich(bread: "Dutch Crunch", meat: "Turkey", cheese: "None", condiments: ["Pesto", "Mayo"], extras: [], chips: true)))
}

struct ExpandableView: View {
	@Namespace private var namespace
	@State private var show = false
	
	var thumbnail: ThumbnailView
	var expanded: ExpandedView
	
	var thumbnailViewBackgroundColor: Color = .gray.opacity(0.8)
	var expandedViewBackgroundColor: Color = .gray
	
	var thumbnailViewCornerRadius: CGFloat = 20
	var expandedViewCornerRadius: CGFloat = 20
	
	var body: some View {
		ZStack {
			if !show {
				thumbnailView()
			} else {
				expandedView()
			}
		}
		.onTapGesture {
			if !show {
				withAnimation (.spring(response: 0.6, dampingFraction: 0.8)){
					show.toggle()
				}
			}
		}
	}
	
	@ViewBuilder
	private func thumbnailView() -> some View {
		ZStack {
			thumbnail
				.matchedGeometryEffect(id: "view", in: namespace)
		}
		.background(
			thumbnailViewBackgroundColor.matchedGeometryEffect(id: "background", in: namespace)
		)
		.mask(
			RoundedRectangle(cornerRadius: thumbnailViewCornerRadius, style: .continuous)
				.matchedGeometryEffect(id: "mask", in: namespace)
		)
	}
	
	@ViewBuilder
	private func expandedView() -> some View {
		ZStack {
			expanded
				.matchedGeometryEffect(id: "view", in: namespace)
			.background(
				expandedViewBackgroundColor
					.matchedGeometryEffect(id: "background", in: namespace)
			)
			.mask(
				RoundedRectangle(cornerRadius: expandedViewCornerRadius, style: .continuous)
					.matchedGeometryEffect(id: "mask", in: namespace)
			)

			Button {
				withAnimation(.spring(response: 0.6, dampingFraction: 0.8)) {
					show.toggle()
				}
			} label: {
				Image(systemName: "xmark")
					.foregroundStyle(.primary)
			}
			.buttonStyle(.plain)
			.padding()
			.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
			.matchedGeometryEffect(id: "mask", in: namespace)
		}
	}
}

struct ThumbnailView: View, Identifiable {
	var id = UUID()
	@ViewBuilder var content: any View
	
	var body: some View {
		ZStack {
			AnyView(content)
		}
	}
}

struct ExpandedView: View, Identifiable {
	var id = UUID()
	@ViewBuilder var content: any View
	
	var body: some View {
		ZStack {
			AnyView(content)
		}
	}
}
