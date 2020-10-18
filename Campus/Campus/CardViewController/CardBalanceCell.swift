//
//  CardBalanceCell.swift
//  Campus
//
//  Created by Ethan Pippin on 10/17/20.
//

import UIKit
import SharedPips

class CardBalanceCell: BasicTableViewCell {
    
    private lazy var balanceLabel = makeBalanceLabel()
    private lazy var addFundsButton = makeAddFundsButton()
    private lazy var moneyLabel = makeMoneyLabel()
    private lazy var transactionLabel = makeTransactionLabel()
    private var money: Double = 500.12
    
    override func setupSubviews() {
        contentView.addSubview(balanceLabel)
        contentView.addSubview(addFundsButton)
        contentView.addSubview(moneyLabel)
        contentView.addSubview(transactionLabel)
    }
    
    override func setupLayoutConstraints() {
        NSLayoutConstraint.activate([
            balanceLabel.leftAnchor ⩵ contentView.leftAnchor + 8,
            balanceLabel.topAnchor ⩵ contentView.topAnchor,
            addFundsButton.rightAnchor ⩵ contentView.rightAnchor - 8,
            addFundsButton.centerYAnchor ⩵ balanceLabel.centerYAnchor,
        ])
        NSLayoutConstraint.activate([
            moneyLabel.leftAnchor ⩵ balanceLabel.leftAnchor,
            moneyLabel.topAnchor ⩵ balanceLabel.bottomAnchor + 20
        ])
        NSLayoutConstraint.activate([
            transactionLabel.leftAnchor ⩵ contentView.leftAnchor + 8,
            transactionLabel.topAnchor ⩵ moneyLabel.bottomAnchor + 35,
        ])
    }
    
    private func makeBalanceLabel() -> UILabel {
        let label = UILabel.forAutoLayout()
        label.text = "Balance"
        label.font = UIFont.systemFont(ofSize: 30, weight: .semibold)
        label.textColor = .black
        return label
    }
    
    private func makeAddFundsButton() -> UIButton {
        let button = UIButton.forAutoLayout()
        button.setTitle("Add Funds", for: .normal)
        button.addTarget(self, action: #selector(a), for: .touchUpInside)
        button.setTitleColor(.blue, for: .normal)
        return button
    }
    
    @objc private func a() {
        money += 50
        moneyLabel.text = "$\(money)"
    }
    
    private func makeMoneyLabel() -> UILabel {
        let label = UILabel.forAutoLayout()
        label.text = "$500.12"
        label.font = UIFont.systemFont(ofSize: 42, weight: .semibold)
        label.textColor = .black
        return label
    }
    
    private func makeTransactionLabel() -> UILabel {
        let label = UILabel.forAutoLayout()
        label.text = "Transactions"
        label.font = UIFont.systemFont(ofSize: 30, weight: .semibold)
        label.textColor = .black
        return label
    }
}
