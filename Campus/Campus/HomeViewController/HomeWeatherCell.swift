//
//  HomeWeatherCell.swift
//  Campus
//
//  Created by Ethan Pippin on 10/17/20.
//

import UIKit
import SharedPips

class HomeWeatherCell: BasicTableViewCell {

    private lazy var messageLabel = makeMessageLabel()
    private lazy var iconImageView = makeIconImageView()
    private lazy var temperatureLabal = makeTemperatureLabel()
    private lazy var onCampusLabel = makeOnCampusLabel()
    private lazy var nextIcon = makeNextIcon()
    
    override func setupSubviews() {
        contentView.addSubview(messageLabel)
        contentView.addSubview(iconImageView)
        contentView.addSubview(temperatureLabal)
        contentView.addSubview(onCampusLabel)
        contentView.addSubview(nextIcon)
    }
    
    override func setupLayoutConstraints() {
        NSLayoutConstraint.activate([
            messageLabel.topAnchor ⩵ contentView.topAnchor + 8,
            messageLabel.leftAnchor ⩵ contentView.leftAnchor + 15
        ])
        NSLayoutConstraint.activate([
            iconImageView.topAnchor ⩵ messageLabel.bottomAnchor + 20,
            iconImageView.leftAnchor ⩵ contentView.leftAnchor + 15
        ])
        NSLayoutConstraint.activate([
            temperatureLabal.centerYAnchor ⩵ iconImageView.centerYAnchor,
            temperatureLabal.leftAnchor ⩵ iconImageView.rightAnchor + 5
        ])
        NSLayoutConstraint.activate([
            onCampusLabel.leftAnchor ⩵ contentView.leftAnchor + 36,
            onCampusLabel.topAnchor ⩵ temperatureLabal.bottomAnchor - 2
        ])
        NSLayoutConstraint.activate([
            nextIcon.centerYAnchor ⩵ temperatureLabal.centerYAnchor,
            nextIcon.rightAnchor ⩵ contentView.rightAnchor - 20
        ])
    }
    
    private func makeMessageLabel() -> UILabel {
        let label = UILabel.forAutoLayout()
        label.font = UIFont.systemFont(ofSize: 36, weight: .medium)
        label.textColor = .black
        label.text = "Good Afternoon"
        return label
    }
    
    private func makeIconImageView() -> UIImageView {
        let imageView = UIImageView.forAutoLayout()
        imageView.tintColor = .black
        let config = UIImage.SymbolConfiguration(pointSize: 32, weight: .bold)
        let image = UIImage(systemName: "cloud.sun.fill", withConfiguration: config)
        imageView.image = image
        return imageView
    }
    
    private func makeTemperatureLabel() -> UILabel {
        let label = UILabel.forAutoLayout()
        label.font = UIFont.systemFont(ofSize: 32, weight: .regular)
        label.textColor = .black
        label.text = "70°"
        return label
    }
    
    private func makeOnCampusLabel() -> UILabel {
        let label = UILabel.forAutoLayout()
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.text = "on campus"
        label.textColor = .black
        return label
    }
    
    private func makeNextIcon() -> UIImageView {
        let imageView = UIImageView.forAutoLayout()
        imageView.tintColor = .black
        let config = UIImage.SymbolConfiguration(pointSize: 24, weight: .regular)
        let image = UIImage(systemName: "chevron.forward", withConfiguration: config)
        imageView.image = image
        return imageView
    }
    
    
}
