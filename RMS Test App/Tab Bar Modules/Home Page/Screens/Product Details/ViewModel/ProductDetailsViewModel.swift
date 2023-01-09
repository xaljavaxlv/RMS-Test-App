//
//  ProductDetailsViewModel.swift
//  RVS Test App
//
//  Created by Vlad Zavada on 1/7/23.
//

import Foundation

protocol ProductDetailsViewModelProtocol {
    func productDetailsCellItems() -> [ProductDetailsCellItem]
}

final class ProductDetailsViewModel {

    private var product: Product

    init(product: Product) {
        self.product = product
    }
}

// MARK: - ProductDetailsViewModelProtocol conforming
extension ProductDetailsViewModel: ProductDetailsViewModelProtocol {
    func productDetailsCellItems() -> [ProductDetailsCellItem] {
        ProductDetailsCellType.allCases.map { type in
            switch type {
            case .name: return ProductDetailsCellItem(title: type.titleText, value: product.name)
            case .description: return ProductDetailsCellItem(title: type.titleText, value: product.description)
            }
        }
    }
}
