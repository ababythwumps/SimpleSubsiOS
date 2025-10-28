//
//  MultipleListPickerView.swift
//  SimpleSubsiOS
//
//  Created by Michael Kao on 10/27/25.
//

import SwiftUI

struct MultipleListPickerView: View {
	var selectionOptions: [String]
	@Binding var selected: [String]
	
	var screenWidth: CGFloat = 405
	var screenHeight: CGFloat = 880

	private var splitOptions: ([String], [String]) {
		let midIndex = (selectionOptions.count + 1) / 2
		let first = Array(selectionOptions.prefix(midIndex))
		let second = Array(selectionOptions.suffix(from: midIndex))
		return (first, second)
	}
	
	var body: some View {
		HStack {
			VStack(alignment: .leading, spacing: 8) {
				ForEach(splitOptions.0, id: \.self) { option in
					Button {
						if self.selected.contains(option) {
							self.selected.removeAll(where: { $0 == option })
						} else {
							self.selected.append(option)
						}
					} label: {
						HStack {
							Image(systemName: self.selected.contains(option) ? "checkmark.square.fill" : "square")
							Text(option)
						}
					}
					.buttonStyle(.plain)
				}
			}
			.padding()
			
			VStack(alignment: .leading, spacing: 8) {
				ForEach(splitOptions.1, id: \.self) { option in
					Button {
						if self.selected.contains(option) {
							self.selected.removeAll(where: { $0 == option })
						} else {
							self.selected.append(option)
						}
					} label: {
						HStack {
							Image(systemName: self.selected.contains(option) ? "checkmark.square.fill" : "square")
							Text(option)
						}
					}
					.buttonStyle(.plain)
				}
			}
			.padding()
		}
	}
}

#Preview {
	@Previewable @State var selected: [String] = []
	
	MultipleListPickerView(selectionOptions: ["Hi", "Hello"], selected: $selected)
}
