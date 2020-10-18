//
//  ArticleRow.swift
//  Campus
//
//  Created by Ethan Pippin on 10/17/20.
//

import UIKit

enum ArticleRow: CaseIterable {
    case image
    case title
    case text
    
    var height: CGFloat {
        switch self {
        case .image: return 260
        case .title: return 140
        case .text: return 800
        }
    }
}

extension ArticleRow {
    
    static var rows: [ArticleRow] {
        return ArticleRow.allCases
    }
    
    static func register(tableView: UITableView) {
        tableView.register(ArticleImageCell.self, forCellReuseIdentifier: ArticleImageCell.identifier)
        tableView.register(ArticleTitleCell.self, forCellReuseIdentifier: ArticleTitleCell.identifier)
        tableView.register(ArticleTextCell.self, forCellReuseIdentifier: ArticleTextCell.identifier)
    }
    
    func cellForRow(at path: IndexPath, in tableView: UITableView) -> UITableViewCell {
        switch self {
        case .image:
            return tableView.dequeueReusableCell(withIdentifier: ArticleImageCell.identifier, for: path) as! ArticleImageCell
        case .title:
            return tableView.dequeueReusableCell(withIdentifier: ArticleTitleCell.identifier, for: path) as! ArticleTitleCell
        case .text:
            return tableView.dequeueReusableCell(withIdentifier: ArticleTextCell.identifier, for: path) as! ArticleTextCell
        }
    }
}
