//
//  TrainingData.swift
//  WorkoutApp
//
//  Created by Vitaliy Talalay on 02.04.2024.
//

import struct Foundation.Date

struct TrainingData {
    struct Training {
        let title: String
        let subtitle: String
        let isDone: Bool
    }
    
    let date: Date
    let items: [Training]
}
