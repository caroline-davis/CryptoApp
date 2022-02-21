//
//  SwiftfulCryptoApp.swift
//  SwiftfulCrypto
//
//  Created by Caroline Davis on 21/2/22.
//

import SwiftUI

@main
struct SwiftfulCryptoApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                HomeView()
                    .navigationBarHidden(true)
            }
        }
    }
}
