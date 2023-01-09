//
//  HomeDataProvider.swift
//  RVS Test App
//
//  Created by Vlad Zavada on 1/6/23.
//

import Foundation

protocol HomeDataProviderProtocol {
    func fetchRecentPurchases() -> [Product]
}

final class HomeDataProvider {

    func fetchRecentPurchases() -> [Product] {
        return [
            Product(name: "Samsung TV- 46”", description: "Some Description for Samsung TV- 46”"),
            Product(name: "Sonos ark sound bar", description: "Some Description for Sonos ark sound bar"),
            Product(name: "MacBook Air-13”", description: "Some Description for MacBook Air-13”")
        ]
    }
}
