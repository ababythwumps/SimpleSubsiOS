//
//  FirebaseAuth.swift
//  SimpleSubsiOS
//
//  Created by Michael Kao on 11/6/25.
//

import Foundation
import FirebaseAuth

@Observable
class AuthManager {
	var currentUser: User?
	var isAuthenticated: Bool {
		currentUser != nil
	}
	
	init() {
		if let authUser = Auth.auth().currentUser {
			self.currentUser = User(authUser: authUser)
			// Load full user data from Firestore here if needed
		}
		
		Auth.auth().addStateDidChangeListener { [weak self] _, authUser in
			if let authUser = authUser {
				self?.currentUser = User(authUser: authUser)
				// Load full user data from Firestore here if needed
			} else {
				self?.currentUser = nil
			}
		}
	}
	
	func signUp(email: String, password: String) async throws {
		let result = try await Auth.auth().createUser(
			withEmail: email,
			password: password
		)
		self.currentUser = User(authUser: result.user)
	}
	
	func signIn(email: String, password: String) async throws {
		let result = try await Auth.auth().signIn(
			withEmail: email,
			password: password
		)
		self.currentUser = User(authUser: result.user)
	}
	
	func signOut() throws {
		try Auth.auth().signOut()
		self.currentUser = nil
	}
	
	func resetPassword(email: String) async throws {
		try await Auth.auth().sendPasswordReset(withEmail: email)
	}
}
