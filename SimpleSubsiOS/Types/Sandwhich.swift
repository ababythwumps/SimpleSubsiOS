//
//  Sandwhich.swift
//  SimpleSubsiOS
//
//  Created by Michael Kao on 10/23/25.
//

import Foundation

public struct Sandwhich: Codable {
	public var bread: String
	public var meat: String
	public var cheese: String
	public var condiments: [String]
	public var extras: [String]
	public var chips: Bool
}
