//
//  StatsItem.swift
//  WorkoutApp
//
//  Created by Vitaliy Talalay on 27.03.2024.
//

import class UIKit.UIImage

extension StatsItemView {
    struct StatsItem {
        let image: UIImage?
        let value: String
        let title: String
    }
    
    enum StatsItems {
        case totalDistance(value: String)
        case avaragePace(value: String)
        case heartbeat(value: String)
        case totalSteps(value: String)
        
        var item: StatsItemView.StatsItem {
            switch self {
            case .totalDistance(let value):
                StatsItemView.StatsItem.init(image: Resources.Images.Stats.totalDistance, value: "\(value) km", title: Resources.Strings.Session.totalDistance)
            case .avaragePace(let value):
                StatsItemView.StatsItem.init(image: Resources.Images.Stats.avaragePace, value: "\(value) / km", title: Resources.Strings.Session.avaragePace)
            case .heartbeat(let value):
                StatsItemView.StatsItem.init(image: Resources.Images.Stats.heartbeat, value: "\(value) bpm", title: Resources.Strings.Session.heartbeat)
            case .totalSteps(let value):
                StatsItemView.StatsItem.init(image: Resources.Images.Stats.totalSteps, value: "\(value)", title: Resources.Strings.Session.totalSteps)
            }
        }
    }
}
