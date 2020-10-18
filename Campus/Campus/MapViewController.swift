//
//  MapViewController.swift
//  Campus
//
//  Created by Ethan Pippin on 10/17/20.
//

import UIKit
import SharedPips

class MapViewController: BasicViewController {
    
    private lazy var mapView = makeMapView()
    private lazy var tabBar = makeTabBar()
    
    init() {
        super.init(nibName: nil, bundle: nil)
        let config = UIImage.SymbolConfiguration(pointSize: 24, weight: .regular)
        let tabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "map", withConfiguration: config), selectedImage: UIImage(systemName: "map.fill", withConfiguration: config))
        tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor : UIColor.clear], for: .normal)
        self.tabBarItem = tabBarItem
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setupSubviews() {
        view.addSubview(mapView)
    }
    
    override func setupLayoutConstraints() {
        NSLayoutConstraint.activate([
            mapView.topAnchor ⩵ view.topAnchor,
            mapView.leftAnchor ⩵ view.leftAnchor,
            mapView.rightAnchor ⩵ view.rightAnchor,
            mapView.bottomAnchor ⩵ view.bottomAnchor
        ])
    }
    
    private func makeMapView() -> UIImageView {
        let imageView = UIImageView.forAutoLayout()
        imageView.image = UIImage(named: "map")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }
    
    private func makeTabBar() -> CampusTabbar {
        let tabBar = CampusTabbar.forAutoLayout()
        tabBar.setActive(index: 1)
        return tabBar
    }
}
