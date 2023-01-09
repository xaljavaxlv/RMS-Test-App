//
//  ScreenBuilder.swift
//  RVS Test App
//
//  Created by Vlad Zavada on 1/8/23.
//

import UIKit

final class ScreenBuilder {

    private init() {}

    static func screateHome() -> UIViewController {
        let homeDataProvider = HomeDataProvider()
        let homeVCViewModel = HomeViewModel(recentPurchasesList: homeDataProvider.fetchRecentPurchases())
        return HomeVC(viewModel: homeVCViewModel)
    }

    static func createMyAccount() -> UIViewController {
        let myAccountDataProvider = MyAccountDataProvider()
        let myAccountViewModel = MyAccountViewModel(user: myAccountDataProvider.fetchUser())
        return MyAccountVC(viewModel: myAccountViewModel)
    }

    static func createSettings() -> UIViewController {
        let settingsVCViewModel = SettingsViewModel()
        return SettingsVC(viewModel: settingsVCViewModel)
    }

    static func createProductDetails(product: Product) -> UIViewController {
        let viewModel = ProductDetailsViewModel(product: product)
        return ProductDetailsVC(viewModel: viewModel)
    }

    static func createFeedback() -> UIViewController {
        FeedbackVC()
    }
}
