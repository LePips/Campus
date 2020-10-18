//
//  CampusTabbar.swift
//  Campus
//
//  Created by Ethan Pippin on 10/17/20.
//

import UIKit
import SharedPips

protocol CampusTabbarDelegate {
    func set(viewController: UIViewController)
}

class CampusTabbar: BasicView {
    
    private lazy var firstIconView = makeFirstIconView()
    private lazy var secondIconView = makeSecondIconView()
    private lazy var thirdIconView = makeThirdIconView()
    
    var delegate: CampusTabbarDelegate? = nil
    
    override func setupSubviews() {
        addSubview(firstIconView)
        addSubview(secondIconView)
        addSubview(thirdIconView)
        setActive(index: 0)
        backgroundColor = .white
    }
    
    override func setupLayoutConstraints() {
        let inset: CGFloat = 40
        NSLayoutConstraint.activate([
            secondIconView.centerXAnchor ⩵ centerXAnchor,
            secondIconView.bottomAnchor ⩵ bottomAnchor - 10
        ])
        NSLayoutConstraint.activate([
            firstIconView.centerYAnchor ⩵ secondIconView.centerYAnchor,
            firstIconView.leftAnchor ⩵ leftAnchor + inset
        ])
        NSLayoutConstraint.activate([
            thirdIconView.centerYAnchor ⩵ secondIconView.centerYAnchor,
            thirdIconView.rightAnchor ⩵ rightAnchor - inset
        ])
    }
    
    @discardableResult
    func setActive(index: Int) -> UIViewController {
        let config = UIImage.SymbolConfiguration(pointSize: 36, weight: .regular)
        switch index {
        case 0:
            firstIconView.setImage(UIImage(systemName: "house.fill", withConfiguration: config), for: .normal)
            secondIconView.setImage(UIImage(systemName: "map", withConfiguration: config), for: .normal)
            thirdIconView.setImage(UIImage(systemName: "person", withConfiguration: config), for: .normal)
            delegate?.set(viewController: HomeViewController())
            return HomeViewController()
        case 1:
            firstIconView.setImage(UIImage(systemName: "house", withConfiguration: config), for: .normal)
            secondIconView.setImage(UIImage(systemName: "map.fill", withConfiguration: config), for: .normal)
            thirdIconView.setImage(UIImage(systemName: "person", withConfiguration: config), for: .normal)
            delegate?.set(viewController: MapViewController())
            return MapViewController()
        case 2:
            firstIconView.setImage(UIImage(systemName: "house", withConfiguration: config), for: .normal)
            secondIconView.setImage(UIImage(systemName: "map", withConfiguration: config), for: .normal)
            thirdIconView.setImage(UIImage(systemName: "person.fill", withConfiguration: config), for: .normal)
            delegate?.set(viewController: UIViewController())
            return UIViewController()
        default:
            return UIViewController()
        }
    }
    
    private func makeFirstIconView() -> UIButton {
        let button = UIButton.forAutoLayout()
        button.tintColor = .black
        button.addTarget(self, action: #selector(first), for: .touchUpInside)
        return button
    }
    
    @objc private func first() {
        setActive(index: 0)
    }
    
    private func makeSecondIconView() -> UIButton {
        let button = UIButton.forAutoLayout()
        button.tintColor = .black
        button.addTarget(self, action: #selector(second), for: .touchUpInside)
        return button
    }
    
    @objc private func second() {
        setActive(index: 1)
    }
    
    private func makeThirdIconView() -> UIButton {
        let button = UIButton.forAutoLayout()
        button.tintColor = .black
        button.addTarget(self, action: #selector(third), for: .touchUpInside)
        return button
    }
    
    @objc private func third() {
        setActive(index: 2)
    }
}
