//
//  LogInView.swift
//  SimpleSubsiOS
//
//  Created by Michael Kao on 11/7/25.
//

import SwiftUI

struct LogInView: View {
	@State private var authManager = AuthManager()
	@State private var email = ""
	@State private var password = ""
	@State private var errorMessage = ""
	
    var body: some View {
		VStack(spacing: 20) {
			TextField("Email", text: $email)
				.textInputAutocapitalization(.never)
				.autocorrectionDisabled()
			
			SecureField("Password", text: $password)
			
			Button("Sign In") {
				Task {
					do {
						try await authManager.signIn(
							email: email,
							password: password
						)
					} catch {
						errorMessage = error.localizedDescription
					}
				}
			}
			
			if !errorMessage.isEmpty {
				Text(errorMessage)
					.foregroundStyle(.red)
			}
		}
		.padding()
    }
}

#Preview {
    LogInView()
}
