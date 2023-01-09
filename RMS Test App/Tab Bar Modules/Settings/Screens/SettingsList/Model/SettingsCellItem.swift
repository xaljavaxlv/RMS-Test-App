//
//  SettingsCellItem.swift
//  RVS Test App
//
//  Created by Vlad Zavada on 1/6/23.
//

import Foundation

struct SettingsCellItem {
    let type: SettingsList
    var title: String { type.title }
}

enum SettingsList: String, CaseIterable {
    case pushNotifications
    case locationPermission
    case appFeedback

    var title: String {
        switch self {
        case .pushNotifications: return "Notifications permission"
        case .locationPermission: return "Location permission"
        case .appFeedback: return "Feedback"
        }
    }
}
