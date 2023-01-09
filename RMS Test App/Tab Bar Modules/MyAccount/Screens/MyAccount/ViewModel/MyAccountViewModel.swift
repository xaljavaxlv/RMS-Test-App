//
//  MyAccountViewModel.swift
//  RVS Test App
//
//  Created by Vlad Zavada on 1/6/23.
//

import Foundation

protocol MyAccountViewModelProtocol {
    func userCellItems() -> [UserCellItem]
}

class MyAccountViewModel {

    private var user: User

    init(user: User) {
        self.user = user
    }
}

// MARK: - MyAccountViewModelProtocol conforming
extension MyAccountViewModel: MyAccountViewModelProtocol {
    func userCellItems() -> [UserCellItem] {
        MyAccountCellType.allCases.map { cellItem in
            switch cellItem {
            case .name: return UserCellItem(title: MyAccountCellType.name.rawValue, value: user.name)
            case .email: return UserCellItem(title: MyAccountCellType.email.rawValue, value: user.email)
            case .phone: return UserCellItem(title: MyAccountCellType.phone.rawValue, value: user.phone)
            case .address: return UserCellItem(title: MyAccountCellType.address.rawValue, value: user.address)
            case .language: return UserCellItem(title: MyAccountCellType.language.rawValue, value: user.languageCode)
            }
        }
    }
}
