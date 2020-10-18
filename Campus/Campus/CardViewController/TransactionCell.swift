//
//  TransactionCell.swift
//  Campus
//
//  Created by Ethan Pippin on 10/17/20.
//

import UIKit
import SharedPips

class TransactionCell: BasicTableViewCell {
    
    private lazy var titleLabel = makeTitleLabel()
    private lazy var amountLabel = makeAmountLabel()
    
    override func setupSubviews() {
        contentView.addSubview(titleLabel)
        contentView.addSubview(amountLabel)
    }
    
    override func setupLayoutConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.centerYAnchor ⩵ contentView.centerYAnchor,
            titleLabel.leftAnchor ⩵ contentView.leftAnchor + 8,
            amountLabel.centerYAnchor ⩵ contentView.centerYAnchor,
            amountLabel.rightAnchor ⩵ contentView.rightAnchor - 8
        ])
    }
    
    private func makeTitleLabel() -> UILabel {
        let label = UILabel.forAutoLayout()
        label.text = "Panda Express"
        label.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        return label
    }
    
    private func makeAmountLabel() -> UILabel {
        let label = UILabel.forAutoLayout()
        label.text = "-$7.20"
        label.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        return label
    }
}
