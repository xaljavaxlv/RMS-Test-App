//
//  MyAccountDataProvider.swift
//  RVS Test App
//
//  Created by Vlad Zavada on 1/6/23.
//

import Foundation

protocol MyAccountDataProviderProtocol {
    func fetchUser() -> User
}

final class MyAccountDataProvider: MyAccountDataProviderProtocol {
    func fetchUser() -> User {
        User(id: 1,
             name: "Foo",
             email: "Bar",
             phone: "+1 (323) 356-5079",
             address: "Baz",
             languageCode: "en"
        )
    }

    func updateUserInDataBase() {
        // here is POST request to API with updated User data
    }
}
