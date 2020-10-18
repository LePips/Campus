//
//  HomeViewController.swift
//  Campus
//
//  Created by Ethan Pippin on 10/17/20.
//

import UIKit
import SharedPips

class HomeViewController: BasicViewController {
    
    private lazy var tabBar = makeTabBar()
    private lazy var tableView = makeTableView()
    
    override func setupSubviews() {
        view.addSubview(tableView)
    }
    
    override func setupLayoutConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor ⩵ view.topAnchor,
            tableView.bottomAnchor ⩵ view.bottomAnchor,
            tableView.leftAnchor ⩵ view.leftAnchor,
            tableView.rightAnchor ⩵ view.rightAnchor
        ])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.navigationController?.addColor(.red)
        
        let logo = SchoolState.core.state.logo.withRenderingMode(.alwaysTemplate)
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        imageView.tintColor = .white
        imageView.contentMode = .scaleAspectFit
        imageView.image = logo
        self.navigationItem.titleView = imageView
    }
    
    private func makeTableView() -> UITableView {
        let tableView = UITableView.forAutoLayout()
        
        tableView.delegate = self
        tableView.dataSource = self
        HomeRow.register(tableView: tableView)
        
        return tableView
    }
    
    private func makeTabBar() -> CampusTabbar {
        return CampusTabbar.forAutoLayout()
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return HomeRow.rows.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return HomeRow.rows[indexPath.row].height
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return HomeRow.rows[indexPath.row].cellForRow(at: indexPath, in: tableView)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = HomeRow.rows[indexPath.row].didSelectRow()
        navigationController?.pushViewController(vc, animated: true)
    }
}
