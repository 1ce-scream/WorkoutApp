//
//  Tabs.swift
//  WorkoutApp
//
//  Created by Vitaliy Talalay on 24.03.2024.
//

import Foundation

enum Tabs: Int, CaseIterable {
    case overview, session, progress, settings
}

extension Tabs {
    var title: String {
        switch self {
        case .overview: ""
        case .session: ""
        case .progress: ""
        case .settings: ""
        }
    }
}
