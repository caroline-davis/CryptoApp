//
//  CoinImageView.swift
//  SwiftfulCrypto
//
//  Created by Caroline Davis on 23/2/22.
//

import SwiftUI

struct CoinImageView: View {

    @StateObject var vm: CoinImageViewModel

    // need to use _vm to ref the state object of that variable
    init(coin: CoinModel) {
        _vm = StateObject(wrappedValue: CoinImageViewModel(coin: coin))
    }

    var body: some View {
        ZStack {
            if let image = vm.image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
            } else if vm.isLoading {
                ProgressView()
            } else {
                Image(systemName: "questionmark")
                    .foregroundColor(Color.theme.secondaryText)
            }
        }
    }
}

struct CoinImageView_Previews: PreviewProvider {
    static var previews: some View {
        CoinImageView(coin: dev.coin)
            .previewLayout(.sizeThatFits)
    }
}
