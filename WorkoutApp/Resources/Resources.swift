//
//  Resources.swift
//  WorkoutApp
//
//  Created by Vitaliy Talalay on 24.03.2024.
//

import class UIKit.UIColor
import class UIKit.UIImage
import class UIKit.UIFont
import struct UIKit.CGFloat

enum Resources {
    enum Strings {
        enum TabBar {
            static func title(for tab: Tabs) -> String {
                switch tab {
                case .overview: "Overview"
                case .session: "Session"
                case .progress: "Progress"
                case .settings: "Settings"
                }
            }
        }
        
        enum NavBar {
            static let overview: String = "Today"
            static let session: String = "High Intensity Cardio"
            static let progress: String = "Workout Progress"
            static let settings: String = "Settings"
            
            enum Buttons {
                static let sessionLeft = "Pause"
                static let sessionRight = "Finish"
                static let progressLeft = "Export"
                static let progressRight = "Details"
            }
        }
        
        enum Overview {
            static let allWorkoutsButton = "All Workouts"
        }
    }
    
    enum Colors {
        static let navigationBackground: UIColor = .white
        static let active: UIColor = .init(hex: "#437BFE")
        static let inactive: UIColor = .init(hex: "#929DA5")
        static let separator: UIColor = .init(hex: "#E8ECEF")
        static let titleGray: UIColor = .init(hex: "#545C77")
        static let background: UIColor = .init(hex: "#F8F9F9")
        static let secondary: UIColor = .init(hex: "#F0F3FF")
        static let infoViewBackground: UIColor = .white
    }
    
    enum Images {
        enum TabBar {
            static func icon(for tab: Tabs) -> UIImage? {
                switch tab {
                case .overview: UIImage(named: "overview_tab")
                case .session: UIImage(named: "session_tab")
                case .progress: UIImage(named: "progress_tab")
                case .settings: UIImage(named: "settings_tab")
                }
            }
        }
        
        enum Common {
            static let arrowDown = UIImage(named: "arrow_down")
            static let addButton = UIImage(named: "add_button")
        }
    }
    
    enum Fonts {
        static func helveticaRegular(with size: CGFloat) -> UIFont {
            UIFont(name: "Helvetica", size: size) ?? UIFont()
        }
    }
}
