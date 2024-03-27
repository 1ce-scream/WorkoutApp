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
        static let cornerRadius: CGFloat = 5
        static let horizontalPadding: CGFloat = 15
    }
    
    enum FontSizes {
        static let header: CGFloat = 22
        static let title: CGFloat = 17
        static let main: CGFloat = 15
        static let medium: CGFloat = 13
        static let small: CGFloat = 9
        static let elapsedTime: CGFloat = 14
        static let elapsedTimeValue: CGFloat = 46
        static let percentsTitle: CGFloat = 23
        static let percentsSubtitle: CGFloat = 10
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
            static let weekdayStackSpacing: CGFloat = 3
        }
    }
    
    enum BaseButton {
        static let horizontalPadding: CGFloat = 10
        static let iconHeight: CGFloat = 5
        static let iconWidth: CGFloat = 10
        static let cornerRadius: CGFloat = 14
    }
    
    enum BaseInfoView {
        static let titleOffset: CGFloat = 10
        static let buttonHeight: CGFloat = 30
    }
    
    enum BarView {
        static let cornerRadius: CGFloat = 2.5
        static let barWidth: CGFloat = 17
        static let barTopPadding: CGFloat = 5
        static let barMultiplier: CGFloat = 0.8
        static let titleBottomPadding: CGFloat = 10
    }
    
    enum Bars {
        static let horizontalPadding: CGFloat = 10
        static let verticalPadding: CGFloat = 15
    }
    
    enum ButtonsAnimation {
        static let animationDuration: CGFloat = 0.15
        static let alphaStart: CGFloat = 1
        static let alphaFinish: CGFloat = 0.55
    }
    
    enum Session {
        static let horizontalPadding: CGFloat = Common.horizontalPadding
        static let verticalPadding: CGFloat = 15
        static let statsVerticalPadding: CGFloat = 10
        
        enum Timer {
            static let progressPadding: CGFloat = 40
            static let progressWidth: CGFloat = 20
            static let dotWidth: CGFloat = 8
            static let barsWidth: CGFloat = 6
            static let barSegmentWidth: CGFloat = 4
            static let barsPadding: CGFloat = 25
            static let timeStackSpacing: CGFloat = 10
            static let percentStackPadding: CGFloat = 28
            static let percentStackSpacing: CGFloat = 25
            static let percentStackHeight: CGFloat = 35
            static let percentStackWidth: CGFloat = 175
            static let percentViewStackSpacing: CGFloat = 5
        }
        
        enum StatsView {
            static let horizontalPadding: CGFloat = 15
            static let verticalPadding: CGFloat = 10
            static let stackSpacing: CGFloat = horizontalPadding
            static let imageWidth: CGFloat = 23
        }
    }
    
    enum Progress {
        static let verticalPadding: CGFloat = 10
        static let dailyPerformaceHeightMultiplier: CGFloat = 0.68
    }
}
