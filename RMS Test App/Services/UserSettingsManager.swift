//
//  UserSettingsManager.swift
//  RVS Test App
//
//  Created by Vlad Zavada on 1/6/23.
//

import UIKit
import UserNotifications
import CoreLocation

final class UserSettingsManager {
    static let shared = UserSettingsManager()
    private let defaults = UserDefaults.standard
    private let locationManager = CLLocationManager()

    private init() {}

    func isNotificationsAllowed(completion: @escaping (Bool) -> Void) {
        UNUserNotificationCenter.current().getNotificationSettings { [unowned defaults] settings in
            var value = settings.authorizationStatus == .authorized
            if value {
                value = defaults.bool(forKey: SettingsList.pushNotifications.rawValue)
            }
            completion(value)
        }
    }

    func saveNotificationsNewWalue(value: Bool) {
        if value {
            requestNotificationsPermit()
        }

        UNUserNotificationCenter.current().getNotificationSettings { settings in
            let status = settings.authorizationStatus == .authorized
            if status {
                UserDefaults.standard.set(value, forKey: SettingsList.pushNotifications.rawValue)
            }
        }
    }

    func requestNotificationsPermit() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert]) { success, _ in
            if !success {
                DispatchQueue.main.async {
                    if let appSettings = URL(string: UIApplication.openSettingsURLString), UIApplication.shared.canOpenURL(appSettings) {
                        UIApplication.shared.open(appSettings)
                    }
                }
            }
        }
    }

    func isLocationUsingAllowed() -> Bool {
        var value = locationManager.authorizationStatus != .denied
        if value {
            value = defaults.bool(forKey: SettingsList.locationPermission.rawValue)
        }
        return value
    }

    func saveLocationPermitionStatus(value: Bool) {
        defaults.set(value, forKey: SettingsList.locationPermission.rawValue)
        guard value else { return }
        locationManager.requestWhenInUseAuthorization()
    }
}


