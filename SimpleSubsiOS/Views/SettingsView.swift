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
						
						Spacer()
						
						Button {
							
						} label: {
							Text("Save")
								.bold()
								.padding()
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
					
					HStack{
						TextField("Email", text: $appViewModel.user.email)
							.padding(.leading, screenWidth * 0.1)
							.background(
								RoundedRectangle(cornerRadius: 25)
									.foregroundStyle(.quaternary)
									.frame(width: screenWidth * 0.8, height: screenHeight/14)
							)
							.padding()
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
