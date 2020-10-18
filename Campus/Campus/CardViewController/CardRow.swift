//
//  CardRow.swift
//  Campus
//
//  Created by Ethan Pippin on 10/17/20.
//

import UIKit

enum CardRow: CaseIterable {
    case card
    case balance
    case transaction
    
    var height: CGFloat {
        switch self {
        case .card: return 210
        case .balance: return 210
        case .transaction: return 50
        }
    }
}


extension CardRow {
    
    static var rows: [CardRow] {
        
        return CardRow.allCases + [.transaction, .transaction, .transaction, .transaction, .transaction, .transaction, .transaction]
    }
    
    static func register(tableView: UITableView) {
        tableView.register(TransactionCell.self, forCellReuseIdentifier: TransactionCell.identifier)
        tableView.register(CardCell.self, forCellReuseIdentifier: CardCell.identifier)
        tableView.register(CardBalanceCell.self, forCellReuseIdentifier: CardBalanceCell.identifier)
    }
    
    func cellForRow(at path: IndexPath, in tableView: UITableView) -> UITableViewCell {
        switch self {
        case .card:
            return tableView.dequeueReusableCell(withIdentifier: CardCell.identifier, for: path) as! CardCell
        case .balance:
            return tableView.dequeueReusableCell(withIdentifier: CardBalanceCell.identifier, for: path) as! CardBalanceCell
        case .transaction:
            return tableView.dequeueReusableCell(withIdentifier: TransactionCell.identifier, for: path) as! TransactionCell
        }
    }
}
