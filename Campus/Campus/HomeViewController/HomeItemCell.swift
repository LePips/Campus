//
//  HomeItemCell.swift
//  Campus
//
//  Created by Ethan Pippin on 10/17/20.
//

import UIKit
import SharedPips

class HomeItemCell: BasicTableViewCell {
    
    private lazy var iconLabel = makeIconLabel()
    private lazy var titleLabel = makeTitleLabel()
    
    override func setupSubviews() {
        contentView.addSubview(iconLabel)
        contentView.addSubview(titleLabel)
    }
    
    override func setupLayoutConstraints() {
        NSLayoutConstraint.activate([
            iconLabel.centerYAnchor ⩵ contentView.centerYAnchor,
            iconLabel.leftAnchor ⩵ contentView.leftAnchor + 8
        ])
        NSLayoutConstraint.activate([
            titleLabel.centerYAnchor ⩵ iconLabel.centerYAnchor,
            titleLabel.leftAnchor ⩵ iconLabel.rightAnchor + 5
        ])
    }
    
    func configure(with item: HomeItem) {
        iconLabel.text = item.icon
        titleLabel.text = item.title
    }
    
    private func makeIconLabel() -> UILabel {
        let label = UILabel.forAutoLayout()
        label.font = UIFont.systemFont(ofSize: 24, weight: .regular)
        return label
    }
    
    private func makeTitleLabel() -> UILabel {
        let label = UILabel.forAutoLayout()
        label.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        return label
    }
}
