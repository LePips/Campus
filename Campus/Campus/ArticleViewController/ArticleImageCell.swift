//
//  ArticleImageCell.swift
//  Campus
//
//  Created by Ethan Pippin on 10/17/20.
//

import UIKit
import SharedPips

class ArticleImageCell: BasicTableViewCell {
    
    private lazy var mainImageView = makeMainImageView()
    
    override func setupSubviews() {
        contentView.embed(mainImageView)
    }
    
    private func makeMainImageView() -> UIImageView {
        let imageView = UIImageView.forAutoLayout()
        imageView.image = UIImage(named: "article")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }
    
}
