//
//  ProductDetailsCellItem.swift
//  RVS Test App
//
//  Created by Vlad Zavada on 1/8/23.
//

import Foundation

struct ProductDetailsCellItem {
    let title: String
    let value: String
}

enum ProductDetailsCellType: CaseIterable {
    case name, description

    var titleText: String {
        switch self {
        case .name: return "Name:"
        case .description: return "Description:"
        }
    }
}
