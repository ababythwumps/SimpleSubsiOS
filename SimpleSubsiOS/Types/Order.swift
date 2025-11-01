//
//  Order.swift
//  SimpleSubsiOS
//
//  Created by Michael Kao on 10/23/25.
//

import Foundation
import Combine
import SwiftUI

public struct Order: Codable, Identifiable {
	public var id: String
	public var user: User
	public var date: Date
	public var sandwhich: Sandwhich
}

extension Order: Equatable {
	public static func == (lhs: Order, rhs: Order) -> Bool {
		return lhs.id == rhs.id &&
			   lhs.user.id == rhs.user.id &&
			   lhs.date == rhs.date
	}
}
