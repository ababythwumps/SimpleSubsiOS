//
//  User.swift
//  SimpleSubsiOS
//
//  Created by Michael Kao on 10/23/25.
//

import Foundation

public struct User: Codable {
	public var id: String
	public var firstName: String
	public var lastName: String
	public var email: String
	public var grade: Int
	public var allergies: [String]
}
