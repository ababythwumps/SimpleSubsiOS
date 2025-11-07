//
//  SimpleSubsiOSApp.swift
//  SimpleSubsiOS
//
//  Created by Michael Kao on 10/23/25.
//

import SwiftUI
import SwiftData
import Firebase

@main
struct SimpleSubsiOSApp: App {
	
	init() {
		FirebaseApp.configure()
	}
	
	var body: some Scene {
		WindowGroup {
			ContentView()
		}
	}
}
