//
//  RecentPurchasesCell.swift
//  RVS Test App
//
//  Created by Vlad Zavada on 1/6/23.
//

import UIKit

final class RecentPurchasesCell: UITableViewCell {

    private let itemTitle = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setItemTitleLabel()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setCell(model: Product) {
        itemTitle.text = model.name
    }

}

// MARK: - Set UI
private extension RecentPurchasesCell {
    func setItemTitleLabel() {
        contentView.addSubview(itemTitle)
        itemTitle.translatesAutoresizingMaskIntoConstraints = false
        itemTitle.leftAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leftAnchor, constant: 20).isActive = true
        itemTitle.rightAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.rightAnchor, constant: -20).isActive = true
        itemTitle.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        itemTitle.bottomAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.bottomAnchor, constant: -10).isActive = true
    }
}
