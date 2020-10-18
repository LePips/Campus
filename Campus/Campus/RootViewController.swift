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
        
        let profileVC = UIViewController()
        
        self.viewControllers = [homeNavVC, mapVC, profileVC]
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
        coloredAppearance.backgroundColor = UIColor(hex: 0xBC261A)
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

//class RootViewController: BasicViewController {
//
//    private lazy var tabBar = makeTabBar()
//    private var currentView: UIView = UIView()
//    private var currentChild: UIViewController?
//
//    override func setupSubviews() {
//        view.addSubview(tabBar)
//        currentView.translatesAutoresizingMaskIntoConstraints = false
////        view.addSubview(currentView)
////        currentView.backgroundColor = .red
//    }
//
//    override func setupLayoutConstraints() {
//        NSLayoutConstraint.activate([
//            tabBar.leftAnchor ⩵ view.leftAnchor,
//            tabBar.rightAnchor ⩵ view.rightAnchor,
//            tabBar.heightAnchor ⩵ 60,
//            tabBar.bottomAnchor ⩵ view.safeAreaLayoutGuide.bottomAnchor
//        ])
////        NSLayoutConstraint.activate([
////            currentView.topAnchor ⩵ view.topAnchor,
////            currentView.leftAnchor ⩵ view.leftAnchor,
////            currentView.rightAnchor ⩵ view.rightAnchor,
////            currentView.bottomAnchor ⩵ tabBar.topAnchor
////        ])
//    }
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        let coloredAppearance = UINavigationBarAppearance()
//        coloredAppearance.configureWithOpaqueBackground()
//        coloredAppearance.backgroundColor = UIColor(hex: 0xBC261A)
//        coloredAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
//        coloredAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
//        UINavigationBar.appearance().standardAppearance = coloredAppearance
//        UINavigationBar.appearance().scrollEdgeAppearance = coloredAppearance
//
//        view.backgroundColor = .white
//    }
//
//    private func makeTabBar() -> CampusTabbar {
//        let tabBar = CampusTabbar.forAutoLayout()
//        tabBar.delegate = self
//        return tabBar
//    }
//}
//
//extension RootViewController: CampusTabbarDelegate {
//    func set(viewController: UIViewController) {
//        self.currentChild?.removeFromParent()
//        self.addChild(viewController)
////        self.currentView = viewController.view
//        self.currentChild = viewController
//
//        view.addSubview(viewController.view)
//
//        NSLayoutConstraint.activate([
//            viewController.view.topAnchor ⩵ view.topAnchor,
//            viewController.view.leftAnchor ⩵ view.leftAnchor,
//            viewController.view.rightAnchor ⩵ view.rightAnchor,
//            viewController.view.bottomAnchor ⩵ tabBar.topAnchor
//        ])
//
//        view.sendSubviewToBack(viewController.view)
//        view.bringSubviewToFront(tabBar)
//    }
//}
