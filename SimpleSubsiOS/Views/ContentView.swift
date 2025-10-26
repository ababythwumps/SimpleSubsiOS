//
//  ContentView.swift
//  SimpleSubsiOS
//
//  Created by Michael Kao on 10/23/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
	@StateObject var appViewModel = AppViewModel()

	@State private var screenWidth: CGFloat = 0
	@State private var screenHeight: CGFloat = 0
	@State private var isShowingSettings: Bool = false
	
    var body: some View {
		ZStack {
			Color(.secondarySystemBackground)
				.ignoresSafeArea(edges: .all)
			
			GeometryReader { geometry in
				VStack {
					HStack {
						Button {
							// TODO: Sign the user out
						} label: {
							Image(systemName: "door.left.hand.open")
								.resizable()
								.aspectRatio(contentMode: .fit)
								.frame(width: screenWidth/15, height: screenHeight/15)
								.foregroundStyle(.primary)
								.padding(.horizontal)
								.padding(.top)
						}.buttonStyle(.plain)
						
						Spacer()
						
						Text("Your Orders")
							.font(.largeTitle)
							.bold()
							.foregroundStyle(.primary)
							.padding(.horizontal)
							.padding(.top)
						
						Spacer()
						
						Button {
							isShowingSettings = true
						} label: {
							Image(systemName: "gearshape")
								.resizable()
								.aspectRatio(contentMode: .fit)
								.frame(width: screenWidth/11, height: screenHeight/15)
								.foregroundStyle(.primary)
								.padding(.horizontal)
								.padding(.top)
						}.buttonStyle(.plain)
					}
					
					Rectangle()
						.frame(width: screenWidth, height: screenHeight/350)
					
					if appViewModel.upcomingOrders.isEmpty {
						Text("No orders yet")
							.font(.title3)
							.foregroundStyle(.secondary)
							.padding()
					} else {
						ScrollView {
							ForEach(appViewModel.upcomingOrders, id: \.id) { order in
								OrderDisplayView(order: order, screenWidth: screenWidth, screenHeight: screenHeight)
							}
						}.padding()
					}
				}
				.onAppear {
					screenWidth = geometry.size.width
					screenHeight = geometry.size.height
				}
				.onChange(of: geometry.size.height) { oldHeight, newHeight in
					screenHeight = newHeight
				}
				.onChange(of: geometry.size.width) { oldWidth, newWidth in
					screenWidth = newWidth
				}
			}
			
			VStack {
				Spacer()
				
				Button {
					// TODO: Show ordering screen
				} label: {
					ZStack {
						Text("New Order")
							.frame(width: screenWidth * 0.8, height: screenHeight/12)
							.font(.title2)
							.bold()
							.glassEffect(.clear.tint(.green))
							.foregroundStyle(.white)
					}
				}.buttonStyle(.plain)
			}
			
			.sheet(isPresented: $isShowingSettings) {
				SettingsView(appViewModel: appViewModel)
			}
		}
	}
}

#Preview {
    ContentView()
}
