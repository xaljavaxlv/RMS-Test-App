//
//  HomeVC.swift
//  RVS Test App
//
//  Created by Vlad Zavada on 1/6/23.
//

import UIKit

final class HomeVC: UIViewController {

    private let tableView = UITableView()
    private let viewModel: HomeViewModelProtocol

    init(viewModel: HomeViewModelProtocol) {
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
extension HomeVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.recentPurchasesList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: RecentPurchasesCell.identifier) as? RecentPurchasesCell else { return UITableViewCell() }
        cell.setCell(model: viewModel.recentPurchasesList[indexPath.row])
        return cell
    }
}

// MARK: - UITableViewDelegate
extension HomeVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let product = viewModel.recentPurchasesList[indexPath.row]
        navigationController?.pushViewController(ScreenBuilder.createProductDetails(product: product), animated: true)
    }
}

// MARK: - Set UI
private extension HomeVC {
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
        tableView.register(RecentPurchasesCell.self, forCellReuseIdentifier: RecentPurchasesCell.identifier)
    }

    func setTitle() {
        guard let tabBar = tabBarController,
              let items = tabBar.tabBar.items,
              let title = items[tabBar.selectedIndex].title
        else { return }
        self.title = title
    }
}
