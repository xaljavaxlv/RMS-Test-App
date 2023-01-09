//
//  SettingsVC.swift
//  RVS Test App
//
//  Created by Vlad Zavada on 1/6/23.
//

import UIKit

protocol SettingsVCProtocol {
    func reloadTable()
}

final class SettingsVC: UIViewController {

    private let tableView = UITableView()
    private let viewModel: SettingsViewModelProtocol

    init(viewModel: SettingsViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setTableView()
        registerCells()
        setTitle()
    }

    override func viewWillAppear(_ animated: Bool) {
        if let index = self.tableView.indexPathForSelectedRow{
            self.tableView.deselectRow(at: index, animated: true)
        }
    }
}

// MARK: - UITableViewDataSource
extension SettingsVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.settingsCellItems().count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellItems = viewModel.settingsCellItems()
        let cellItem = cellItems[indexPath.row]
        switch  cellItem.type {
        case .pushNotifications: return createWithSwitchCell(indexPath: indexPath, settingsItem: .pushNotifications)
        case .locationPermission: return createWithSwitchCell(indexPath: indexPath, settingsItem: .locationPermission)
        case .appFeedback: return createSimpleTextCell(indexPath: indexPath)
        }
    }

    private func createWithSwitchCell(indexPath: IndexPath, settingsItem: SettingsList) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: SettingsWithSwitchCell.identifier) as? SettingsWithSwitchCell else { return UITableViewCell() }
        cell.setCell(model: viewModel.settingsCellItems()[indexPath.row], viewModel: viewModel)
        cell.selectionStyle = .none
        return cell
    }

    private func createSimpleTextCell(indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: SettingsSimpleTextCell.identifier) as? SettingsSimpleTextCell else { return UITableViewCell() }
        cell.setCell(model: viewModel.settingsCellItems()[indexPath.row])
        return cell
    }
}

// MARK: - UITableViewDelegate
extension SettingsVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if SettingsList.allCases[indexPath.row] == .appFeedback {
            navigationController?.pushViewController(ScreenBuilder.createFeedback(), animated: true)
        }
    }
}

// MARK: - SettingsVCProtocol conforming
extension SettingsVC: SettingsVCProtocol {
    func reloadTable() {
        tableView.reloadData()
    }
}

// MARK: - Set UI
private extension SettingsVC {

    func setTableView() {
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
    }

    func registerCells() {
        tableView.register(SettingsWithSwitchCell.self, forCellReuseIdentifier: SettingsWithSwitchCell.identifier)
        tableView.register(SettingsSimpleTextCell.self, forCellReuseIdentifier: SettingsSimpleTextCell.identifier)
    }

    func setTitle() {
        guard let tabBar = tabBarController,
              let items = tabBar.tabBar.items,
              let title = items[tabBar.selectedIndex].title
        else { return }
        self.title = title
    }
}
