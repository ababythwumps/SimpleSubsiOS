//
//  OrderDisplayView.swift
//  SimpleSubsiOS
//
//  Created by Michael Kao on 10/23/25.
//

import SwiftUI

struct OrderDisplayView: View {
	@ObservedObject var appViewModel: AppViewModel
	
	@Binding var order: Order
	
	@State private var showingPresetNameAlert = false
	@State private var presetName = ""
	
	@State private var showingPresetListAlert = false
	
	var screenWidth: CGFloat = 405
	var screenHeight: CGFloat = 880
	
	var body: some View {
		ExpandableView(thumbnail: ThumbnailView {
			HStack {
				Text(order.date, format: Date.FormatStyle().month(.abbreviated).day(.twoDigits))
					.font(.title2)
					.bold()
					.frame(width: screenWidth * 0.4, height: screenHeight/15)
					.padding(.trailing, screenWidth * 0.5)
				
				Image(systemName: "plus")
					.padding(.trailing,screenWidth * 0.1)
			}.frame(width: screenWidth * 0.9)
		}, expanded: ExpandedView {
			VStack {
				Text(order.date, format: Date.FormatStyle().month(.abbreviated).day(.twoDigits))
					.font(.title2)
					.bold()
					.padding(.trailing, screenWidth/2)
					.padding(.top, -6.5)
				
				Collapsible(label: {
					Text("Bread: \(order.sandwhich.bread)")
						.font(.title3)
				}, content: {
					ListPickerView(selectionOptions: appViewModel.breadOptions,
								   selectedSingle: $order.sandwhich.bread)
						.padding(.trailing)
						.padding(.top, -15)
				}).frame(width: screenWidth * 0.6)
				
				Collapsible(label: {
					Text("Meat: \(order.sandwhich.meat)")
						.font(.title3)
				}, content: {
					ListPickerView(selectionOptions: appViewModel.meatOptions, selectedSingle: $order.sandwhich.meat)
						.padding(.trailing)
						.padding(.top, -15)
				}).frame(width: screenWidth * 0.6)
				
				Collapsible(label: {
					Text("Cheese: \(order.sandwhich.cheese)")
						.font(.title3)
				}, content: {
					ListPickerView(selectionOptions: appViewModel.cheeseOptions, selectedSingle: $order.sandwhich.cheese)
						.padding(.trailing)
						.padding(.top, -15)
				}).frame(width: screenWidth * 0.6)
				
				Collapsible(label: {
					Text("Condiments: \(order.sandwhich.condiments.isEmpty ? "None" : String(describing: order.sandwhich.condiments.first!))\(order.sandwhich.condiments.count > 1 && !order.sandwhich.condiments.isEmpty ? "..." : "")")
						.font(.title3)
				}, content: {
					MultipleListPickerView(selectionOptions: appViewModel.condimentsOptions, selected: $order.sandwhich.condiments)
						.font(.caption)
						.padding(.top, -15)
						.padding(.leading, 5)
						.frame(width: screenWidth * 0.8)
				})
				
				Collapsible(label: {
					Text("Extras: \(order.sandwhich.extras.isEmpty ? "None" : String(describing: order.sandwhich.extras.first!))\(order.sandwhich.extras.count > 1 && !order.sandwhich.extras.isEmpty ? "..." : "")")
						.font(.title3)
				}, content: {
					MultipleListPickerView(selectionOptions: appViewModel.extrasOptions, selected: $order.sandwhich.extras, screenWidth: screenWidth)
						.padding(.top, -15)
				}).frame(width: screenWidth * 0.6)
				
				HStack {
					Toggle("Chips: ", isOn: $order.sandwhich.chips)
						.font(.title3)
				}.frame(width: screenWidth * 0.6)
				
				HStack {
					Button {
						showingPresetListAlert.toggle()
					} label: {
						ZStack {
							RoundedRectangle(cornerRadius: 20)
								.frame(width: screenWidth * 0.3, height: screenHeight/20)
								.foregroundStyle(.secondary)
								.foregroundStyle(.blue)
							
							HStack {
								Image(systemName: "fork.knife")
									.foregroundStyle(.white)
								
								Text("Use Preset")
									.foregroundStyle(.white)
									.font(.callout)
									.bold()
							}
						}
					}.confirmationDialog("Presets", isPresented: $showingPresetListAlert) {
						ForEach(appViewModel.user.presets, id: \.name) { preset in
							Button(preset.name) {
								order.sandwhich = preset.sandwhich.copy()
								print(order.sandwhich.bread, preset.sandwhich.bread)
							}
						}
						Button("Cancel", role: .cancel) { }
					} message: {
						Text("Select a Preset")
					}
					
					Button {
						showingPresetNameAlert.toggle()
					} label: {
						ZStack {
							RoundedRectangle(cornerRadius: 20)
								.frame(width: screenWidth * 0.32, height: screenHeight/20)
								.foregroundStyle(.secondary)
								.foregroundStyle(.blue)
							
							HStack {
								Image(systemName: "square.and.pencil")
									.foregroundStyle(.white)
								
								Text("Make Preset")
									.foregroundStyle(.white)
									.font(.callout)
									.bold()
							}
						}
					}.alert("Name your preset", isPresented: $showingPresetNameAlert) {
						TextField("Preset Name", text: $presetName)
						Button("OK") {
							let newPreset = Preset(name: presetName, sandwhich: order.sandwhich.copy())
							appViewModel.user.presets.append(newPreset)
						}
					}
				}
				
				HStack {
					Button {
						// TODO: Delete order
					} label: {
						ZStack {
							RoundedRectangle(cornerRadius: 20)
								.frame(width: screenWidth * 0.25, height: screenHeight/20)
								.foregroundStyle(.secondary)
								.foregroundStyle(.red)
							
							HStack {
								Image(systemName: "trash")
									.foregroundStyle(.white)
								
								Text("Delete")
									.foregroundStyle(.white)
									.font(.callout)
									.bold()
							}
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
	@Previewable @State var sandwhich = Sandwhich(bread: "Dutch Crunch", meat: "Turkey", cheese: "None", condiments: ["Pesto", "Mayo"], extras: [], chips: true)
	
	OrderDisplayView(appViewModel: AppViewModel(), order: .constant(Order(id: UUID().uuidString, user: User(id: UUID().uuidString, firstName: "John", lastName: "Doe", email: "example@gmail.com", grade: 10, allergies: [], presets: []), date: Date(), sandwhich: Sandwhich(bread: "Dutch Crunch", meat: "Turkey", cheese: "None", condiments: ["Pesto", "Mayo"], extras: [], chips: true))))
}

