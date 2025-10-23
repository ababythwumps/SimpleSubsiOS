//
//  Order.swift
//  SimpleSubsiOS
//
//  Created by Michael Kao on 10/23/25.
//

import Foundation

public struct Order: Codable {
	public var id: String
	public var user: User
	public var date: Date
	public var sandwhich: Sandwhich
}
