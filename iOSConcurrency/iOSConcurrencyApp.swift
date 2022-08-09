//
//  iOSConcurrencyApp.swift
//  iOSConcurrency
//
//  Created by Dhananjay Kumar on 08/08/22.
//

import SwiftUI

@main
struct iOSConcurrencyApp: App {
    var body: some Scene {
        WindowGroup {
            UsersListView()
                .onAppear{
                    UserDefaults.standard.set(false, forKey: "_UIConstraintBasedLayoutLogUnsatisfiable")
                }
        }
    }
}
