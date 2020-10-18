//
//  ArticleTextCell.swift
//  Campus
//
//  Created by Ethan Pippin on 10/17/20.
//


import UIKit
import SharedPips

class ArticleTextCell: BasicTableViewCell {
    
    private lazy var titleLabel = makeTitleLabel()
    private lazy var textView = makeTextView()
    
    override func setupSubviews() {
        contentView.addSubview(titleLabel)
        contentView.addSubview(textView)
    }
    
    override func setupLayoutConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.leftAnchor ⩵ contentView.leftAnchor + 8,
            titleLabel.topAnchor ⩵ contentView.topAnchor + 15
        ])
        NSLayoutConstraint.activate([
            textView.leftAnchor ⩵ contentView.leftAnchor + 8,
            textView.rightAnchor ⩵ contentView.rightAnchor - 15,
            textView.topAnchor ⩵ titleLabel.bottomAnchor + 10,
            textView.bottomAnchor ⩵ contentView.bottomAnchor
        ])
    }
    
    private func makeTitleLabel() -> UILabel {
        let label = UILabel.forAutoLayout()
        label.text = "What is HackTheU?"
        label.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        label.textColor = .black
        return label
    }
    
    private func makeTextView() -> UITextView {
        let textView = UITextView.forAutoLayout()
        textView.text = "HackTheU is Utah's largest and most popular hackathon! Work with the greatest and brightest students from around the world to make your imagination come to life with the power of technology, this year from the comfort of your own home. The next big thing comes from you, and we're offering over $10,000 in prizes for you to build it here!"
        textView.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        return textView
    }
}
