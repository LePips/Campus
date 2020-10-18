//
//  CourseCell.swift
//  Campus
//
//  Created by Ethan Pippin on 10/17/20.
//

import UIKit
import SharedPips

class CourseCell: BasicTableViewCell {
    
    private lazy var titleLabel = makeTitleLabel()
    private lazy var timeLabel = makeTimeLabel()
    private lazy var gradeLabel = makeGradeLabel()
    private lazy var canvasLabel = makeCanvasLabel()
    
    override func setupSubviews() {
        contentView.addSubview(titleLabel)
        contentView.addSubview(timeLabel)
        contentView.addSubview(gradeLabel)
        contentView.addSubview(canvasLabel)
    }
    
    override func setupLayoutConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.leftAnchor ⩵ contentView.leftAnchor + 8,
            titleLabel.topAnchor ⩵ contentView.topAnchor + 15,
        ])
        NSLayoutConstraint.activate([
            timeLabel.leftAnchor ⩵ titleLabel.leftAnchor,
            timeLabel.topAnchor ⩵ titleLabel.bottomAnchor + 10
        ])
        NSLayoutConstraint.activate([
            gradeLabel.rightAnchor ⩵ contentView.rightAnchor - 8,
            gradeLabel.centerYAnchor ⩵ contentView.centerYAnchor
        ])
        NSLayoutConstraint.activate([
            canvasLabel.centerXAnchor ⩵ contentView.centerXAnchor,
            canvasLabel.topAnchor ⩵ gradeLabel.bottomAnchor + 10
        ])
    }
    
    private func makeTitleLabel() -> UILabel {
        let label = UILabel.forAutoLayout()
        label.text = "CS 3100"
        label.font = UIFont.systemFont(ofSize: 36, weight: .medium)
        return label
    }
    
    private func makeTimeLabel() -> UILabel {
        let label = UILabel.forAutoLayout()
        label.text = "T/TR\n10:45 - 12:05"
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        label.numberOfLines = 2
        return label
    }
    
    private func makeGradeLabel() -> UILabel {
        let label = UILabel.forAutoLayout()
        label.text = "A"
        label.font = UIFont.systemFont(ofSize: 40, weight: .medium)
        return label
    }
    
    private func makeCanvasLabel() -> UILabel {
        let label = UILabel.forAutoLayout()
        label.text = "Open in Canvas"
        label.textColor = .blue
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        return label
    }
}
