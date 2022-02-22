//
//  SwiftfulCryptoApp.swift
//  SwiftfulCrypto
//
//  Created by Caroline Davis on 21/2/22.
//

import SwiftUI

@main
struct SwiftfulCryptoApp: App {

    @StateObject private var vm = HomeViewModel()

    var body: some Scene {
        WindowGroup {
            NavigationView {
                HomeView()
                    .navigationBarHidden(true)
            }
            .environmentObject(vm)
        }
    }
}
