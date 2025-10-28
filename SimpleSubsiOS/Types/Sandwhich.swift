//
//  Sandwhich.swift
//  SimpleSubsiOS
//
//  Created by Michael Kao on 10/23/25.
//

import Foundation

public class Sandwhich: Codable {
	public var bread: String
	public var meat: String
	public var cheese: String
	public var condiments: [String]
	public var extras: [String]
	public var chips: Bool
	
	public init(bread: String, meat: String, cheese: String, condiments: [String], extras: [String], chips: Bool) {
		self.bread = bread
		self.meat = meat
		self.cheese = cheese
		self.condiments = condiments
		self.extras = extras
		self.chips = chips
	}
}
