//
//  SettingsViewModel.swift
//  RVS Test App
//
//  Created by Vlad Zavada on 1/6/23.
//

import UIKit

protocol SettingsViewModelProtocol: AnyObject {
    var viewController: SettingsVCProtocol? { get }
    func getValueForSettings(settingsItem: SettingsList) -> Bool
    func settingsCellItems() -> [SettingsCellItem]
    func saveNewSettingsValue(settingsItem: SettingsList, value: Bool)
}

final class SettingsViewModel {

    var viewController: SettingsVCProtocol?
    private var isNotificationAllowed = false {
        didSet {
            viewController?.reloadTable()
        }
    }
    private let settings = UserSettingsManager.shared

    init() {
        getNotificationStatus()
    }

    private func getNotificationStatus() {
        settings.isNotificationsAllowed { [weak self] value in
            guard let self = self else { return }
            self.isNotificationAllowed = value
        }
    }

    private func saveNotifictionValue(value: Bool) {
        settings.saveNotificationsNewWalue(value: value)
        viewController?.reloadTable()
    }

    private func saveLocationValue(value: Bool) {
        settings.saveLocationPermitionStatus(value: value)
        viewController?.reloadTable()
    }
}

// MARK: - SettingsViewModelProtocol conforming
extension SettingsViewModel: SettingsViewModelProtocol {
    func getValueForSettings(settingsItem: SettingsList) -> Bool {
        switch settingsItem {
        case .pushNotifications: return isNotificationAllowed
        case .locationPermission: return settings.isLocationUsingAllowed()
        case .appFeedback: return false
        }
    }

    func saveNewSettingsValue(settingsItem: SettingsList, value: Bool) {
        switch settingsItem {
        case .pushNotifications: saveNotifictionValue(value: value)
        case .locationPermission: saveLocationValue(value: value)
        case .appFeedback: break
        }
    }

    func settingsCellItems() -> [SettingsCellItem] {
        SettingsList.allCases.map { SettingsCellItem(type: $0) }
    }
}
