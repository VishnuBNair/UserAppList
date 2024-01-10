//
//  UserListApp.swift
//  UserList
//
//  Created by Vishnu Nair on 09/01/24.
//

import SwiftUI

@main
struct UserListApp: App {
    
    @EnvironmentObject var viewModel: UsersViewModel
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

struct ContentView: View {
    @State private var isSplashPresented = true
    
    var body: some View {
        ZStack {
            if isSplashPresented {
                // Show splash screen
                SplashView()
                    .onAppear {
                        // Add a delay and then hide the splash screen
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            withAnimation {
                                isSplashPresented = false
                            }
                        }
                    }
            } else {
                // Show main content after splash screen
                UsersView()
            }
        }
    }
}
