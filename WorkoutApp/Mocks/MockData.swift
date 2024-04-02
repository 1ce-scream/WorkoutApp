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
    
    let stepItems: [BarView.BarItem] = [
        .init(value: "8k", title: "2/14", heightMultiplier: 1),
        .init(value: "7k", title: "2/15", heightMultiplier: 0.8),
        .init(value: "5k", title: "2/16", heightMultiplier: 0.6),
        .init(value: "6k", title: "2/17", heightMultiplier: 0.7),
    ]
    
    let dailyPerformanceItems: [BarView.BarItem] = [
        .init(value: "1", title: "Mon", heightMultiplier: 0.2),
        .init(value: "2", title: "Tue", heightMultiplier: 0.4),
        .init(value: "3", title: "Wed", heightMultiplier: 0.6),
        .init(value: "4", title: "Thu", heightMultiplier: 0.8),
        .init(value: "5", title: "Fri", heightMultiplier: 1),
        .init(value: "3", title: "Sat", heightMultiplier: 0.6),
        .init(value: "2", title: "Sun", heightMultiplier: 0.4),
    ]
    
    let monthlyPerformanceData: [ChartsView.Data] = [
        .init(value: 45, title: "mar"),
        .init(value: 55, title: "apr"),
        .init(value: 60, title: "may"),
        .init(value: 65, title: "jun"),
        .init(value: 70, title: "jul"),
        .init(value: 80, title: "aug"),
        .init(value: 65, title: "sep"),
        .init(value: 45, title: "okt"),
        .init(value: 30, title: "nov"),
        .init(value: 15, title: "dec"),
    ]
    
    let trainingData: [TrainingData] = [
        .init(
            date: .now,
            items: [
                .init(title: "Warm Up Cardio", subtitle: "Stair Claimber * 10 minutes", isDone: true),
                .init(title: "High Intensity Cardio", subtitle: "Treadmill * 50 minutes", isDone: false)
            ]
        ),
        .init(
            date: .now,
            items: [
                .init(title: "Warm Up Cardio", subtitle: "Treadmill * 10 minutes", isDone: true),
                .init(title: "Chest Workout", subtitle: "Bench Press * 3 sets * 10 reps", isDone: false),
                .init(title: "Tricep Workout", subtitle: "Overhead Extension * 5 sets * 8 reps", isDone: false)
            ]
        ),
        .init(
            date: .now,
            items: [
                .init(title: "Cardio Interval Workout", subtitle: "Treadmill * 60 minutes", isDone: true),
                .init(title: "High Intensity Cardio", subtitle: "Treadmill * 50 minutes", isDone: false)
            ]
        ),
    ]
}
