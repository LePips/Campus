//
//  CardCell.swift
//  Campus
//
//  Created by Ethan Pippin on 10/17/20.
//

import UIKit
import SharedPips

class CardCell: BasicTableViewCell {
    
    private lazy var cardView = makeCardView()
    
    override func setupSubviews() {
        contentView.embed(cardView)
    }
    
    private func makeCardView() -> UIImageView {
        let imageView = UIImageView.forAutoLayout()
        imageView.image = UIImage(named: "card")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }
    
}
