//
//  TimerView.swift
//  WorkoutApp
//
//  Created by Vitaliy Talalay on 26.03.2024.
//

import UIKit

final class TimerView: BaseInfoView {
    private let progressView: ProgressView = {
        let view = ProgressView()
        view.drawProgress(0.7)
        return view
    }()
}

extension TimerView {
    override func setupViews() {
        super.setupViews()
        
        addViews(progressView)
    }
    override func setupConstraints() {
        super.setupConstraints()
        
        NSLayoutConstraint.activate([
            progressView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Constants.Session.Timer.progressPadding),
            progressView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.Session.Timer.progressPadding),
            progressView.topAnchor.constraint(equalTo: topAnchor, constant: Constants.Session.Timer.progressPadding),
            progressView.heightAnchor.constraint(equalTo: progressView.widthAnchor),
            
        ])
    }
    override func configureAppearance() {
        super.configureAppearance()
    }
}

