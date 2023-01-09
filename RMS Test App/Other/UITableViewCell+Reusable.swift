//
//  UITableViewCell+Reusable.swift
//  RVS Test App
//
//  Created by Vlad Zavada on 1/6/23.
//

import UIKit

extension UITableViewCell {

    static var identifier: String {
        String(describing: Self.self)
    }
}
