//
//  UserCellItem.swift
//  RVS Test App
//
//  Created by Vlad Zavada on 1/6/23.
//

import Foundation

struct UserCellItem {
    let title: String
    let value: String
}

enum MyAccountCellType: String, CaseIterable {
    case name, email, address
    case phone = "Phone Number"
    case language = "Preferred language"
}
