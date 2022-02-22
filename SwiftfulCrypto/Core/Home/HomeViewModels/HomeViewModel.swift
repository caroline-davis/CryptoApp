//
//  HomeViewModel.swift
//  SwiftfulCrypto
//
//  Created by Caroline Davis on 22/2/22.
//

import Foundation

// this way we can observe from our view
class HomeViewModel: ObservableObject {

    @Published var allCoins: [CoinModel] = []
    @Published var portfolioCoins: [CoinModel] = []

    init() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.allCoins.append(DeveloperPreview.instance.coin)
            self.portfolioCoins.append(DeveloperPreview.instance.coin)
        }
    }

}
