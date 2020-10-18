//
//  HomeRow.swift
//  Campus
//
//  Created by Ethan Pippin on 10/17/20.
//

import UIKit

enum NewsItem: CaseIterable {
    case hack
    case honors
    
    var subtitle: String {
        switch self {
        case .hack: return "Oct. 16-18. Register now!"
        case .honors: return "THEY are here, are you?"
        }
    }
    
    var title: String {
        switch self {
        case .hack: return "HackTheU"
        case .honors: return "The Bridge"
        }
    }
    
    var image: UIImage {
        switch self {
        case .hack: return UIImage(named: "hacktheu")!
        case .honors: return UIImage(named: "honors")!
        }
    }
}

enum HomeItem: CaseIterable {
    case card
    case courses
    case events
    case football
    case services
    
    var title: String {
        switch self {
        case .card: return "Campus Card"
        case .courses: return "Courses"
        case .events: return "Events"
        case .football: return "Football"
        case .services: return "Student Services"
        }
    }
    
    var icon: String {
        switch self {
        case .card: return "💳"
        case .courses: return "📚"
        case .events: return "📅"
        case .football: return "🏈"
        case .services: return "🧑‍🎓"
        }
    }
}


enum HomeRow {
    case news(NewsItem)
    case weather
    case item(HomeItem)
    
    var height: CGFloat {
        switch self {
        case .news(_):
            return 260
        case .weather:
            return 130
        case .item(_):
            return 50
        }
    }
}

extension HomeRow {
    
    static var rows: [HomeRow] {
        let items = HomeItem.allCases.map({ HomeRow.item($0) })
        return [news(NewsItem.hack), weather] + items
    }
    
    static func register(tableView: UITableView) {
        tableView.register(HomeNewsCell.self, forCellReuseIdentifier: HomeNewsCell.identifier)
        tableView.register(HomeWeatherCell.self, forCellReuseIdentifier: HomeWeatherCell.identifier)
        tableView.register(HomeItemCell.self, forCellReuseIdentifier: HomeItemCell.identifier)
    }
    
    func cellForRow(at path: IndexPath, in tableView: UITableView) -> UITableViewCell {
        switch self {
        case .news(let item):
            let cell = tableView.dequeueReusableCell(withIdentifier: HomeNewsCell.identifier, for: path) as! HomeNewsCell
            cell.configure(with: item)
            return cell
        case .weather:
            let cell = tableView.dequeueReusableCell(withIdentifier: HomeWeatherCell.identifier, for: path) as! HomeWeatherCell
            return cell
        case .item(let item):
            let cell = tableView.dequeueReusableCell(withIdentifier: HomeItemCell.identifier, for: path) as! HomeItemCell
            cell.configure(with: item)
            return cell
        }
    }
    
    func didSelectRow() -> UIViewController {
        switch self {
        case .news(_):
            return ArticleViewController()
        case .weather:
            return UIViewController()
        case .item(let item):
            switch item {
            case .card:
                return CardViewController()
            case .courses:
                return CoursesViewController()
            default:
                return UIViewController()
            }
        }
    }
}
