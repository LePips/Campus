//
//  SchoolState.swift
//  Campus
//
//  Created by Ethan Pippin on 10/18/20.
//

import SharedPips

enum SchoolStateChange {
    case utah
    case slcc
}

fileprivate var sharedCore: Core<SchoolState> {
    return Core(state: SchoolState())
}

struct SchoolState: State {
    
    var logo: UIImage = UIImage(named: "u")!
    var color: UIColor = UIColor(hex: 0xBC261A)!
    var newsTitle: String = "HackTheU"
    var current: SchoolStateChange = .utah
    
    typealias EventType = SchoolStateChange
    
    mutating func respond(to event: SchoolStateChange) {
        switch event {
        case .utah:
            logo = UIImage(named: "u")!
            color = UIColor(hex: 0xBC261A)!
            newsTitle = "HackTheU"
            current = .utah
        case .slcc:
            logo = UIImage(named: "slcc")!
            color = .white
            newsTitle = "HackSLCC"
            current = .slcc
        }
    }
    
    static var core: Core<SchoolState> {
        return sharedCore
    }
}
