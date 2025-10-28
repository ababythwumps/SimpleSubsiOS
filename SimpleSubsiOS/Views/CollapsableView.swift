//
//  CollapsableView.swift
//  SimpleSubsiOS
//
//  Created by Michael Kao on 10/27/25.
//

import SwiftUI

struct Collapsible<Content: View>: View {
	@State var label: () -> Text
	@State var content: () -> Content
	
	@State private var collapsed: Bool = true
	
	var screenWidth: CGFloat = 405
	var screenHeight: CGFloat = 880
	
	var body: some View {
		VStack {
			Button(
				action: { self.collapsed.toggle() },
				label: {
					HStack {
						self.label()
						
						Spacer()
						
						Image(systemName: self.collapsed ? "chevron.down" : "chevron.up")
					}
					.padding(.bottom, 1)
					.background(Color.white.opacity(0.01))
				}
			)
			.buttonStyle(PlainButtonStyle())
			.frame(width: screenWidth * 0.6)
			
			VStack {
				self.content()
			}
			.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: collapsed ? 0 : .none)
			.clipped()
			.animation(.easeOut, value: self.collapsed)
			.transition(.slide)
		}.frame(width: screenWidth * 0.6)
	}
}

#Preview {
    Collapsible(label: { Text("Example Label") }, content: { Text("This is the collapsible content.") })
}
