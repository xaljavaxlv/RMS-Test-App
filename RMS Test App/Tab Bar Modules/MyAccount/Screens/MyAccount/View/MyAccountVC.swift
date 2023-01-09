//
//  MyAccountVC.swift
//  RVS Test App
//
//  Created by Vlad Zavada on 1/6/23.
//

import UIKit

final class MyAccountVC: UIViewController {

    private let tableView = UITableView()
    private let viewModel: MyAccountViewModelProtocol

    init(viewModel: MyAccountViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        setTableView()
        registerCells()
        setTitle()
    }
}

// MARK: - UITableViewDataSource
extension MyAccountVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.userCellItems().count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: MyAccountCell.identifier) as? MyAccountCell else { return UITableViewCell() }
        cell.setCell(model: viewModel.userCellItems()[indexPath.row])
        return cell
        
    }
}

// MARK: - Set UI
private extension MyAccountVC {
    func setTableView() {
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        tableView.allowsSelection = false
    }

    func registerCells() {
        tableView.register(MyAccountCell.self, forCellReuseIdentifier: MyAccountCell.identifier)
    }

    func setTitle() {
        guard let tabBar = tabBarController,
              let items = tabBar.tabBar.items,
              let title = items[tabBar.selectedIndex].title
        else { return }
        self.title = title
    }
}
