//
//  SettingsWithSwitchCell.swift
//  RVS Test App
//
//  Created by Vlad Zavada on 1/6/23.
//

import UIKit

final class SettingsWithSwitchCell: UITableViewCell {

    private let titleLabel = UILabel()
    let switchButton = UISwitch()
    private var settingsItem: SettingsList?
    private weak var viewModel: SettingsViewModelProtocol?

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setSwitchButton()
        setTittleLabel()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setCell(model: SettingsCellItem, viewModel: SettingsViewModelProtocol) {
        self.viewModel = viewModel
        settingsItem = model.type
        titleLabel.text = model.title
        switchButton.isOn = viewModel.getValueForSettings(settingsItem: model.type) 
    }

    @objc private func saveNewValue() {
        guard let settingsItem = settingsItem else { return }
        viewModel?.saveNewSettingsValue(settingsItem: settingsItem, value: switchButton.isOn)
    }
}

// MARK: - Set UI
private extension SettingsWithSwitchCell {
    func setTittleLabel() {
        contentView.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: switchButton.leftAnchor, constant: -10).isActive = true
        titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true
    }

    func setSwitchButton() {
        contentView.addSubview(switchButton)
        switchButton.translatesAutoresizingMaskIntoConstraints = false
        switchButton.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -20).isActive = true
        switchButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        switchButton.addTarget(self, action: #selector(saveNewValue), for: .valueChanged)
    }
}
