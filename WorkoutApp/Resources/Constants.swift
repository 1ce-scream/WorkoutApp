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
    
    enum SecondaryButton {
        static let leading: CGFloat = 10
        static let trailing: CGFloat = -10
        static let iconHeight: CGFloat = 5
        static let iconWidth: CGFloat = 10
        static let cornerRadius: CGFloat = 14
        static let width: CGFloat = 130
        static let height: CGFloat = 28
    }
    
    enum ButtonsAnimation {
        static let animationDuration: CGFloat = 0.15
        static let alphaStart: CGFloat = 1
        static let alphaFinish: CGFloat = 0.55
    }
}
