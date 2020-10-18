//
//  CoursesRow.swift
//  Campus
//
//  Created by Ethan Pippin on 10/17/20.
//

import UIKit

enum CoursesRow {
    case course
}

extension CoursesRow {
    
    static var rows: [CoursesRow] {
        return [.course]
    }
    
    static func register(tableView: UITableView) {
        tableView.register(CourseCell.self, forCellReuseIdentifier: CourseCell.identifier)
    }
    
    func cellForRow(at path: IndexPath, in tableView: UITableView) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: CourseCell.identifier, for: path) as! CourseCell
    }
}
