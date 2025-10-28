//
//  ListPickerView.swift
//  SimpleSubsiOS
//
//  Created by Michael Kao on 10/27/25.
//

import SwiftUI

struct ListPickerView: View {
	var selectionOptions: [String]
	@Binding var selectedSingle: String
	
	var screenWidth: CGFloat = 405
	var screenHeight: CGFloat = 880
	
    var body: some View {
		VStack(alignment: .leading, spacing: 8) {
			ForEach(selectionOptions, id: \.self) { option in
				Button {
					self.selectedSingle = option
				} label: {
					Image(systemName: self.selectedSingle == option ? "checkmark.circle.fill" : "circle")
					
					Text(option)
				}.buttonStyle(.plain)
			}
		}
		.padding()
    }
}

#Preview {
	@Previewable @State var selectedSingle: String = "Dutch Crunch"
	
	ListPickerView(selectionOptions: ["Dutch Crunch", "Sourdough Roll", "Ciabatta", "Sliced Wheat", "Sliced Sourdough", "Gluten Free", "No Bread"], selectedSingle: $selectedSingle)
}
