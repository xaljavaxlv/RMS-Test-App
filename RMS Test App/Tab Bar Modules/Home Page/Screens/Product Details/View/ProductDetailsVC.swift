//
//  ProductDetailsVC.swift
//  RVS Test App
//
//  Created by Vlad Zavada on 1/8/23.
//

import UIKit

final class ProductDetailsVC: UIViewController {

    private let tableView = UITableView()
    private let viewModel: ProductDetailsViewModelProtocol

    init(viewModel: ProductDetailsViewModelProtocol) {
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
}

// MARK: - UITableViewDataSource
extension ProductDetailsVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.productDetailsCellItems().count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: ProductDetailsCell.identifier) as? ProductDetailsCell else { return UITableViewCell() }
        cell.setCell(model: viewModel.productDetailsCellItems()[indexPath.row])
        return cell

    }
}

// MARK: - Set UI
private extension ProductDetailsVC {
    func setTableView() {
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        tableView.allowsSelection = false
        tableView.separatorColor = tableView.backgroundColor
    }

    func registerCells() {
        tableView.register(ProductDetailsCell.self, forCellReuseIdentifier: ProductDetailsCell.identifier)
    }

    func setTitle() {
        title = "Details"
    }
}
