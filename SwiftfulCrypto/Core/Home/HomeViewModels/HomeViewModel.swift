//
//  HomeViewModel.swift
//  SwiftfulCrypto
//
//  Created by Caroline Davis on 22/2/22.
//

import Foundation
import Combine

// this way we can observe from our view
class HomeViewModel: ObservableObject {

    @Published var allCoins: [CoinModel] = []
    @Published var portfolioCoins: [CoinModel] = []
    @Published var searchText: String = ""
    @Published var statistics: [StatisticModel] = [
        StatisticModel(title: "Title", value: "Value", percentageChange: 1),
        StatisticModel(title: "Title", value: "Value"),
        StatisticModel(title: "Title", value: "Value"),
        StatisticModel(title: "Title", value: "Value", percentageChange: -7)
    ]

    private let dataService = CoinDataService()
    private var cancellables = Set<AnyCancellable>()

    init() {
        addSubscribers()
    }

    func addSubscribers() {

        // updates all coins
        $searchText
            // this adds the allCoins subscriber to the searchText subscriber and we can filter/match
            .combineLatest(dataService.$allCoins)
            // this will wait 0.5 seconds before it runs the code (this is for people typing super fast)
            // it stops the app needing to run the below code on every keystroke
            .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main)
            .map(filterCoins)
            .sink { [weak self ](returnedCoins) in
                self?.allCoins = returnedCoins
            }
            .store(in: &cancellables)
    }


    private func filterCoins(text: String, coins: [CoinModel]) -> [CoinModel] {
        guard !text.isEmpty else {
            return coins
        }

        let lowercasedText = text.lowercased()

        return coins.filter { (coin) -> Bool in
            return coin.name.lowercased().contains(lowercasedText) ||
                coin.symbol.lowercased().contains(lowercasedText) ||
                coin.id.lowercased().contains(lowercasedText)
        }
    }

}
