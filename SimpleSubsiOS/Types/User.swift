//
//  User.swift
//  SimpleSubsiOS
//
//  Created by Michael Kao on 10/23/25.
//

import Foundation
import FirebaseAuth

public struct User: Codable, Identifiable {
	public var id: String
	public var firstName: String
	public var lastName: String
	public var email: String
	public var grade: Int
	public var allergies: [String]
	public var presets: [Preset]
	
	public init(authUser: FirebaseAuth.User) {
		self.id = authUser.uid
		self.email = authUser.email ?? ""
		self.firstName = ""
		self.lastName = ""
		self.grade = 0
		self.allergies = []
		self.presets = []
	}
	
	public init(
		id: String,
		firstName: String,
		lastName: String,
		email: String,
		grade: Int,
		allergies: [String] = [],
		presets: [Preset] = []
	) {
		self.id = id
		self.firstName = firstName
		self.lastName = lastName
		self.email = email
		self.grade = grade
		self.allergies = allergies
		self.presets = presets
	}
}
