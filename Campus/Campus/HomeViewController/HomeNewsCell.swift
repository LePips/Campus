//
//  HomeNewsCell.swift
//  Campus
//
//  Created by Ethan Pippin on 10/17/20.
//

import UIKit
import SharedPips

class HomeNewsCell: BasicTableViewCell {
    
    private lazy var mainImageView = makeMainImageView()
    private lazy var subtitleLabel = makeSubtitleLabel()
    private lazy var titleLabel = makeTitleLabel()
    
    override func setupSubviews() {
        contentView.embed(mainImageView)
        contentView.addSubview(subtitleLabel)
        contentView.addSubview(titleLabel)
    }
    
    override func setupLayoutConstraints() {
        NSLayoutConstraint.activate([
            subtitleLabel.leftAnchor ⩵ contentView.leftAnchor + 8,
            subtitleLabel.bottomAnchor ⩵ titleLabel.topAnchor
        ])
        NSLayoutConstraint.activate([
            titleLabel.leftAnchor ⩵ contentView.leftAnchor + 8,
            titleLabel.bottomAnchor ⩵ contentView.bottomAnchor - 10
        ])
    }
    
    func configure(with item: NewsItem) {
        mainImageView.image = item.image
        subtitleLabel.text = item.subtitle
        titleLabel.text = item.title
    }
    
    private func makeMainImageView() -> UIImageView {
        let imageView = UIImageView.forAutoLayout()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }
    
    private func makeSubtitleLabel() -> UILabel {
        let label = UILabel.forAutoLayout()
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.textColor = .white
        return label
    }
    
    private func makeTitleLabel() -> UILabel {
        let label = UILabel.forAutoLayout()
        label.font = UIFont.systemFont(ofSize: 40, weight: .semibold)
        label.textColor = .white
        return label
    }
    
}
