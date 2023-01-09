//
//  HomeViewModel.swift
//  RVS Test App
//
//  Created by Vlad Zavada on 1/6/23.
//

import Foundation

protocol HomeViewModelProtocol {
    var recentPurchasesList: [Product]! { get }
}

final class HomeViewModel: HomeViewModelProtocol {
    var recentPurchasesList: [Product]!

    init(recentPurchasesList: [Product]) {
        self.recentPurchasesList = recentPurchasesList
    }
}
