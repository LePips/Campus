//
//  ArticleTitleCell.swift
//  Campus
//
//  Created by Ethan Pippin on 10/17/20.
//

import UIKit
import SharedPips

class ArticleTitleCell: BasicTableViewCell {
    
    private lazy var typeLabel = makeTypeLabel()
    private lazy var titleLabel = makeTitleLabel()
    private lazy var dateLabel = makeDateLabel()
    
    override func setupSubviews() {
        contentView.addSubview(typeLabel)
        contentView.addSubview(titleLabel)
        contentView.addSubview(dateLabel)
    }
    
    override func setupLayoutConstraints() {
        NSLayoutConstraint.activate([
            typeLabel.leftAnchor ⩵ contentView.leftAnchor + 8,
            typeLabel.topAnchor ⩵ contentView.topAnchor + 15
        ])
        NSLayoutConstraint.activate([
            titleLabel.leftAnchor ⩵ contentView.leftAnchor + 8,
            titleLabel.topAnchor ⩵ typeLabel.bottomAnchor + 6,
            titleLabel.rightAnchor ⩵ contentView.rightAnchor - 15
        ])
        NSLayoutConstraint.activate([
            dateLabel.leftAnchor ⩵ contentView.leftAnchor + 8,
            dateLabel.topAnchor ⩵ titleLabel.bottomAnchor + 6
        ])
    }
    
    private func makeTypeLabel() -> UILabel {
        let label = UILabel.forAutoLayout()
        label.text = "News"
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = .secondaryLabel
        return label
    }
    
    private func makeTitleLabel() -> UILabel {
        let label = UILabel.forAutoLayout()
        label.text = "Register for HackTheU \nToday!"
        label.font = UIFont.systemFont(ofSize: 30, weight: .medium)
        label.textColor = .black
        label.numberOfLines = 2
        return label
    }
    
    private func makeDateLabel() -> UILabel {
        let label = UILabel.forAutoLayout()
        label.text = "October 13, 2020"
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = .secondaryLabel
        return label
    }
}
