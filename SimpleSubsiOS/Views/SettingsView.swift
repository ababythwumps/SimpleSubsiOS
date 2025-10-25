//
//  SettingsView.swift
//  SimpleSubsiOS
//
//  Created by Michael Kao on 10/23/25.
//

import SwiftUI

struct SettingsView: View {
	@ObservedObject var appViewModel: AppViewModel
	
	@State private var screenWidth: CGFloat = 0
	@State private var screenHeight: CGFloat = 0
	
	var body: some View {
		GeometryReader { geometry in
			ZStack {
				Color(.secondarySystemBackground)
					.ignoresSafeArea()
				
				VStack {
					HStack {
						Text("Settings")
							.font(.largeTitle)
							.bold()
							.padding()
							.padding(.top)
						
						Spacer()
						
						Button {
							// TODO: save the user profile updates
						} label: {
							Text("Save")
								.bold()
								.foregroundStyle(.green)
								.padding()
								.padding(.top)
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
					
					HStack {
						Text("First Name:")
							.font(.title3)
							.foregroundStyle(.primary)
							.padding(.vertical)
							.padding(.leading)
						
						TextField("First Name", text: $appViewModel.user.firstName)
							.padding(.leading, screenWidth * 0.07)
							.background(
								RoundedRectangle(cornerRadius: 25)
									.foregroundStyle(.quaternary)
									.frame(width: screenWidth * 0.59, height: screenHeight/18)
							)
							.padding(.vertical)
							.padding(.trailing)
					}
					
					HStack {
						Text("Last Name:")
							.font(.title3)
							.foregroundStyle(.primary)
							.padding(.vertical)
							.padding(.leading)
						
						TextField("Last Name", text: $appViewModel.user.lastName)
							.padding(.leading, screenWidth * 0.075)
							.background(
								RoundedRectangle(cornerRadius: 25)
									.foregroundStyle(.quaternary)
									.frame(width: screenWidth * 0.59, height: screenHeight/18)
							)
							.padding(.vertical)
							.padding(.trailing)
					}
					
					HStack {
						Text("Email:")
							.font(.title3)
							.foregroundStyle(.primary)
							.padding(.vertical)
							.padding(.leading)
						
						TextField("Email", text: $appViewModel.user.email)
							.padding(.leading, screenWidth * 0.08)
							.background(
								RoundedRectangle(cornerRadius: 25)
									.foregroundStyle(.quaternary)
									.frame(width: screenWidth * 0.7, height: screenHeight/18)
							)
							.padding(.vertical)
							.padding(.trailing)
					}
					
					HStack {
						Text("Password:")
							.font(.title3)
							.foregroundStyle(.primary)
							.padding(.vertical)
							.padding(.leading)
						
						TextField("Password", text: $appViewModel.user.email) // TODO: change, but make sure it's secure
							.padding(.leading, screenWidth * 0.08)
							.background(
								RoundedRectangle(cornerRadius: 25)
									.foregroundStyle(.quaternary)
									.frame(width: screenWidth * 0.61, height: screenHeight/18)
							)
							.padding(.vertical)
							.padding(.trailing)
					}
					
					HStack {
						Text("Grade:")
							.font(.title3)
							.foregroundStyle(.primary)
							.padding(.vertical)
							.padding(.leading)
						
						Spacer()
						
						Picker("Grade:", selection: $appViewModel.user.grade) {
							ForEach(9...12, id: \.self) { option in
								Text("\(option)").tag(option)
							}
						}
						.pickerStyle(.menu)
						.tint(.green)
						.padding(.horizontal)
					}
					
					HStack {
						Text("Allergies:")
							.font(.title3)
							.foregroundStyle(.primary)
							.padding(.vertical)
							.padding(.leading)
						
						Spacer()
						
						Button {
							appViewModel.user.allergies.append("")
						} label: {
							Image(systemName: "plus.circle")
								.resizable()
								.frame(width: screenWidth/15, height: screenWidth/15)
								.padding(.horizontal)
						}.buttonStyle(.plain)
					}
					
					ForEach(0...appViewModel.user.allergies.count - 1, id: \.self) { allergy in
						TextField("allergy", text: $appViewModel.user.allergies[allergy])
							.padding(.leading, screenWidth/20)
							.background(
								RoundedRectangle(cornerRadius: 25)
									.foregroundStyle(.quaternary)
									.frame(width: screenWidth * 0.9, height: screenHeight/18)
							)
							.padding(.horizontal)
							.padding(.bottom)
					}
					
					Spacer()
				}
			}
		}
	}
}

#Preview {
    SettingsView(appViewModel: AppViewModel())
}
