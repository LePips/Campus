//
//  ProfileCell.swift
//  Campus
//
//  Created by Ethan Pippin on 10/18/20.
//

import UIKit
import SharedPips

class ProfileCell: BasicTableViewCell {
    
    private lazy var headView = makeImageView()
    private lazy var nameLabel = makeNameLabel()
    private lazy var majorLabel = makeMajorLabel()
    
    override func setupSubviews() {
        contentView.addSubview(headView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(majorLabel)
    }
    
    override func setupLayoutConstraints() {
        NSLayoutConstraint.activate([
            headView.centerYAnchor ⩵ contentView.centerYAnchor,
            headView.leftAnchor ⩵ contentView.leftAnchor + 20,
            headView.heightAnchor ⩵ 100,
            headView.widthAnchor ⩵ 100
        ])
        NSLayoutConstraint.activate([
            nameLabel.topAnchor ⩵ headView.topAnchor + 24,
            nameLabel.leftAnchor ⩵ headView.rightAnchor + 20
        ])
        NSLayoutConstraint.activate([
            majorLabel.topAnchor ⩵ nameLabel.bottomAnchor + 10,
            majorLabel.leftAnchor ⩵ nameLabel.leftAnchor
        ])
    }
    
    private func makeImageView() -> UIImageView {
        let imageView = UIImageView.forAutoLayout()
        imageView.image = UIImage(named: "head")
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 50
        imageView.clipsToBounds = true
        return imageView
    }
    
    private func makeNameLabel() -> UILabel {
        let label = UILabel.forAutoLayout()
        label.font = UIFont.systemFont(ofSize: 24, weight: .regular)
        label.text = "Johnny Appleseed"
        return label
    }
    
    private func makeMajorLabel() -> UILabel {
        let label = UILabel.forAutoLayout()
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.text = "Computer Science"
        return label
    }
}
