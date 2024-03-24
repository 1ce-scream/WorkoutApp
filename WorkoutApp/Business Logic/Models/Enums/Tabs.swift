//
//  Tabs.swift
//  WorkoutApp
//
//  Created by Vitaliy Talalay on 24.03.2024.
//

import class UIKit.UIImage

enum Tabs: Int, CaseIterable {
    case overview, session, progress, settings
}

extension Tabs {
    var title: String {
        Resources.Strings.TabBar.title(for: self)
    }
    
    var image: UIImage? {
        Resources.Images.TabBar.icon(for: self)
    }
}
