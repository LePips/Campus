//
//  CoursesViewController.swift
//  Campus
//
//  Created by Ethan Pippin on 10/17/20.
//

import UIKit
import SharedPips

class CoursesViewController: BasicViewController {
    
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
        
        title = "Courses"
        navigationController?.navigationBar.tintColor = .white
    }
    
    private func makeTableView() -> UITableView {
        let tableView = UITableView.forAutoLayout()
        
        tableView.delegate = self
        tableView.dataSource = self
        CoursesRow.register(tableView: tableView)
        
        return tableView
    }
    
}

extension CoursesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return CoursesRow.rows.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return CoursesRow.rows[indexPath.row].cellForRow(at: indexPath, in: tableView)
    }
}
