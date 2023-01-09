//
//  ProductDetailsTitleCell.swift
//  RVS Test App
//
//  Created by Vlad Zavada on 1/8/23.
//

import UIKit

final class ProductDetailsCell: UITableViewCell {

    private let titleLabel = UILabel()
    private let valueLabel = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setTitleLabel()
        setValueLabel()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setCell(model: ProductDetailsCellItem) {
        titleLabel.text = model.title
        valueLabel.text = model.value
    }
}

// MARK: - Set UI
private extension ProductDetailsCell {
    func setTitleLabel() {
        contentView.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -20).isActive = true
        titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        titleLabel.font = .boldSystemFont(ofSize: 18)
    }

    func setValueLabel() {
        contentView.addSubview(valueLabel)
        valueLabel.translatesAutoresizingMaskIntoConstraints = false
        valueLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20).isActive = true
        valueLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -20).isActive = true
        valueLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10).isActive = true
        valueLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true
    }
}


