//
//  TabBarItem.swift
//  Feeder
//
//  Created by Cédric Bahirwe on 10/08/2022.
//

import Foundation

enum TabBarItem: Equatable, CaseIterable {
    static var allCases: [TabBarItem] { [.home(), .community(), .groups(), .events(), .messages(18)] }

    case home(Int? = nil)
    case community(Int? = nil)
    case groups(Int? = nil)
    case events(Int? = nil)
    case messages(Int? = nil)

    var title: String {
        switch self {
        case .home(_):
            return "Home"
        case .community(_):
            return "Community"
        case .groups(_):
            return "Groups"
        case .events(_):
            return "Events"
        case .messages(_):
            return "Messages"
        }
    }

    var badge: Int? {
        switch self {
        case .home(let badge),
                .community(let badge),
                .groups(let badge),
                .events(let badge),
                .messages(let badge):
            return badge
        }
    }

    func getInactiveIconName() -> String {
        switch self {
        case .home:
            return "Home"
        case .community:
            return "Community"
        case .groups:
            return "Groups"
        case .events:
            return "Events"
        case .messages:
            return "Messages"
        }
    }

    func getActiveIconName() -> String {
        getInactiveIconName().appending(".selected")
    }
}
