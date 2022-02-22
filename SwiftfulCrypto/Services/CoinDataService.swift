//
//  CoinDataService.swift
//  SwiftfulCrypto
//
//  Created by Caroline Davis on 23/2/22.
//

import Foundation
import Combine


class CoinDataService {

    // when we update this any subscribers get notified and also update(publish)
    @Published var allCoins: [CoinModel] = []

    var coinSubscription: AnyCancellable?
    // instead of using var subscriotions: Set<AnyCancellable>() so its easier to cancel and know whats in it. so we set it like this then equal it below, and cancel it in recei ve value

    init() {
        getCoins()
    }

    private func getCoins() {

        guard let url = URL(string: "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=250&page=1&sparkline=true&price_change_percentage=24h")
        else { return }

        coinSubscription = NetworkingManager.download(url: url)
            .decode(type: [CoinModel].self, decoder: JSONDecoder())
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self ](returnedCoins) in
                self?.allCoins = returnedCoins
                self?.coinSubscription?.cancel()
            })

    }
}
