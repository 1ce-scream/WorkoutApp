//
//  MockData.swift
//  WorkoutApp
//
//  Created by Vitaliy Talalay on 27.03.2024.
//

import struct UIKit.CGFloat

struct MockData {
    static let shared = MockData()
    
    private init() {}
    
    let timerDuration: CGFloat = 30
    let timerProgress: CGFloat = 0
    
    let heartRate: String = "155"
    let avarageDistance: String = "8'20''"
    let totalDistance: String = "8.25"
    let totalSteps: String = "7,682"
}
