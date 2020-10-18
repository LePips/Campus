//
//  RootViewController.swift
//  Campus
//
//  Created by Ethan Pippin on 10/17/20.
//

import UIKit
import SharedPips

class RootViewController: UITabBarController {
    
    init() {
        super.init(nibName: nil, bundle: nil)
        
        let homeNavVC = HomeNavViewController()
        
        let mapVC = MapViewController()
        
        let profileVC = ProfileNavViewController()
        
        self.viewControllers = [homeNavVC, mapVC, profileVC]
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        SchoolState.core.addSubscriber(subscriber: self, update: RootViewController.update)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBar.items?.forEach({ (tabBarItem) in
            tabBarItem.title = nil
        })
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setupTabBar()
    }
    
    private func setupTabBar() {
        tabBar.tintColor = .black
        tabBar.backgroundColor = .white
        tabBar.backgroundImage = UIImage()
        tabBar.shadowImage = UIImage()
        tabBar.isTranslucent = true
        self.additionalSafeAreaInsets = UIEdgeInsets(top: 0, left: 0, bottom: -15, right: 0)
        tabBar.frame.size.height -= self.additionalSafeAreaInsets.bottom
        tabBar.frame.origin.y = view.frame.height - tabBar.frame.size.height
    }
    
}

extension RootViewController: Subscriber {
    func update(with state: SchoolState) {
        
    }
}

class HomeNavViewController: BasicNavigationController {
    
    init() {
        super.init(nibName: nil, bundle: nil)
        
        let config = UIImage.SymbolConfiguration(pointSize: 24, weight: .regular)
        let tabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "house", withConfiguration: config), selectedImage: UIImage(systemName: "house.fill", withConfiguration: config))
        tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor : UIColor.clear], for: .normal)
        self.tabBarItem = tabBarItem
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let coloredAppearance = UINavigationBarAppearance()
        coloredAppearance.configureWithOpaqueBackground()
        coloredAppearance.backgroundColor = SchoolState.core.state.color
        coloredAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        coloredAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        UINavigationBar.appearance().standardAppearance = coloredAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = coloredAppearance

        view.backgroundColor = .white
    }
    
    override func viewControllers() -> [UIViewController] {
        return [HomeViewController()]
    }
    
}

class ProfileNavViewController: BasicNavigationController {
    
    init() {
        super.init(nibName: nil, bundle: nil)
        
        let config = UIImage.SymbolConfiguration(pointSize: 24, weight: .regular)
        let tabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "person", withConfiguration: config), selectedImage: UIImage(systemName: "person.fill", withConfiguration: config))
        tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor : UIColor.clear], for: .normal)
        self.tabBarItem = tabBarItem
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let coloredAppearance = UINavigationBarAppearance()
        coloredAppearance.configureWithOpaqueBackground()
        coloredAppearance.backgroundColor = SchoolState.core.state.color
        coloredAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        coloredAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        UINavigationBar.appearance().standardAppearance = coloredAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = coloredAppearance

        view.backgroundColor = .white
    }
    
    override func viewControllers() -> [UIViewController] {
        return [ProfileViewController()]
    }
}
