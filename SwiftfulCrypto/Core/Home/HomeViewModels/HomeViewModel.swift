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

    private let dataService = CoinDataService()
    private var cancellables = Set<AnyCancellable>()

    init() {
        addSubscribers()
    }

    func addSubscribers() {

        // this refers to the allCoins in the CoinDataService file
        dataService.$allCoins
            .sink { [weak self ](returnedCoins) in
                self?.allCoins = returnedCoins
            }
            .store(in: &cancellables)
    }

}
