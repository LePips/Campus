//
//  ArticleViewController.swift
//  Campus
//
//  Created by Ethan Pippin on 10/17/20.
//

import UIKit
import SharedPips

class ArticleViewController: BasicViewController {
    
    private lazy var tableView = makeTableView()
    
    override func setupSubviews() {
        view.embed(tableView)
    }
    
    override func setupLayoutConstraints() {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.tintColor = .white
        let config = UIImage.SymbolConfiguration(pointSize: 18, weight: .medium)
        let share = UIImage(systemName: "square.and.arrow.up", withConfiguration: config)
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: share, style: .plain, target: nil, action: nil)
    }
    
    private func makeTableView() -> UITableView {
        let tableView = UITableView.forAutoLayout()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        ArticleRow.register(tableView: tableView)
        
        return tableView
    }
}

extension ArticleViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ArticleRow.rows.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return ArticleRow.rows[indexPath.row].cellForRow(at: indexPath, in: tableView)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return ArticleRow.rows[indexPath.row].height
    }
    
}
