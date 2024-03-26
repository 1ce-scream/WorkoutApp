//
//  Constants.swift
//  WorkoutApp
//
//  Created by Vitaliy Talalay on 24.03.2024.
//

import Foundation

enum Constants {
    enum Common {
        static let borderWidth: CGFloat = 1
    }
    
    enum FontSizes {
        static let header: CGFloat = 22
        static let title: CGFloat = 17
        static let main: CGFloat = 15
        static let medium: CGFloat = 13
        static let small: CGFloat = 9
    }
    
    enum OverviewNavBar {
        static let verticalPadding: CGFloat = 8
        static let horizontalPadding: CGFloat = 15
        static let addButtonHeight: CGFloat = 28
        static let allWorkoutsButtonHeight: CGFloat = 28
        static let weekViewVerticalPadding: CGFloat = 15
        static let weekViewHeight: CGFloat = 47
        
        enum WeekView {
            static let weekStackSpacing: CGFloat = 7
            static let cornerRadius: CGFloat = 5
            static let weekdayStackSpacing: CGFloat = 3
        }
    }
    
    enum BaseButton {
        static let horizontalPadding: CGFloat = 10
        static let iconHeight: CGFloat = 5
        static let iconWidth: CGFloat = 10
        static let cornerRadius: CGFloat = 14
    }
    
    enum ButtonsAnimation {
        static let animationDuration: CGFloat = 0.15
        static let alphaStart: CGFloat = 1
        static let alphaFinish: CGFloat = 0.55
    }
}
